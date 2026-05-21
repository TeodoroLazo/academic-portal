# Configuración
$Token = "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"
$Owner = "TeodoroLazo"
$Repo = "academic-portal"
$LocalPath = "C:\PROYECTOS IA\academic-portal"
$Branch = "main"

$Headers = @{
    Authorization = "token $Token"
    'Content-Type' = 'application/json'
}

Write-Host "Iniciando sincronización..." -ForegroundColor Cyan

# Archivos y carpetas a ignorar
$IgnorePatterns = 'node_modules', '\.git', 'dist', 'sync\.ps1'

$Files = Get-ChildItem -Path $LocalPath -Recurse -File | Where-Object {
    $path = $_.FullName
    $ignore = $false
    foreach ($pattern in $IgnorePatterns) {
        if ($path -match $pattern) { $ignore = $true; break }
    }
    return -not $ignore
}

foreach ($File in $Files) {
    # 1. Calcular ruta relativa de forma segura
    # Quitamos la ruta base y normalizamos separadores
    $RelativePath = $File.FullName.Substring($LocalPath.Length).TrimStart('\', '/').Replace('\', '/')
    
    # 2. Construir URL
    $ApiUrl = "https://api.github.com/repos/$Owner/$Repo/contents/$RelativePath"
    
    # 3. Leer y codificar contenido
    $RawContent = Get-Content $File.FullName -Raw
    $Content = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($RawContent))
    
    $Body = @{
        message = "Auto-sync: Update $RelativePath"
        content = $Content
        branch  = $Branch
    }
    $JsonBody = $Body | ConvertTo-Json

    # 4. Intentar subir directamente
    try {
        Invoke-RestMethod -Uri $ApiUrl -Method Put -Headers $Headers -Body $JsonBody | Out-Null
        Write-Host "  OK: $RelativePath" -ForegroundColor Green
    } catch {
        # Si falla con 422, significa que el archivo existe y necesitamos su SHA
        if ($_.Exception.Response.StatusCode -eq 422) {
            Write-Host "  Actualizando existente: $RelativePath" -ForegroundColor Yellow
            try {
                # Obtener SHA del archivo actual en GitHub
                $GetUrl = "$ApiUrl?ref=$Branch"
                $Response = Invoke-RestMethod -Uri $GetUrl -Headers $Headers -Method Get
                $Sha = $Response.sha
                
                # Reintentar PUT con el SHA
                $Body.sha = $Sha
                $JsonBody = $Body | ConvertTo-Json
                Invoke-RestMethod -Uri $ApiUrl -Method Put -Headers $Headers -Body $JsonBody | Out-Null
                Write-Host "  OK (Updated): $RelativePath" -ForegroundColor Green
            } catch {
                Write-Host "  ERR: $RelativePath - $($_.Exception.Message)" -ForegroundColor Red
            }
        } else {
            Write-Host "  ERR: $RelativePath - $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

Write-Host "Sincronización completada." -ForegroundColor Cyan