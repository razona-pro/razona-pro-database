DROP TABLE IF EXISTS razonapro.programs;

CREATE TABLE razonapro.programs (
    program_id VARCHAR(3) NOT NULL,
    program_name VARCHAR(50) NOT NULL,
    description VARCHAR(100),
    is_active CHAR(1) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    CONSTRAINT CK_PROGRAMS_ID_FMT CHECK (program_id ~ '^[0-9]{3}$'),
    CONSTRAINT CK_PROGRAMS_IS_ACTIVE CHECK (is_active IN ('Y', 'N')),
    CONSTRAINT CK_PROGRAMS_NAME_NOTEMPTY CHECK (LENGTH(TRIM(program_name)) > 0),
    CONSTRAINT CK_PROGRAMS_DESC_NOTEMPTY CHECK (description IS NULL OR LENGTH(TRIM(description)) > 0),
    CONSTRAINT CK_PROGRAMS_UPDATED_AT CHECK (updated_at IS NULL OR updated_at >= created_at),
    CONSTRAINT PK_PROGRAMS PRIMARY KEY (program_id)
);

ALTER TABLE razonapro.programs
ALTER COLUMN is_active
SET DEFAULT 'Y';

ALTER TABLE razonapro.programs
ALTER COLUMN created_at
SET DEFAULT CURRENT_TIMESTAMP;