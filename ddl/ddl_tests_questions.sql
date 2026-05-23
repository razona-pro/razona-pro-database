DROP TABLE IF EXISTS razonapro.tests_questions;
DROP SEQUENCE IF EXISTS razonapro.seq_test_question_id;

CREATE TABLE razonapro.tests_questions (
    admin_id VARCHAR(6) NOT NULL,
    competence_id VARCHAR(6) NOT NULL,
    test_id VARCHAR(8) NOT NULL,
    question_id VARCHAR(7) NOT NULL,
    test_question_id INTEGER NOT NULL,
    question_order INTEGER,
    is_active CHAR(1) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    CONSTRAINT FK_TESTS_QUESTIONS_TESTS FOREIGN KEY (test_id, competence_id)
    REFERENCES razonapro.tests (test_id, competence_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_TESTS_QUESTIONS_QUESTIONS FOREIGN KEY (competence_id, question_id)
    REFERENCES razonapro.questions (competence_id, question_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_TESTS_QUESTIONS_ADMINS FOREIGN KEY (admin_id)
    REFERENCES razonapro.admins (admin_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT UN_TESTS_QUESTIONS UNIQUE (competence_id, test_id, question_id),
    CONSTRAINT CK_TESTS_QUESTIONS_IS_ACTIVE CHECK (is_active IN ('Y', 'N')),
    CONSTRAINT CK_TESTS_QUESTIONS_ORDER CHECK (question_order IS NULL OR question_order > 0),
    CONSTRAINT CK_TESTS_QUESTIONS_UPDATED_AT CHECK (updated_at IS NULL OR updated_at >= created_at),
    CONSTRAINT PK_TESTS_QUESTIONS PRIMARY KEY (test_question_id)
);

CREATE SEQUENCE razonapro.seq_test_question_id START WITH 1 INCREMENT BY 1;

ALTER TABLE razonapro.tests_questions
ALTER COLUMN test_question_id
SET DEFAULT nextval('razonapro.seq_test_question_id');

ALTER TABLE razonapro.tests_questions
ALTER COLUMN is_active
SET DEFAULT 'Y';

ALTER TABLE razonapro.tests_questions
ALTER COLUMN created_at
SET DEFAULT CURRENT_TIMESTAMP;