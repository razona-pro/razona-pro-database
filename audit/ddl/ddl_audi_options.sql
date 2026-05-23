DROP TABLE IF EXISTS razonapro.audi_options;

CREATE TABLE razonapro.audi_options (
    row_id SERIAL NOT NULL,
    competence_id VARCHAR(6) NOT NULL,
    question_id VARCHAR(7) NOT NULL,
    option_id VARCHAR(6) NOT NULL,
    option_text VARCHAR(200) NOT NULL,
    is_correct CHAR(1) NOT NULL,
    registered_at TIMESTAMP NOT NULL,
    db_user VARCHAR(50) NOT NULL,
    action CHAR(1) NOT NULL,
    CONSTRAINT pk_audi_options PRIMARY KEY (row_id),
    CONSTRAINT ck_audi_options_action CHECK (action IN ('U','D'))
);