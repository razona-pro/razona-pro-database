SELECT * FROM razonapro.programs;

COPY razonapro.programs
FROM 'C:\razonapro\repositorios\razona-pro-database\dml\csv\programs.csv'
WITH DELIMITER AS ';' CSV QUOTE AS '"' NULL AS '\N';

SELECT * FROM razonapro.programs;

-- UPDATE (dispara trg_audi_programs)

UPDATE razonapro.programs
SET description = 'PROGRAMA ACREDITADO EN ALTA CALIDAD - INGENIERIA CIVIL UFPSO OCANA'
WHERE program_id = '017';

UPDATE razonapro.programs
SET description = 'PROGRAMA ACREDITADO EN ALTA CALIDAD - ING DE SISTEMAS UFPSO OCANA'
WHERE program_id = '019';

UPDATE razonapro.programs
SET description = 'PROGRAMA ACREDITADO EN ALTA CALIDAD - ING MECANICA UFPSO OCANA'
WHERE program_id = '018';

UPDATE razonapro.programs
SET description = 'PROGRAMA ACREDITADO EN ALTA CALIDAD - ADM EMPRESAS UFPSO OCANA'
WHERE program_id = '095';

UPDATE razonapro.programs
SET is_active   = 'N'
WHERE program_id = '094';

SELECT *
FROM razonapro.programs;

SELECT *
FROM razonapro.audi_programs;

-- INSERT Y DELETE (registros temporales sin dependencias)

INSERT INTO razonapro.programs (program_id, program_name, description, is_active, created_at)
VALUES
    ('901','PROG TEMP 1','REGISTRO TEMPORAL PARA PRUEBA DE BORRADO','N',CURRENT_TIMESTAMP),
    ('902','PROG TEMP 2','REGISTRO TEMPORAL PARA PRUEBA DE BORRADO','N',CURRENT_TIMESTAMP),
    ('903','PROG TEMP 3','REGISTRO TEMPORAL PARA PRUEBA DE BORRADO','N',CURRENT_TIMESTAMP),
    ('904','PROG TEMP 4','REGISTRO TEMPORAL PARA PRUEBA DE BORRADO','N',CURRENT_TIMESTAMP),
    ('905','PROG TEMP 5','REGISTRO TEMPORAL PARA PRUEBA DE BORRADO','N',CURRENT_TIMESTAMP);

DELETE
FROM razonapro.programs
WHERE program_id = '901';

DELETE
FROM razonapro.programs
WHERE program_id = '902';

DELETE
FROM razonapro.programs
WHERE program_id = '903';

DELETE
FROM razonapro.programs
WHERE program_id = '904';

DELETE
FROM razonapro.programs
WHERE program_id = '905';

SELECT *
FROM razonapro.audi_programs
ORDER BY row_id DESC;