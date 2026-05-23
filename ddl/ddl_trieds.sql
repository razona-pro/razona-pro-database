DROP TABLE IF EXISTS razonapro.trieds;

CREATE TABLE razonapro.trieds (
    program_id VARCHAR(3) NOT NULL,
    student_id VARCHAR(7) NOT NULL,
    competence_id VARCHAR(6) NOT NULL,
    test_id VARCHAR(8) NOT NULL,
    tried_id VARCHAR(10) NOT NULL,
    status VARCHAR(15) NOT NULL,
    score NUMERIC(7,2),
    time_spent_seconds INTEGER,
    total_questions INTEGER NOT NULL,
    correct_answers INTEGER,
    attempt_timestamp TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    finished_at TIMESTAMP,
    CONSTRAINT FK_TRIEDS_STUDENTS FOREIGN KEY (student_id, program_id)
    REFERENCES razonapro.students (student_id, program_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_TRIEDS_TESTS FOREIGN KEY (test_id, competence_id)
    REFERENCES razonapro.tests (test_id, competence_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CK_TRIEDS_STATUS CHECK (status IN ('IN_PROGRESS', 'FINISHED', 'ABANDONED', 'TIMED_OUT')),
    CONSTRAINT CK_TRIEDS_SCORE CHECK (score IS NULL OR (score >= 0 AND score <= 100)),
    CONSTRAINT CK_TRIEDS_TOTAL_QUESTIONS CHECK (total_questions > 0),
    CONSTRAINT CK_TRIEDS_CORRECT_ANSWERS CHECK (correct_answers IS NULL OR correct_answers >= 0),
    CONSTRAINT CK_TRIEDS_CORRECT_LE_TOTAL CHECK (correct_answers IS NULL OR correct_answers <= total_questions),
    CONSTRAINT CK_TRIEDS_TIME_SPENT CHECK (time_spent_seconds IS NULL OR time_spent_seconds > 0),
    CONSTRAINT CK_TRIEDS_FINISHED_AT CHECK (finished_at IS NULL OR finished_at >= attempt_timestamp),
    CONSTRAINT CK_TRIEDS_UPDATED_AT CHECK (updated_at IS NULL OR updated_at >= created_at),
    CONSTRAINT PK_TRIEDS PRIMARY KEY (competence_id, test_id, program_id, student_id, tried_id)
);

ALTER TABLE razonapro.trieds
ALTER COLUMN status
SET DEFAULT 'IN_PROGRESS';

ALTER TABLE razonapro.trieds
ALTER COLUMN correct_answers
SET DEFAULT 0;

ALTER TABLE razonapro.trieds
ALTER COLUMN attempt_timestamp
SET DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE razonapro.trieds
ALTER COLUMN created_at
SET DEFAULT CURRENT_TIMESTAMP;