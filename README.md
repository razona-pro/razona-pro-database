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
└── ddl/
    ├── ddl_admins.sql
    ├── ddl_programs.sql
    ├── ddl_competences.sql
    ├── ddl_rankings.sql
    ├── ddl_students.sql
    ├── ddl_questions.sql
    ├── ddl_options.sql
    ├── ddl_tests.sql
    ├── ddl_tests_questions.sql
    ├── ddl_trieds.sql
    ├── ddl_students_responses.sql
    ├── ddl_ai_trieds.sql
    ├── ddl_ai_tried_responses.sql
    └── ddl_rankings_students.sql
```

---

## Orden de ejecución

Los scripts deben ejecutarse en el siguiente orden para respetar las dependencias entre tablas:

1. `ddl_admins.sql`
2. `ddl_programs.sql`
3. `ddl_competences.sql`
4. `ddl_rankings.sql`
5. `ddl_students.sql`
6. `ddl_questions.sql`
7. `ddl_options.sql`
8. `ddl_tests.sql`
9. `ddl_tests_questions.sql`
10. `ddl_trieds.sql`
11. `ddl_students_responses.sql`
12. `ddl_ai_trieds.sql`
13. `ddl_ai_tried_responses.sql`
14. `ddl_rankings_students.sql`

---

## Autores

- Fabian Rojas — 192270
- Andres Gomez — 192250