DROP TABLE IF EXISTS razonapro.admins;

CREATE TABLE razonapro.admins (
    admin_id VARCHAR(6) NOT NULL,
    first_name VARCHAR(15) NOT NULL,
    second_name VARCHAR(15),
    first_surname VARCHAR(15) NOT NULL,
    second_surname VARCHAR(15),
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    password_hash VARCHAR(72) NOT NULL,
    is_active CHAR(1) NOT NULL,
    last_login_at TIMESTAMP,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    CONSTRAINT UN_ADMINS_EMAIL UNIQUE (email),
    CONSTRAINT UN_ADMINS_PHONE UNIQUE (phone),
    CONSTRAINT CK_ADMINS_IS_ACTIVE CHECK (is_active IN ('Y', 'N')),
    CONSTRAINT CK_ADMINS_EMAIL_FMT CHECK (email = UPPER(email) AND email NOT LIKE '%..%' AND email ~ '^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$'),
    CONSTRAINT CK_ADMINS_PHONE_FMT CHECK (phone ~ '^\+[1-9][0-9]{10,13}$'),
    CONSTRAINT CK_ADMINS_PWD_LEN CHECK (LENGTH(password_hash) >= 60), -- bcrypt/argon2 producen minimo 60 chars
    CONSTRAINT CK_ADMINS_FIRST_NAME_NOTEMPTY CHECK (LENGTH(TRIM(first_name)) > 0),
    CONSTRAINT CK_ADMINS_FIRST_SURNAME_NOTEMPTY CHECK (LENGTH(TRIM(first_surname)) > 0),
    CONSTRAINT CK_ADMINS_SECOND_NAME_NOTEMPTY CHECK (second_name IS NULL OR LENGTH(TRIM(second_name)) > 0),
    CONSTRAINT CK_ADMINS_SECOND_SURNAME_NOTEMPTY CHECK (second_surname IS NULL OR LENGTH(TRIM(second_surname)) > 0),
    CONSTRAINT CK_ADMINS_UPDATED_AT CHECK (updated_at IS NULL OR updated_at >= created_at),
    CONSTRAINT CK_ADMINS_LAST_LOGIN_AT CHECK (last_login_at IS NULL OR last_login_at >= created_at),
    CONSTRAINT PK_ADMINS PRIMARY KEY (admin_id)
);

ALTER TABLE razonapro.admins
ALTER COLUMN is_active
SET DEFAULT 'Y';

ALTER TABLE razonapro.admins
ALTER COLUMN created_at
SET DEFAULT CURRENT_TIMESTAMP;