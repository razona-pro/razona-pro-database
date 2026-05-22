DROP TABLE IF EXISTS razonapro.options;

CREATE TABLE razonapro.options (
    competence_id VARCHAR(6)   NOT NULL,
    question_id   VARCHAR(6)   NOT NULL,
    option_id     VARCHAR(6)   NOT NULL,
    option_text   VARCHAR(200) NOT NULL,
    is_correct    CHAR(1)      NOT NULL,
    CONSTRAINT FK_OPTIONS_QUESTIONS FOREIGN KEY (competence_id, question_id)
        REFERENCES razonapro.questions (competence_id, question_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CK_OPTIONS_IS_CORRECT CHECK (is_correct IN ('Y', 'N')),
    CONSTRAINT CK_OPTIONS_TEXT_NOTEMPTY CHECK (LENGTH(TRIM(option_text)) > 0),
    CONSTRAINT PK_OPTIONS PRIMARY KEY (competence_id, question_id, option_id)
);

-- Incorrecta por defecto, se marca Y solo cuando corresponde
ALTER TABLE razonapro.options
ALTER COLUMN is_correct
SET DEFAULT 'N';
