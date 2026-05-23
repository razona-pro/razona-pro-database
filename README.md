# razona-pro-database

Scripts de la base de datos de RazonaPro. Modelo relacional implementado en PostgreSQL 15+ sobre Supabase con 14 tablas, triggers, validaciones, constraints y tablas de auditoría.

---

## Tecnologías

- PostgreSQL 15+
- Supabase

---

## Estructura del repositorio

```
razona-pro-database/
├── ddl/
│   ├── ddl_admins.sql
│   ├── ddl_programs.sql
│   ├── ddl_competences.sql
│   ├── ddl_rankings.sql
│   ├── ddl_students.sql
│   ├── ddl_questions.sql
│   ├── ddl_options.sql
│   ├── ddl_tests.sql
│   ├── ddl_tests_questions.sql
│   ├── ddl_trieds.sql
│   ├── ddl_students_responses.sql
│   ├── ddl_ai_trieds.sql
│   ├── ddl_ai_tried_responses.sql
│   └── ddl_rankings_students.sql
├── audit/
│   ├── ddl/
│   │   ├── ddl_audi_admins.sql
│   │   ├── ddl_audi_programs.sql
│   │   ├── ddl_audi_competences.sql
│   │   ├── ddl_audi_students.sql
│   │   ├── ddl_audi_tests.sql
│   │   ├── ddl_audi_questions.sql
│   │   └── ddl_audi_rankings.sql
│   └── triggers/
│       ├── trg_audi_admins.sql
│       ├── trg_audi_programs.sql
│       ├── trg_audi_competences.sql
│       ├── trg_audi_students.sql
│       ├── trg_audi_tests.sql
│       ├── trg_audi_questions.sql
│       └── trg_audi_rankings.sql
├── triggers/
│   ├── trg_updated_at.sql
│   ├── trg_calculate_scores.sql
│   ├── trg_correct_answers.sql
│   └── trg_rankings.sql
└── README.md
```

---

## Orden de ejecución

Los scripts deben ejecutarse en el siguiente orden.

### 1. Tablas principales

| # | Archivo | Depende de |
|---|---------|------------|
| 1 | `ddl/ddl_admins.sql` | — |
| 2 | `ddl/ddl_programs.sql` | — |
| 3 | `ddl/ddl_competences.sql` | — |
| 4 | `ddl/ddl_rankings.sql` | — |
| 5 | `ddl/ddl_students.sql` | programs |
| 6 | `ddl/ddl_questions.sql` | admins, competences |
| 7 | `ddl/ddl_options.sql` | questions |
| 8 | `ddl/ddl_tests.sql` | admins, competences |
| 9 | `ddl/ddl_tests_questions.sql` | admins, tests, questions |
| 10 | `ddl/ddl_trieds.sql` | students, tests |
| 11 | `ddl/ddl_students_responses.sql` | options, trieds |
| 12 | `ddl/ddl_ai_trieds.sql` | students |
| 13 | `ddl/ddl_ai_tried_responses.sql` | ai_trieds, competences |
| 14 | `ddl/ddl_rankings_students.sql` | rankings, students |

### 2. Tablas de auditoría

| # | Archivo |
|---|---------|
| 15 | `audit/ddl/ddl_audi_admins.sql` |
| 16 | `audit/ddl/ddl_audi_programs.sql` |
| 17 | `audit/ddl/ddl_audi_competences.sql` |
| 18 | `audit/ddl/ddl_audi_students.sql` |
| 19 | `audit/ddl/ddl_audi_tests.sql` |
| 20 | `audit/ddl/ddl_audi_questions.sql` |
| 21 | `audit/ddl/ddl_audi_rankings.sql` |

### 3. Triggers lógicos

| # | Archivo | Qué hace |
|---|---------|----------|
| 22 | `triggers/trg_updated_at.sql` | Actualiza `updated_at` automáticamente en todas las tablas que lo tienen |
| 23 | `triggers/trg_calculate_scores.sql` | Calcula el score de `trieds` y `ai_trieds` al pasar a `FINISHED` |
| 24 | `triggers/trg_correct_answers.sql` | Recuenta `correct_answers` en tiempo real al registrar respuestas |
| 25 | `triggers/trg_rankings.sql` | Recalcula el ranking del estudiante al finalizar un intento |

### 4. Triggers de auditoría

| # | Archivo |
|---|---------|
| 26 | `audit/triggers/trg_audi_admins.sql` |
| 27 | `audit/triggers/trg_audi_programs.sql` |
| 28 | `audit/triggers/trg_audi_competences.sql` |
| 29 | `audit/triggers/trg_audi_students.sql` |
| 30 | `audit/triggers/trg_audi_tests.sql` |
| 31 | `audit/triggers/trg_audi_questions.sql` |
| 32 | `audit/triggers/trg_audi_rankings.sql` |

---

## Autores

- Fabian Rojas — 0192270
- Andres Gomez — 0192250