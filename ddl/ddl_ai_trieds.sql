DROP TABLE IF EXISTS razonapro.ai_trieds;

CREATE TABLE razonapro.ai_trieds (
    program_id VARCHAR(3) NOT NULL,
    student_id VARCHAR(7) NOT NULL,
    ai_tried_id VARCHAR(10) NOT NULL,
    status VARCHAR(15) NOT NULL,
    score NUMERIC(7,2),
    total_questions INTEGER NOT NULL,
    correct_answers INTEGER,
    time_spent_seconds INTEGER,
    finished_at TIMESTAMP,
    attempt_timestamp TIMESTAMP NOT NULL,
    description VARCHAR(200),
    CONSTRAINT FK_AI_TRIEDS_STUDENTS FOREIGN KEY (student_id, program_id)
    REFERENCES razonapro.students (student_id, program_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CK_AI_TRIEDS_STATUS CHECK (status IN ('IN_PROGRESS', 'FINISHED', 'ABANDONED')), -- TIMED_OUT no aplica en sesiones IA
    CONSTRAINT CK_AI_TRIEDS_SCORE CHECK (score IS NULL OR (score >= 0 AND score <= 100)),
    CONSTRAINT CK_AI_TRIEDS_TOTAL_QUESTIONS CHECK (total_questions > 0),
    CONSTRAINT CK_AI_TRIEDS_CORRECT_ANSWERS CHECK (correct_answers IS NULL OR correct_answers >= 0),
    CONSTRAINT CK_AI_TRIEDS_CORRECT_LE_TOTAL CHECK (correct_answers IS NULL OR correct_answers <= total_questions),
    CONSTRAINT CK_AI_TRIEDS_TIME_SPENT CHECK (time_spent_seconds IS NULL OR time_spent_seconds > 0),
    CONSTRAINT CK_AI_TRIEDS_FINISHED_AT CHECK (finished_at IS NULL OR finished_at >= attempt_timestamp),
    CONSTRAINT CK_AI_TRIEDS_DESC_NOTEMPTY CHECK (description IS NULL OR LENGTH(TRIM(description)) > 0),
    CONSTRAINT PK_AI_TRIEDS PRIMARY KEY (program_id, student_id, ai_tried_id)
);

ALTER TABLE razonapro.ai_trieds
ALTER COLUMN status
SET DEFAULT 'IN_PROGRESS';

ALTER TABLE razonapro.ai_trieds
ALTER COLUMN correct_answers
SET DEFAULT 0;

ALTER TABLE razonapro.ai_trieds
ALTER COLUMN attempt_timestamp
SET DEFAULT CURRENT_TIMESTAMP;