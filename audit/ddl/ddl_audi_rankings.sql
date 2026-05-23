DROP TABLE IF EXISTS razonapro.audi_rankings;

CREATE TABLE razonapro.audi_rankings (
    row_id    SERIAL       NOT NULL,
    ranking_id     VARCHAR(6)   NOT NULL,
    ranking_name   VARCHAR(20)  NOT NULL,
    period_type    VARCHAR(10)  NOT NULL,
    source_filter  VARCHAR(10)  NOT NULL,
    is_active      CHAR(1)      NOT NULL,
    registered_at TIMESTAMP    NOT NULL,
    db_user        VARCHAR(50)  NOT NULL,
    action         CHAR(1)      NOT NULL,
    CONSTRAINT CK_AUDI_RANKINGS_ACTION CHECK (action IN ('U', 'D')),
    CONSTRAINT PK_AUDI_RANKINGS PRIMARY KEY (row_id)
);
