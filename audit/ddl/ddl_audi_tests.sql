DROP TABLE IF EXISTS razonapro.audi_tests;

CREATE TABLE razonapro.audi_tests (
    row_id SERIAL NOT NULL,
    test_id VARCHAR(8) NOT NULL,
    competence_id VARCHAR(6) NOT NULL,
    test_name VARCHAR(50) NOT NULL,
    test_mode VARCHAR(10) NOT NULL,
    duration_seconds INTEGER NOT NULL,
    is_active CHAR(1) NOT NULL,
    registered_at TIMESTAMP NOT NULL,
    db_user VARCHAR(50) NOT NULL,
    action CHAR(1) NOT NULL,
    CONSTRAINT CK_AUDI_TESTS_ACTION CHECK (action IN ('U', 'D')),
    CONSTRAINT PK_AUDI_TESTS PRIMARY KEY (row_id)
);