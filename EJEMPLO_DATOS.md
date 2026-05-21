# 📋 Ejemplo de Datos Generados

## Estructura de un Estudiante

Aquí hay un ejemplo real de los datos JSON que se generan:

```json
{
  "id": "#STU-90001",
  "name": "Benjamin Foster",
  "year": "Senior Year",
  "major": "Computer Science",
  "city": "San Francisco, CA",
  "email": "benjamin.foster@edu-manage.ac",
  "photoUrl": "https://ui-avatars.com/api/?name=Benjamin%20Foster&background=random&bold=true",
  "averageGrade": "3.82",
  "percentile": "95th Percentile",
  "rankBadge": "Top 10%",
  "attendancePercent": 94,
  "absencesCount": 2,
  "lastActive": "2 hours ago",
  "creditsCompleted": 112,
  "creditsTotal": 120,
  "professorNotes": "Strong analytical skills. Keep up the good work.",
  "monthlyGpa": [3.90, 3.75, 3.90, 3.60, 3.80, 3.95],
  "assignments": [
    {
      "id": "assign-1621612800000-0",
      "name": "Operating Systems: Kernel Module Project",
      "dueDate": "May 20, 2026",
      "status": "Graded",
      "score": 87,
      "type": "project",
      "feedback": "Excellent work! Shows deep understanding of the material.",
      "rubricScores": {
        "originality": true,
        "rigor": true,
        "citation": false,
        "clarity": true,
        "ethics": true
      },
      "documentTitle": "Operating Systems: Kernel Module Project - Submission by Daniel",
      "documentBody": "This is a sample submission for the Operating Systems: Kernel Module Project assignment. The student has completed all required components and submitted on time."
    },
    {
      "id": "assign-1621612800000-1",
      "name": "Web Development: Full Stack Application",
      "dueDate": "Jun 03, 2026",
      "status": "Submitted",
      "score": null,
      "type": "project",
      "rubricScores": {},
      "documentTitle": "Web Development: Full Stack Application - Submission by William",
      "documentBody": ""
    },
    {
      "id": "assign-1621612800000-2",
      "name": "Database Design: Optimization Techniques",
      "dueDate": "May 25, 2026",
      "status": "Awaiting Submission",
      "score": null,
      "type": "quiz",
      "rubricScores": {},
      "documentTitle": "Database Design: Optimization Techniques - Submission by Benjamin",
      "documentBody": ""
    },
    {
      "id": "assign-1621612800000-3",
      "name": "Algorithms: Dynamic Programming",
      "dueDate": "Mar 15, 2026",
      "status": "OVERDUE",
      "score": 0,
      "type": "essay",
      "feedback": "Outstanding contribution! This demonstrates mastery.",
      "rubricScores": {
        "originality": false,
        "rigor": false,
        "citation": true,
        "clarity": true,
        "ethics": true
      },
      "documentTitle": "Algorithms: Dynamic Programming - Submission by Michael",
      "documentBody": "This is a sample submission for the Algorithms: Dynamic Programming assignment. The student has completed all required components and submitted on time."
    },
    {
      "id": "assign-1621612800000-4",
      "name": "Software Architecture: Design Patterns",
      "dueDate": "Jun 10, 2026",
      "status": "Graded",
      "score": 92,
      "type": "thesis",
      "feedback": "Very solid implementation. Well structured and documented.",
      "rubricScores": {
        "originality": true,
        "rigor": false,
        "citation": true,
        "clarity": true,
        "ethics": false
      },
      "documentTitle": "Software Architecture: Design Patterns - Submission by Emma",
      "documentBody": "This is a sample submission for the Software Architecture: Design Patterns assignment. The student has completed all required components and submitted on time."
    }
  ],
  "courseProgress": [
    {
      "name": "Computer Science",
      "progress": 85
    },
    {
      "name": "General Education",
      "progress": 65
    },
    {
      "name": "Electives",
      "progress": 42
    }
  ]
}
```

## Estructura de summary.json

```json
{
  "totalStudents": 20,
  "generatedAt": "2026-05-21T11:34:48.751Z",
  "majors": [
    "Engineering",
    "Computer Science",
    "Economics",
    "Data Science",
    "Chemistry",
    "Biology",
    "Physics",
    "Mathematics"
  ],
  "averageGPA": "3.26",
  "assignments": 100,
  "dataFiles": {
    "allStudents": "students.json",
    "individualStudents": [
      "student-1.json",
      "student-2.json",
      "...",
      "student-20.json"
    ]
  }
}
```

## Variación de Estados de Asignaciones

### Asignación Calificada (Graded)
```json
{
  "status": "Graded",
  "score": 87,
  "feedback": "Excellent work!",
  "rubricScores": {
    "originality": true,
    "rigor": true,
    "citation": false,
    "clarity": true,
    "ethics": true
  }
}
```

### Asignación Presentada (Submitted)
```json
{
  "status": "Submitted",
  "score": null,
  "feedback": null,
  "rubricScores": {}
}
```

### Asignación Pendiente (Awaiting Submission)
```json
{
  "status": "Awaiting Submission",
  "score": null,
  "feedback": null,
  "rubricScores": {},
  "documentBody": ""
}
```

### Asignación Vencida (OVERDUE)
```json
{
  "status": "OVERDUE",
  "score": 0,
  "feedback": "Missed deadline"
}
```

## Tipos de Asignaciones

### Project
- Proyectos de programación
- Implementaciones
- Trabajos prácticos

### Quiz
- Pruebas de conocimiento
- Evaluaciones cortas
- Tests

### Essay
- Ensayos académicos
- Trabajos de investigación
- Análisis

### Thesis
- Tesis de grado
- Trabajos de investigación avanzados
- Capstone projects

## Rango de Valores

| Campo | Mín | Máx | Ejemplo |
|-------|-----|-----|---------|
| GPA | 2.5 | 4.0 | 3.82 |
| Percentil | 50 | 100 | 95th |
| Asistencia | 70% | 100% | 94% |
| Ausencias | 0 | 8 | 2 |
| Score (Graded) | 60 | 100 | 87 |
| Créditos Completados | 20 | 120 | 112 |
| Asignaciones/Estudiante | 4 | 6 | 5 |

## Archivos por Cantidad de Estudiantes

| Estudiantes | Tamaño JSON | Archivos |
|-------------|-------------|----------|
| 20 | 68 KB | 22 archivos |
| 50 | 170 KB | 52 archivos |
| 100 | 340 KB | 102 archivos |

## Descargar Datos Específicos

Los datos pueden descargarse desde:
- `/public/data/students.json` - Todos los estudiantes
- `/public/data/student-N.json` - Estudiante individual N
- `/public/data/summary.json` - Resumen estadístico

Para uso en testing o análisis posterior.
