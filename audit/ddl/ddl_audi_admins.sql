DROP TABLE IF EXISTS razonapro.audi_admins;

CREATE TABLE razonapro.audi_admins (
    row_id  SERIAL       NOT NULL,
    admin_id     VARCHAR(6)   NOT NULL,
    email        VARCHAR(50)  NOT NULL,
    is_active    CHAR(1)      NOT NULL,
    registered_at TIMESTAMP  NOT NULL,
    db_user      VARCHAR(50)  NOT NULL,
    action       CHAR(1)      NOT NULL,
    CONSTRAINT CK_AUDI_ADMINS_ACTION CHECK (action IN ('U', 'D')),
    CONSTRAINT PK_AUDI_ADMINS PRIMARY KEY (row_id)
);
