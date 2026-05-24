SELECT *
FROM razonapro.admins;

-- INSERT CON CSV

COPY razonapro.admins
FROM 'C:\razonapro\repositorios\razona-pro-database\dml\csv\admins.csv'
WITH DELIMITER AS ';' CSV QUOTE AS '"' NULL AS '\N';

SELECT *
FROM razonapro.admins;

-- UPDATE (dispara trg_audi_admins)

UPDATE razonapro.admins
SET is_active = 'N'
WHERE admin_id = 'AMN003';

UPDATE razonapro.admins
SET email = 'FABIAN.ROJAS.V2@GMAIL.COM'
WHERE admin_id = 'AMN001';

UPDATE razonapro.admins
SET email = 'ANDRES.GOMEZ.V2@GMAIL.COM'
WHERE admin_id = 'AMN002';

UPDATE razonapro.admins
SET last_login_at = CURRENT_TIMESTAMP
WHERE admin_id = 'AMN004';

UPDATE razonapro.admins
SET last_login_at = CURRENT_TIMESTAMP
WHERE admin_id = 'AMN005';

SELECT *
FROM razonapro.admins;

SELECT *
FROM razonapro.audi_admins;

-- INSERT Y DELETE

INSERT INTO razonapro.admins (admin_id, first_name, first_surname, email, phone, password_hash, is_active, created_at)
VALUES
    ('AMN901','TEST','DEL1','TESTDEL1@GMAIL.COM','+573900000001','$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMaJqHtuBap2VMXpqQ8P/U1.O2','N',CURRENT_TIMESTAMP),
    ('AMN902','TEST','DEL2','TESTDEL2@GMAIL.COM','+573900000002','$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMaJqHtuBap2VMXpqQ8P/U1.O2','N',CURRENT_TIMESTAMP),
    ('AMN903','TEST','DEL3','TESTDEL3@GMAIL.COM','+573900000003','$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMaJqHtuBap2VMXpqQ8P/U1.O2','N',CURRENT_TIMESTAMP),
    ('AMN904','TEST','DEL4','TESTDEL4@GMAIL.COM','+573900000004','$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMaJqHtuBap2VMXpqQ8P/U1.O2','N',CURRENT_TIMESTAMP),
    ('AMN905','TEST','DEL5','TESTDEL5@GMAIL.COM','+573900000005','$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMaJqHtuBap2VMXpqQ8P/U1.O2','N',CURRENT_TIMESTAMP);


DELETE
FROM razonapro.admins
WHERE admin_id = 'AMN901';

DELETE
FROM razonapro.admins
WHERE admin_id = 'AMN902';

DELETE
FROM razonapro.admins
WHERE admin_id = 'AMN903';

DELETE
FROM razonapro.admins
WHERE admin_id = 'AMN904';

DELETE
FROM razonapro.admins
WHERE admin_id = 'AMN905';

SELECT *
FROM razonapro.audi_admins
ORDER BY row_id DESC;