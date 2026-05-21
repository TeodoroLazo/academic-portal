# Generador de Datos de Prueba

Este proyecto incluye un sistema para generar datos JSON realistas para pruebas de la aplicación Academic Portal.

## Características

- ✅ Genera estudiantes con datos realistas y variados
- ✅ Crea asignaciones con diferentes estados (Graded, Submitted, Awaiting Submission, OVERDUE)
- ✅ Genera múltiples ficheros JSON organizados
- ✅ Soporta configuración de cantidad de estudiantes
- ✅ Datos completamente aleatorios pero coherentes

## Uso Rápido

### Generar 20 estudiantes (por defecto):
```bash
npm run generate-data
```

### Generar 100 estudiantes:
```bash
npm run generate-data:large
```

### Generar cantidad personalizada:
```bash
tsx scripts/generateTestData.ts 50
```

## Archivos Generados

Se crean en la carpeta `public/data/`:

```
public/data/
├── students.json              # Todos los estudiantes en un archivo
├── summary.json               # Resumen estadístico de los datos
├── student-1.json             # Estudiante individual #1
├── student-2.json             # Estudiante individual #2
└── ... student-N.json
```

## Qué Contiene Cada Estudiante

Cada estudiante incluye:

- **Datos Personales**
  - ID único (STU-XXXXX)
  - Nombre completo
  - Email
  - Foto de perfil (generada con UI Avatars)
  - Ciudad
  - Año académico
  - Mayor/especialidad

- **Métricas Académicas**
  - GPA promedio (2.5 - 4.0)
  - Percentil
  - Insignia de rango
  - Asistencia %
  - Ausencias
  - Créditos completados

- **Actividad**
  - Última actividad
  - Notas del profesor
  - GPA mensual (6 meses)

- **Asignaciones** (4-6 por estudiante)
  - Nombre del proyecto/quiz
  - Fecha de entrega
  - Estado (Graded, Submitted, etc.)
  - Puntuación (si está calificada)
  - Tipo (project, quiz, essay, thesis)
  - Feedback automático
  - Puntuaciones de rúbrica

- **Progreso de Cursos**
  - Nombre del curso
  - Porcentaje de progreso

## Estructura de Datos

### Tipo Student
```typescript
interface Student {
  id: string;
  name: string;
  year: string;
  major: string;
  city: string;
  email: string;
  photoUrl: string;
  averageGrade: string;
  percentile: string;
  rankBadge: string;
  attendancePercent: number;
  absencesCount: number;
  lastActive: string;
  creditsCompleted: number;
  creditsTotal: number;
  professorNotes: string;
  monthlyGpa: number[];
  assignments: Assignment[];
  courseProgress?: CourseProgress[];
}
```

### Tipo Assignment
```typescript
interface Assignment {
  id: string;
  name: string;
  dueDate: string;
  status: 'Graded' | 'Submitted' | 'Awaiting Submission' | 'OVERDUE';
  score: number | null;
  type: 'project' | 'quiz' | 'essay' | 'thesis';
  feedback?: string;
  rubricScores?: {
    originality?: boolean;
    rigor?: boolean;
    citation?: boolean;
    clarity?: boolean;
    ethics?: boolean;
  };
  documentTitle?: string;
  documentBody?: string;
}
```

## Cómo Funciona la Aplicación

1. **Al iniciar** (`App.tsx`):
   - Intenta cargar `/data/students.json` (datos generados)
   - Si no existe, carga desde localStorage
   - Si no hay nada guardado, usa los datos por defecto (INITIAL_STUDENTS)

2. **Datos Generados**:
   - Se guardan automáticamente en localStorage
   - Se pueden editar en la UI (notas del profesor, calificaciones)
   - Los cambios persisten entre recargas

## Personalización

### Cambiar cantidad de estudiantes por defecto

Edita `package.json`:
```json
"generate-data": "tsx scripts/generateTestData.ts 30"
```

### Agregar más datos de prueba

Edita `scripts/generateTestData.ts`:
- Modifica los arrays `FIRST_NAMES`, `LAST_NAMES`, `MAJORS`, etc.
- Ajusta funciones como `generateMonthlyGpa()`, `getRandomScore()`, etc.

## Notas Técnicas

- Los datos son **completamente aleatorios** (no hay datos reales)
- Las fotos se generan con [UI Avatars](https://ui-avatars.com/)
- Se guardan como JSON estándar, fáciles de modificar
- Compatible con navegadores modernos
- Los datos se sirven como archivos estáticos en `/public/data/`

## Troubleshooting

**P: "No encuentro los archivos generados"**  
R: Verifica que la carpeta `public/data/` existe. Ejecuta `npm run generate-data` nuevamente.

**P: "La aplicación no carga los datos generados"**  
R: Abre DevTools (F12), verifica que no haya errores CORS. Los archivos deben estar en `public/data/`.

**P: "Quiero volver a los datos por defecto"**  
R: Limpia localStorage en DevTools y recarga la página, o elimina la carpeta `public/data/`.

## Integración CI/CD

Para generar datos automáticamente en tu build:

```bash
# package.json
"prebuild": "npm run generate-data",
"build": "vite build && ..."
```

## Licencia

Datos generados para propósitos de desarrollo y testing. Todos los nombres y datos son ficticios.
