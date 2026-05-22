DROP TABLE IF EXISTS razonapro.competences;

CREATE TABLE razonapro.competences (
    competence_id   VARCHAR(6)   NOT NULL,
    competence_name VARCHAR(30)  NOT NULL,
    description     VARCHAR(100),
    is_active       CHAR(1)      NOT NULL,
    created_at      TIMESTAMP    NOT NULL,
    updated_at      TIMESTAMP,
    CONSTRAINT CK_COMPETENCES_IS_ACTIVE CHECK (is_active IN ('Y', 'N')),
    CONSTRAINT CK_COMPETENCES_NAME_NOTEMPTY CHECK (LENGTH(TRIM(competence_name)) > 0),
    CONSTRAINT CK_COMPETENCES_DESC_NOTEMPTY CHECK (description IS NULL OR LENGTH(TRIM(description)) > 0),
    CONSTRAINT CK_COMPETENCES_UPDATED_AT CHECK (updated_at IS NULL OR updated_at >= created_at),
    CONSTRAINT PK_COMPETENCES PRIMARY KEY (competence_id)
);

-- Activo por defecto al crear una competencia
ALTER TABLE razonapro.competences
ALTER COLUMN is_active
SET DEFAULT 'Y';

-- Timestamp automatico al momento de insertar
ALTER TABLE razonapro.competences
ALTER COLUMN created_at
SET DEFAULT CURRENT_TIMESTAMP;
