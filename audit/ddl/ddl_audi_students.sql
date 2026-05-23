DROP TABLE IF EXISTS razonapro.audi_students;

CREATE TABLE razonapro.audi_students (
    row_id       SERIAL      NOT NULL,
    student_id        VARCHAR(7)  NOT NULL,
    program_id        VARCHAR(3)  NOT NULL,
    email             VARCHAR(50) NOT NULL,
    is_active         CHAR(1)     NOT NULL,
    email_verified    CHAR(1)     NOT NULL,
    identity_verified CHAR(1)     NOT NULL,
    registered_at    TIMESTAMP   NOT NULL,
    db_user           VARCHAR(50) NOT NULL,
    action            CHAR(1)     NOT NULL,
    CONSTRAINT CK_AUDI_STUDENTS_ACTION CHECK (action IN ('U', 'D')),
    CONSTRAINT PK_AUDI_STUDENTS PRIMARY KEY (row_id)
);
