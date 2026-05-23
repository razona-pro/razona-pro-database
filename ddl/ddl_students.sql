DROP TABLE IF EXISTS razonapro.students;

CREATE TABLE razonapro.students (
    student_id VARCHAR(7) NOT NULL,
    program_id VARCHAR(3) NOT NULL,
    first_name VARCHAR(15) NOT NULL,
    second_name VARCHAR(15),
    first_surname VARCHAR(15) NOT NULL,
    second_surname VARCHAR(15),
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    password_hash VARCHAR(72) NOT NULL,
    is_active CHAR(1) NOT NULL,
    email_verified CHAR(1) NOT NULL,
    identity_verified CHAR(1) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    last_login_at TIMESTAMP,
    CONSTRAINT FK_STUDENTS_PROGRAMS FOREIGN KEY (program_id)
    REFERENCES razonapro.programs (program_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT UN_STUDENTS_EMAIL UNIQUE (email),
    CONSTRAINT UN_STUDENTS_PHONE UNIQUE (phone),
    CONSTRAINT CK_STUDENTS_ID_FMT CHECK (student_id ~ '^[0-9]{7}$'),
    CONSTRAINT CK_STUDENTS_ID_PROGRAM CHECK (LEFT(student_id, 3) = program_id),
    CONSTRAINT CK_STUDENTS_IS_ACTIVE CHECK (is_active IN ('Y', 'N')),
    CONSTRAINT CK_STUDENTS_EMAIL_VERIFIED CHECK (email_verified IN ('Y', 'N')),
    CONSTRAINT CK_STUDENTS_IDENTITY_VERIFIED CHECK (identity_verified IN ('Y', 'N')),
    CONSTRAINT CK_STUDENTS_EMAIL_FMT CHECK (email ~* '^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$' AND email NOT LIKE '%..%'),
    CONSTRAINT CK_STUDENTS_PHONE_FMT CHECK (phone ~ '^\+[1-9][0-9]{10,13}$'),
    CONSTRAINT CK_STUDENTS_PWD_LEN CHECK (LENGTH(password_hash) >= 60), -- bcrypt/argon2 producen minimo 60 chars
    CONSTRAINT CK_STUDENTS_FIRST_NAME_NOTEMPTY CHECK (LENGTH(TRIM(first_name)) > 0),
    CONSTRAINT CK_STUDENTS_FIRST_SURNAME_NOTEMPTY CHECK (LENGTH(TRIM(first_surname)) > 0),
    CONSTRAINT CK_STUDENTS_SECOND_NAME_NOTEMPTY CHECK (second_name IS NULL OR LENGTH(TRIM(second_name)) > 0),
    CONSTRAINT CK_STUDENTS_SECOND_SURNAME_NOTEMPTY CHECK (second_surname IS NULL OR LENGTH(TRIM(second_surname)) > 0),
    CONSTRAINT CK_STUDENTS_UPDATED_AT CHECK (updated_at IS NULL OR updated_at >= created_at),
    CONSTRAINT CK_STUDENTS_LAST_LOGIN_AT CHECK (last_login_at IS NULL OR last_login_at >= created_at),
    CONSTRAINT PK_STUDENTS PRIMARY KEY (student_id, program_id)
);

ALTER TABLE razonapro.students
ALTER COLUMN is_active
SET DEFAULT 'Y';

ALTER TABLE razonapro.students
ALTER COLUMN email_verified
SET DEFAULT 'N';

ALTER TABLE razonapro.students
ALTER COLUMN identity_verified
SET DEFAULT 'N';

ALTER TABLE razonapro.students
ALTER COLUMN created_at
SET DEFAULT CURRENT_TIMESTAMP;