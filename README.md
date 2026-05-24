# razona-pro-database

Scripts de base de datos para RazonaPro — evaluación Saber Pro UFPSO.  
Motor: **PostgreSQL 15+** · Esquema: `razonapro`  
**Autores:** Fabian Rojas (0192270) · Andres Gomez (0192250)

---

## Tablas principales (14)

| Tabla | PK |
|---|---|
| `admins` | `admin_id` VARCHAR(6) — `AMN###` |
| `programs` | `program_id` VARCHAR(3) — numérico |
| `competences` | `competence_id` VARCHAR(6) — `CPE###` |
| `rankings` | `ranking_id` VARCHAR(6) — `RKG###` |
| `students` | `student_id` VARCHAR(7) — numérico (`program_id` + 4 dígitos) |
| `questions` | `(competence_id, question_id)` — `QTN####` |
| `options` | `(competence_id, question_id, option_id)` — `OTN###` |
| `tests` | `(competence_id, test_id)` — `TET#####` |
| `tests_questions` | `test_question_id` INTEGER secuencia |
| `trieds` | `(program_id, student_id, competence_id, test_id, tried_id)` — `TRD#######` |
| `students_responses` | `student_response_id` VARCHAR(10) — `SRE#######` |
| `ai_trieds` | `(program_id, student_id, ai_tried_id)` — `ATD#######` |
| `ai_tried_responses` | `(program_id, student_id, ai_tried_id, ai_tried_response_id)` — `ATE#######` |
| `rankings_students` | `ranking_student_id` INTEGER secuencia |

## Tablas de auditoría (9)

`audi_admins` · `audi_programs` · `audi_competences` · `audi_students` · `audi_tests` · `audi_questions` · `audi_rankings` · `audi_options` · `audi_tests_questions`

Todas capturan `UPDATE` y `DELETE`. `students_responses` tiene un trigger que restringe operaciones según el estado del intento asociado.

---

### Convención de IDs (VARCHAR PKs)

El ID se forma con el acrónimo de la tabla + ceros hasta llenar el VARCHAR:

| Tabla | Acrónimo | Ejemplo | VARCHAR |
|---|---|---|---|
| admins | AMN | AMN001 | (6) |
| competences | CPE | CPE001 | (6) |
| rankings | RKG | RKG001 | (6) |
| questions | QTN | QTN0001 | (7) |
| options | OTN | OTN01 | (6) |
| tests | TET | TET00001 | (8) |
| trieds | TRD | TRD0000001 | (10) |
| students_responses | SRE | SRE0000001 | (10) |
| ai_trieds | ATD | ATD0000001 | (10) |
| ai_tried_responses | ATE | ATE0000001 | (10) |

> `program_id` y `student_id` usan solo números.  
> `test_question_id` y `ranking_student_id` son `INTEGER` con secuencia.

---

## Estructura

```
razona-pro-database/
├── ddl/                          # 14 archivos
├── audit/
│   ├── ddl/                      # 9 archivos
│   └── triggers/                 # 9 archivos
├── triggers/                     # 5 archivos
├── dml/                          # 14 archivos
│   └── csv/                      # 10 archivos
└── README.md
```

---

## Orden de ejecución

### 1 — DDL tablas principales

| # | Archivo |
|---|---|
| 01 | `ddl/ddl_admins.sql` |
| 02 | `ddl/ddl_programs.sql` |
| 03 | `ddl/ddl_competences.sql` |
| 04 | `ddl/ddl_rankings.sql` |
| 05 | `ddl/ddl_students.sql` |
| 06 | `ddl/ddl_questions.sql` |
| 07 | `ddl/ddl_options.sql` |
| 08 | `ddl/ddl_tests.sql` |
| 09 | `ddl/ddl_tests_questions.sql` |
| 10 | `ddl/ddl_trieds.sql` |
| 11 | `ddl/ddl_students_responses.sql` |
| 12 | `ddl/ddl_ai_trieds.sql` |
| 13 | `ddl/ddl_ai_tried_responses.sql` |
| 14 | `ddl/ddl_rankings_students.sql` |

### 2 — DDL auditoría

| # | Archivo |
|---|---|
| 15 | `audit/ddl/ddl_audi_admins.sql` |
| 16 | `audit/ddl/ddl_audi_programs.sql` |
| 17 | `audit/ddl/ddl_audi_competences.sql` |
| 18 | `audit/ddl/ddl_audi_students.sql` |
| 19 | `audit/ddl/ddl_audi_tests.sql` |
| 20 | `audit/ddl/ddl_audi_questions.sql` |
| 21 | `audit/ddl/ddl_audi_rankings.sql` |
| 22 | `audit/ddl/ddl_audi_options.sql` |
| 23 | `audit/ddl/ddl_audi_tests_questions.sql` |

### 3 — Triggers de negocio

| # | Archivo |
|---|---|
| 24 | `triggers/trg_updated_at.sql` |
| 25 | `triggers/trg_calculate_scores.sql` |
| 26 | `triggers/trg_correct_answers.sql` |
| 27 | `triggers/trg_rankings.sql` |
| 28 | `triggers/trg_restrict_students_responses.sql` |

### 4 — Triggers de auditoría

| # | Archivo |
|---|---|
| 29 | `audit/triggers/trg_audi_admins.sql` |
| 30 | `audit/triggers/trg_audi_programs.sql` |
| 31 | `audit/triggers/trg_audi_competences.sql` |
| 32 | `audit/triggers/trg_audi_students.sql` |
| 33 | `audit/triggers/trg_audi_tests.sql` |
| 34 | `audit/triggers/trg_audi_questions.sql` |
| 35 | `audit/triggers/trg_audi_rankings.sql` |
| 36 | `audit/triggers/trg_audi_options.sql` |
| 37 | `audit/triggers/trg_audi_tests_questions.sql` |

### 5 — DML

| # | Archivo | Método | Filas |
|---|---|---|---|
| 38 | `dml/dml_programs.sql` | COPY | 10 |
| 39 | `dml/dml_admins.sql` | COPY | 5 |
| 40 | `dml/dml_competences.sql` | COPY | 5 |
| 41 | `dml/dml_rankings.sql` | INSERT | 5 |
| 42 | `dml/dml_students.sql` | COPY | 502 |
| 43 | `dml/dml_questions.sql` | COPY | 5 000 |
| 44 | `dml/dml_options.sql` | COPY | 21 033 |
| 45 | `dml/dml_tests.sql` | INSERT | 10 |
| 46 | `dml/dml_tests_questions.sql` | INSERT | 200 |
| 47 | `dml/dml_trieds.sql` | COPY | 74 106 |
| 48 | `dml/dml_students_responses.sql` | COPY | 1 202 000 |
| 49 | `dml/dml_ai_trieds.sql` | COPY | 35 030 |
| 50 | `dml/dml_ai_tried_responses.sql` | COPY | 140 120 |
| 51 | `dml/dml_rankings_students.sql` | INSERT | 25 |

---

## Notas

El archivo `students_responses.csv` no se incluye directamente en el repositorio debido a que supera el límite de tamaño permitido por GitHub (100 MB).

Por esta razón, se adjuntó comprimido en formato `.rar` para el caso de carga masiva de datos.

Una vez descomprimido, el archivo debe ubicarse en la siguiente ruta: `dml\csv\`

> Se debe de ajustar la ruta en caso de que el repositorio se encuentre en una ubicación diferente.