DROP TABLE IF EXISTS razonapro.audi_tests_questions;

CREATE TABLE razonapro.audi_tests_questions (
    row_id SERIAL NOT NULL,
    test_question_id INTEGER NOT NULL,
    admin_id VARCHAR(6) NOT NULL,
    competence_id VARCHAR(6) NOT NULL,
    test_id VARCHAR(8) NOT NULL,
    question_id VARCHAR(7) NOT NULL,
    question_order INTEGER NOT NULL,
    is_active CHAR(1) NOT NULL,
    registered_at TIMESTAMP NOT NULL,
    db_user VARCHAR(50) NOT NULL,
    action CHAR(1) NOT NULL,
    CONSTRAINT pk_audi_tests_questions PRIMARY KEY (row_id),
    CONSTRAINT ck_audi_tests_questions_action CHECK (action IN ('U','D'))
);