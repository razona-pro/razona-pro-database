DROP TABLE IF EXISTS razonapro.ai_tried_responses;

CREATE TABLE razonapro.ai_tried_responses (
    program_id VARCHAR(3) NOT NULL,
    student_id VARCHAR(7) NOT NULL,
    ai_tried_id VARCHAR(10) NOT NULL,
    competence_id VARCHAR(6) NOT NULL,
    ai_tried_response_id VARCHAR(10) NOT NULL,
    question_text VARCHAR(300) NOT NULL,
    student_answer VARCHAR(200) NOT NULL,
    correct_answer VARCHAR(200) NOT NULL,
    is_correct CHAR(1) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    answered_at TIMESTAMP,
    CONSTRAINT FK_AI_TRIED_RESP_AI_TRIEDS FOREIGN KEY (program_id, student_id, ai_tried_id)
    REFERENCES razonapro.ai_trieds (program_id, student_id, ai_tried_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_AI_TRIED_RESP_COMPETENCES FOREIGN KEY (competence_id)
    REFERENCES razonapro.competences (competence_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CK_AI_TRIED_RESP_IS_CORRECT CHECK (is_correct IN ('Y', 'N')),
    CONSTRAINT CK_AI_TRIED_RESP_QUESTION_TEXT CHECK (LENGTH(TRIM(question_text)) > 0),
    CONSTRAINT CK_AI_TRIED_RESP_STUDENT_ANSWER CHECK (LENGTH(TRIM(student_answer)) > 0),
    CONSTRAINT CK_AI_TRIED_RESP_CORRECT_ANSWER CHECK (LENGTH(TRIM(correct_answer)) > 0),
    CONSTRAINT CK_AI_TRIED_RESP_ANSWERED_AT CHECK (answered_at IS NULL OR answered_at >= created_at),
    CONSTRAINT PK_AI_TRIED_RESPONSES PRIMARY KEY (program_id, student_id, ai_tried_id, ai_tried_response_id)
);

ALTER TABLE razonapro.ai_tried_responses
ALTER COLUMN created_at
SET DEFAULT CURRENT_TIMESTAMP;