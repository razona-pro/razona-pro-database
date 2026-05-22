DROP TABLE IF EXISTS razonapro.tests;

CREATE TABLE razonapro.tests (
    competence_id        VARCHAR(6)   NOT NULL,
    test_id              VARCHAR(8)   NOT NULL,
    admin_id             VARCHAR(6)   NOT NULL,
    test_name            VARCHAR(50)  NOT NULL,
    description          VARCHAR(100),
    duration_seconds     INTEGER      NOT NULL,
    is_active            CHAR(1)      NOT NULL,
    questions_to_present INTEGER,
    test_mode            VARCHAR(10)  NOT NULL,
    created_at           TIMESTAMP    NOT NULL,
    updated_at           TIMESTAMP,
    CONSTRAINT FK_TESTS_ADMINS FOREIGN KEY (admin_id)
        REFERENCES razonapro.admins (admin_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_TESTS_COMPETENCES FOREIGN KEY (competence_id)
        REFERENCES razonapro.competences (competence_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CK_TESTS_IS_ACTIVE CHECK (is_active IN ('Y', 'N')),
    CONSTRAINT CK_TESTS_MODE CHECK (test_mode IN ('PRACTICE', 'EXAM', 'TIMED')),
    CONSTRAINT CK_TESTS_DURATION_POSITIVE CHECK (duration_seconds > 0),
    CONSTRAINT CK_TESTS_QUESTIONS_TO_PRESENT CHECK (questions_to_present IS NULL OR questions_to_present > 0),
    CONSTRAINT CK_TESTS_NAME_NOTEMPTY CHECK (LENGTH(TRIM(test_name)) > 0),
    CONSTRAINT CK_TESTS_DESC_NOTEMPTY CHECK (description IS NULL OR LENGTH(TRIM(description)) > 0),
    CONSTRAINT CK_TESTS_UPDATED_AT CHECK (updated_at IS NULL OR updated_at >= created_at),
    CONSTRAINT PK_TESTS PRIMARY KEY (test_id, competence_id)
);

-- Activo por defecto al crear un test
ALTER TABLE razonapro.tests
ALTER COLUMN is_active
SET DEFAULT 'Y';

-- Timestamp automatico al momento de insertar
ALTER TABLE razonapro.tests
ALTER COLUMN created_at
SET DEFAULT CURRENT_TIMESTAMP;
