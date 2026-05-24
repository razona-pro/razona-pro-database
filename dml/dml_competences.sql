SELECT *
FROM razonapro.competences;

-- INSERT CON CSV

COPY razonapro.competences
FROM 'C:\razonapro\repositorios\razona-pro-database\dml\csv\competences.csv'
WITH DELIMITER AS ';' CSV QUOTE AS '"' NULL AS '\N';

SELECT * FROM razonapro.competences;

-- UPDATE (dispara trg_audi_competences)

UPDATE razonapro.competences
SET description = 'MODULO GENERICO SABER PRO: ANALISIS CRITICO Y COMPRENSION LECTORA AVANZADA'
WHERE competence_id = 'CPE001';

UPDATE razonapro.competences
SET description = 'MODULO GENERICO SABER PRO: MATEMATICAS APLICADAS Y ESTADISTICA BASICA'
WHERE competence_id = 'CPE002';

UPDATE razonapro.competences
SET description = 'MODULO GENERICO SABER PRO: CIUDADANIA ACTIVA Y PARTICIPACION DEMOCRATICA'
WHERE competence_id = 'CPE003';

UPDATE razonapro.competences
SET description = 'MODULO GENERICO SABER PRO: ESCRITURA ACADEMICA Y ARGUMENTACION FORMAL'
WHERE competence_id = 'CPE004';

UPDATE razonapro.competences
SET description = 'MODULO GENERICO SABER PRO: IDIOMA INGLES NIVEL B1 B2 COMPRENSION Y USO'
WHERE competence_id = 'CPE005';

SELECT *
FROM razonapro.competences;

SELECT *
FROM razonapro.audi_competences;

-- INSERT Y DELETE

INSERT INTO razonapro.competences (competence_id, competence_name, description, is_active, created_at)
VALUES
    ('CPE901','PENSAMIENTO CIENTIFICO','TEMPORAL 1','N',CURRENT_TIMESTAMP),
    ('CPE902','FORMULACION PROYECTOS','TEMPORAL 2','N',CURRENT_TIMESTAMP),
    ('CPE903','ESTADISTICA APLICADA','TEMPORAL 3','N',CURRENT_TIMESTAMP),
    ('CPE904','PENSAMIENTO SISTEMICO','TEMPORAL 4','N',CURRENT_TIMESTAMP),
    ('CPE905','ETICA PROFESIONAL','TEMPORAL 5','N',CURRENT_TIMESTAMP);

DELETE
FROM razonapro.competences
WHERE competence_id = 'CPE901';

DELETE
FROM razonapro.competences
WHERE competence_id = 'CPE902';

DELETE
FROM razonapro.competences
WHERE competence_id = 'CPE903';

DELETE
FROM razonapro.competences
WHERE competence_id = 'CPE904';

DELETE
FROM razonapro.competences
WHERE competence_id = 'CPE905';

SELECT *
FROM razonapro.audi_competences
ORDER BY row_id DESC;