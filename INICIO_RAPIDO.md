## ⚡ Inicio Rápido - Generador de Datos

### 1️⃣ Instalar y Generar (Una Sola Vez)
```bash
npm install
npm run generate-data
```

### 2️⃣ Iniciar la Aplicación
```bash
npm run dev
```

✅ **¡Listo!** La app cargará automáticamente con 20 estudiantes generados.

---

## 📊 Ver Datos Generados

```bash
# Ver estadísticas
npm run data-utils info

# Listar archivos JSON
npm run data-utils list

# Buscar un estudiante
npm run data-utils search "Benjamin"
```

---

## 🎯 Caso de Uso: Testing con Muchos Estudiantes

```bash
# Generar 100 estudiantes
npm run generate-data:large

# Reiniciar app
npm run dev
```

---

## 📝 Caso de Uso: Respaldar y Regenerar Datos

```bash
# Hacer backup de datos actuales
npm run data-utils backup

# Generar nuevos datos aleatorios
npm run generate-data

# Ver el nuevo dataset
npm run data-utils info
```

---

## 🔄 Limpiar y Empezar de Cero

```bash
# Eliminar todos los datos generados
npm run data-utils clean

# Generar nuevamente
npm run generate-data

# Abrir app (usará datos por defecto si no hay generados)
npm run dev
```

---

## 📂 Dónde Están Los Datos

```
public/data/
├── students.json           ← Todos los estudiantes
├── summary.json            ← Estadísticas
└── student-1.json ... student-20.json
```

Puedes descargar estos archivos para usar en otros proyectos.

---

## 🐛 Algo No Funciona?

### "No carga los datos"
```bash
# Verificar que existen los archivos
npm run data-utils list

# Si no existen, regenerar
npm run generate-data
```

### "Los datos cambiaron pero persisten"
- Los datos se guardan en **localStorage**
- Limpia el navegador: F12 → Application → Clear Storage
- Recarga la página

### "Quiero los datos por defecto"
```bash
npm run data-utils clean
npm run dev
```

---

## 📚 Más Información

- **Guía Completa**: [GENERADOR_DATOS.md](GENERADOR_DATOS.md)
- **Comandos Disponibles**: [COMANDOS_DATOS.md](COMANDOS_DATOS.md)
- **Ejemplos de JSON**: [EJEMPLO_DATOS.md](EJEMPLO_DATOS.md)
- **Implementación**: [DATOS_GENERADOS.md](DATOS_GENERADOS.md)

---

## ✨ Lo Que Se Generó

Cada estudiante incluye:
- ✅ Perfil completo (nombre, email, foto)
- ✅ GPA y métricas académicas
- ✅ 4-6 asignaciones con estados reales
- ✅ Feedback del profesor
- ✅ Progreso en cursos

**Total: 20 estudiantes × 5 asignaciones = 100 tareas de prueba**

---

¿Necesitas más ayuda? Abre [ESTRUCTURA_FINAL.md](ESTRUCTURA_FINAL.md) para ver toda la documentación.
