DROP TABLE IF EXISTS razonapro.questions;

CREATE TABLE razonapro.questions (
    competence_id VARCHAR(6) NOT NULL,
    question_id VARCHAR(7) NOT NULL,
    admin_id VARCHAR(6) NOT NULL,
    statement VARCHAR(2000) NOT NULL,
    explanation VARCHAR(2000),
    source VARCHAR(50),
    difficulty_level CHAR(1) NOT NULL,
    is_active CHAR(1) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    CONSTRAINT FK_QUESTIONS_ADMINS FOREIGN KEY (admin_id)
    REFERENCES razonapro.admins (admin_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_QUESTIONS_COMPETENCES FOREIGN KEY (competence_id)
    REFERENCES razonapro.competences (competence_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CK_QUESTIONS_IS_ACTIVE CHECK (is_active IN ('Y', 'N')),
    CONSTRAINT CK_QUESTIONS_DIFFICULTY_LEVEL CHECK (difficulty_level IN ('B', 'M', 'A')), -- B=Basico | M=Medio | A=Alto
    CONSTRAINT CK_QUESTIONS_STATEMENT_NOTEMPTY CHECK (LENGTH(TRIM(statement)) > 0),
    CONSTRAINT CK_QUESTIONS_EXPLANATION_NOTEMPTY CHECK (explanation IS NULL OR LENGTH(TRIM(explanation)) > 0),
    CONSTRAINT CK_QUESTIONS_SOURCE_NOTEMPTY CHECK (source IS NULL OR LENGTH(TRIM(source)) > 0),
    CONSTRAINT CK_QUESTIONS_UPDATED_AT CHECK (updated_at IS NULL OR updated_at >= created_at),
    CONSTRAINT PK_QUESTIONS PRIMARY KEY (competence_id, question_id)
);

ALTER TABLE razonapro.questions
ALTER COLUMN is_active
SET DEFAULT 'Y';

ALTER TABLE razonapro.questions
ALTER COLUMN created_at
SET DEFAULT CURRENT_TIMESTAMP;