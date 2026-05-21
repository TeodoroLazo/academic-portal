# 🎓 Comandos de Generación de Datos

## Generar Datos de Prueba

```bash
# Generar 20 estudiantes (por defecto)
npm run generate-data

# Generar 100 estudiantes
npm run generate-data:large

# Generar cantidad personalizada
tsx scripts/generateTestData.ts 50
```

## Gestionar Datos

```bash
# Ver información del dataset actual
npm run data-utils info

# Listar todos los archivos de datos
npm run data-utils list

# Hacer backup de los datos
npm run data-utils backup

# Buscar estudiante por nombre
npm run data-utils search "Benjamin"

# Limpiar todos los datos generados
npm run data-utils clean
```

## Estructura de Archivos Generados

```
public/data/
├── students.json          # Todos los estudiantes (68 KB para 20)
├── summary.json           # Estadísticas del dataset
├── student-1.json         # Estudiante individual #1
├── student-2.json         # Estudiante individual #2
└── ... student-20.json    # Último estudiante
```

## Qué Incluye Cada Estudiante

- ✅ ID único y perfil completo
- ✅ Métricas académicas (GPA, percentil, rango)
- ✅ Asistencia y actividad
- ✅ 4-6 asignaciones con estados variados
- ✅ Feedback automático para calificaciones
- ✅ Progreso de cursos
- ✅ Notas del profesor

## Cómo Se Cargan los Datos

1. **Primer inicio**: Intenta cargar `/data/students.json`
2. **Sin datos generados**: Usa localStorage o datos por defecto
3. **Persistencia**: Los cambios se guardan en localStorage

## Estadísticas Actuales

```
Total estudiantes: 20
Total asignaciones: 100
GPA promedio: 3.26
Especialidades: 8 diferentes
```

## Ejemplos de Uso

### Generar datos grandes para testing
```bash
npm run generate-data:large  # 100 estudiantes, ~350 KB
```

### Crear backup antes de generar nuevos datos
```bash
npm run data-utils backup
npm run generate-data
```

### Buscar estudiante específico
```bash
npm run data-utils search "Johnson"
```

### Limpiar todo y empezar de cero
```bash
npm run data-utils clean
npm run generate-data
```

---

Ver [GENERADOR_DATOS.md](GENERADOR_DATOS.md) para documentación completa.
