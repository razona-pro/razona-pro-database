DROP TABLE IF EXISTS razonapro.rankings_students;
DROP SEQUENCE IF EXISTS razonapro.seq_ranking_student_id;

CREATE TABLE razonapro.rankings_students (
    program_id         VARCHAR(3)   NOT NULL,
    student_id         VARCHAR(7)   NOT NULL,
    ranking_id         VARCHAR(6)   NOT NULL,
    ranking_student_id INTEGER      NOT NULL,
    period_start       DATE,
    period_end         DATE,
    total_score        NUMERIC(8,2) NOT NULL,
    trieds_score       NUMERIC(7,2) NOT NULL,
    ai_trieds_score    NUMERIC(7,2) NOT NULL,
    trieds_count       INTEGER      NOT NULL,
    ai_trieds_count    INTEGER      NOT NULL,
    created_at         TIMESTAMP    NOT NULL,
    last_activity_at   TIMESTAMP,
    updated_at         TIMESTAMP,
    CONSTRAINT FK_RANK_STUD_RANKINGS FOREIGN KEY (ranking_id)
        REFERENCES razonapro.rankings (ranking_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_RANK_STUD_STUDENTS FOREIGN KEY (student_id, program_id)
        REFERENCES razonapro.students (student_id, program_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    -- rankings GENERAL tienen period_start/end = NULL y ese par debe seguir siendo unico
    CONSTRAINT UN_RANKINGS_STUDENTS UNIQUE NULLS NOT DISTINCT (ranking_id, program_id, student_id, period_start, period_end),
    CONSTRAINT CK_RANK_STUD_TOTAL_SCORE CHECK (total_score >= 0),
    CONSTRAINT CK_RANK_STUD_TRIEDS_SCORE CHECK (trieds_score >= 0),
    CONSTRAINT CK_RANK_STUD_AI_TRIEDS_SCORE CHECK (ai_trieds_score >= 0),
    CONSTRAINT CK_RANK_STUD_TRIEDS_COUNT CHECK (trieds_count >= 0),
    CONSTRAINT CK_RANK_STUD_AI_TRIEDS_COUNT CHECK (ai_trieds_count >= 0),
    CONSTRAINT CK_RANK_STUD_PERIOD_ORDER CHECK (period_start IS NULL OR period_end IS NULL OR period_end >= period_start),
    CONSTRAINT CK_RANK_STUD_PERIOD_BOTH_OR_NONE CHECK ((period_start IS NULL AND period_end IS NULL) OR (period_start IS NOT NULL AND period_end IS NOT NULL)),
    CONSTRAINT CK_RANK_STUD_UPDATED_AT CHECK (updated_at IS NULL OR updated_at >= created_at),
    CONSTRAINT CK_RANK_STUD_LAST_ACTIVITY CHECK (last_activity_at IS NULL OR last_activity_at >= created_at),
    CONSTRAINT PK_RANKINGS_STUDENTS PRIMARY KEY (ranking_student_id)
);

CREATE SEQUENCE razonapro.seq_ranking_student_id START WITH 1 INCREMENT BY 1;

-- ID autogenerado por secuencia
ALTER TABLE razonapro.rankings_students
ALTER COLUMN ranking_student_id
SET DEFAULT nextval('razonapro.seq_ranking_student_id');

-- Puntajes en cero al crear la entrada del estudiante en el ranking
ALTER TABLE razonapro.rankings_students
ALTER COLUMN total_score
SET DEFAULT 0;

ALTER TABLE razonapro.rankings_students
ALTER COLUMN trieds_score
SET DEFAULT 0;

ALTER TABLE razonapro.rankings_students
ALTER COLUMN ai_trieds_score
SET DEFAULT 0;

-- Conteos en cero al crear la entrada del estudiante en el ranking
ALTER TABLE razonapro.rankings_students
ALTER COLUMN trieds_count
SET DEFAULT 0;

ALTER TABLE razonapro.rankings_students
ALTER COLUMN ai_trieds_count
SET DEFAULT 0;

-- Timestamp automatico al momento de insertar
ALTER TABLE razonapro.rankings_students
ALTER COLUMN created_at
SET DEFAULT CURRENT_TIMESTAMP;