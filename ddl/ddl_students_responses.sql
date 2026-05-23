DROP TABLE IF EXISTS razonapro.students_responses;

CREATE TABLE razonapro.students_responses (
    competence_id VARCHAR(6) NOT NULL,
    test_id VARCHAR(8) NOT NULL,
    program_id VARCHAR(3) NOT NULL,
    student_id VARCHAR(7) NOT NULL,
    tried_id VARCHAR(10) NOT NULL,
    question_id VARCHAR(6) NOT NULL,
    option_id VARCHAR(6) NOT NULL,
    student_response_id VARCHAR(10) NOT NULL,
    is_correct CHAR(1) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    answered_at TIMESTAMP,
    CONSTRAINT FK_STUD_RESP_OPTIONS FOREIGN KEY (competence_id, question_id, option_id)
    REFERENCES razonapro.options (competence_id, question_id, option_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_STUD_RESP_TRIEDS FOREIGN KEY (competence_id, test_id, program_id, student_id, tried_id)
    REFERENCES razonapro.trieds (competence_id, test_id, program_id, student_id, tried_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT UN_STUDENTS_RESPONSES UNIQUE (competence_id, test_id, program_id, student_id, tried_id, question_id),
    CONSTRAINT CK_STUD_RESP_IS_CORRECT CHECK (is_correct IN ('Y', 'N')), -- se persiste para preservar historico ante cambios futuros en options
    CONSTRAINT CK_STUD_RESP_ANSWERED_AT CHECK (answered_at IS NULL OR answered_at >= created_at),
    CONSTRAINT PK_STUDENTS_RESPONSES PRIMARY KEY (student_response_id)
);

ALTER TABLE razonapro.students_responses
ALTER COLUMN created_at
SET DEFAULT CURRENT_TIMESTAMP;