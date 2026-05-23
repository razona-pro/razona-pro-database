DROP TABLE IF EXISTS razonapro.audi_questions;

CREATE TABLE razonapro.audi_questions (
    row_id SERIAL NOT NULL,
    competence_id VARCHAR(6) NOT NULL,
    question_id VARCHAR(6) NOT NULL,
    difficulty_level CHAR(1) NOT NULL,
    is_active CHAR(1) NOT NULL,
    registered_at TIMESTAMP NOT NULL,
    db_user VARCHAR(50) NOT NULL,
    action CHAR(1) NOT NULL,
    CONSTRAINT CK_AUDI_QUESTIONS_ACTION CHECK (action IN ('U', 'D')),
    CONSTRAINT PK_AUDI_QUESTIONS PRIMARY KEY (row_id)
);