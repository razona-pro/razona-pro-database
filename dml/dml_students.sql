SELECT *
FROM razonapro.students;

-- INSERT CON CSV

COPY razonapro.students
FROM 'C:\razonapro\repositorios\razona-pro-database\dml\csv\students.csv'
WITH DELIMITER AS ';' CSV QUOTE AS '"' NULL AS '\N';

SELECT COUNT(*) AS total
FROM razonapro.students;

SELECT is_active, COUNT(*) AS cantidad
FROM razonapro.students
GROUP BY is_active;

SELECT program_id, COUNT(*) AS por_prog
FROM razonapro.students
GROUP BY program_id
ORDER BY program_id;

-- UPDATE (dispara trg_audi_students)

UPDATE razonapro.students
SET email_verified = 'Y'
WHERE student_id = '0140001';

UPDATE razonapro.students
SET email_verified = 'Y'
WHERE student_id = '0170001';

UPDATE razonapro.students
SET identity_verified = 'Y'
WHERE student_id = '0190001';

UPDATE razonapro.students
SET is_active = 'N'
WHERE student_id = '0220050';

UPDATE razonapro.students
SET last_login_at = CURRENT_TIMESTAMP
WHERE student_id = '0190001';

SELECT *
FROM razonapro.students
WHERE student_id IN ('0140001','0170001','0190001','0220050');

SELECT *
FROM razonapro.audi_students;

-- INSERT Y DELETE (estudiantes temporales en programas temporales)
INSERT INTO razonapro.programs (program_id, program_name, description, is_active, created_at)
VALUES 
    ('901','TEMP 1','TEMPORAL','N',CURRENT_TIMESTAMP),
    ('902','TEMP 2','TEMPORAL','N',CURRENT_TIMESTAMP),
    ('903','TEMP 3','TEMPORAL','N',CURRENT_TIMESTAMP),
    ('904','TEMP 4','TEMPORAL','N',CURRENT_TIMESTAMP),
    ('905','TEMP 5','TEMPORAL','N',CURRENT_TIMESTAMP);

INSERT INTO razonapro.students (student_id,program_id,first_name,first_surname,email,phone,password_hash,is_active,email_verified,identity_verified,created_at)
VALUES
    ('9010001','901','TEST','DEL1','9010001@UFPSO.EDU.CO','+573800000001','$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMaJqHtuBap2VMXpqQ8P/U1.O2','N','N','N',CURRENT_TIMESTAMP),
    ('9020001','902','TEST','DEL2','9020001@UFPSO.EDU.CO','+573800000002','$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMaJqHtuBap2VMXpqQ8P/U1.O2','N','N','N',CURRENT_TIMESTAMP),
    ('9030001','903','TEST','DEL3','9030001@UFPSO.EDU.CO','+573800000003','$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMaJqHtuBap2VMXpqQ8P/U1.O2','N','N','N',CURRENT_TIMESTAMP),
    ('9040001','904','TEST','DEL4','9040001@UFPSO.EDU.CO','+573800000004','$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMaJqHtuBap2VMXpqQ8P/U1.O2','N','N','N',CURRENT_TIMESTAMP),
    ('9050001','905','TEST','DEL5','9050001@UFPSO.EDU.CO','+573800000005','$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMaJqHtuBap2VMXpqQ8P/U1.O2','N','N','N',CURRENT_TIMESTAMP);

DELETE
FROM razonapro.students
WHERE student_id = '9010001';

DELETE
FROM razonapro.students
WHERE student_id = '9020001';

DELETE
FROM razonapro.students
WHERE student_id = '9030001';

DELETE
FROM razonapro.students
WHERE student_id = '9040001';

DELETE
FROM razonapro.students
WHERE student_id = '9050001';

DELETE
FROM razonapro.programs
WHERE program_id IN ('901','902','903','904','905');

SELECT *
FROM razonapro.audi_students
ORDER BY row_id;