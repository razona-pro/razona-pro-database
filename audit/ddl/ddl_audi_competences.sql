DROP TABLE IF EXISTS razonapro.audi_competences;

CREATE TABLE razonapro.audi_competences (
    row_id SERIAL NOT NULL,
    competence_id VARCHAR(6) NOT NULL,
    competence_name VARCHAR(30) NOT NULL,
    is_active CHAR(1) NOT NULL,
    registered_at TIMESTAMP NOT NULL,
    db_user VARCHAR(50) NOT NULL,
    action CHAR(1) NOT NULL,
    CONSTRAINT CK_AUDI_COMPETENCES_ACTION CHECK (action IN ('U', 'D')),
    CONSTRAINT PK_AUDI_COMPETENCES PRIMARY KEY (row_id)
);