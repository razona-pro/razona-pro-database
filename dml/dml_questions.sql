SELECT * FROM razonapro.questions;

COPY razonapro.questions
FROM 'C:\razonapro\repositorios\razona-pro-database\dml\csv\questions.csv'
WITH DELIMITER AS ';' CSV QUOTE AS '"' NULL AS '\N';

SELECT COUNT(*) AS total_preguntas
FROM razonapro.questions;

SELECT competence_id, COUNT(*) AS por_competencia
FROM razonapro.questions
GROUP BY competence_id;

SELECT difficulty_level, COUNT(*) AS por_dificultad
FROM razonapro.questions
GROUP BY difficulty_level;

SELECT is_active, COUNT(*) AS activas_inactivas
FROM razonapro.questions
GROUP BY is_active;

-- UPDATE (dispara trg_audi_questions)

UPDATE razonapro.questions
SET difficulty_level = 'A'
WHERE competence_id = 'CPE001'
AND question_id = 'QTN0050';

UPDATE razonapro.questions
SET difficulty_level = 'B'
WHERE competence_id = 'CPE002'
AND question_id = 'QTN0100';

UPDATE razonapro.questions
SET is_active        = 'N'
WHERE competence_id = 'CPE003'
AND question_id = 'QTN1000';

UPDATE razonapro.questions
SET source = 'ICFES SABER PRO 2024'
WHERE competence_id = 'CPE004'
AND question_id = 'QTN0500';

UPDATE razonapro.questions
SET explanation = 'PREGUNTA ACTUALIZADA - EVALUA NIVEL AVANZADO DE COMPRENSION'
WHERE competence_id = 'CPE005'
AND question_id = 'QTN0750';

SELECT *
FROM razonapro.audi_questions;

-- INSERT Y DELETE (preguntas temporales)
INSERT INTO razonapro.questions (competence_id, question_id, admin_id, statement, difficulty_level, is_active, created_at)
VALUES
    ('CPE001','QTN9901','AMN001','PREGUNTA TEMPORAL DE PRUEBA 1 PARA BORRADO DE REGISTRO EN AUDITORÍA','M','N',CURRENT_TIMESTAMP),
    ('CPE001','QTN9902','AMN001','PREGUNTA TEMPORAL DE PRUEBA 2 PARA BORRADO DE REGISTRO EN AUDITORÍA','M','N',CURRENT_TIMESTAMP),
    ('CPE001','QTN9903','AMN001','PREGUNTA TEMPORAL DE PRUEBA 3 PARA BORRADO DE REGISTRO EN AUDITORÍA','B','N',CURRENT_TIMESTAMP),
    ('CPE001','QTN9904','AMN001','PREGUNTA TEMPORAL DE PRUEBA 4 PARA BORRADO DE REGISTRO EN AUDITORÍA','B','N',CURRENT_TIMESTAMP),
    ('CPE001','QTN9905','AMN001','PREGUNTA TEMPORAL DE PRUEBA 5 PARA BORRADO DE REGISTRO EN AUDITORÍA','A','N',CURRENT_TIMESTAMP);

DELETE
FROM razonapro.questions
WHERE competence_id = 'CPE001'
AND question_id = 'QTN9901';

DELETE
FROM razonapro.questions
WHERE competence_id = 'CPE001'
AND question_id = 'QTN9902';

DELETE
FROM razonapro.questions
WHERE competence_id = 'CPE001'
AND question_id = 'QTN9903';

DELETE
FROM razonapro.questions
WHERE competence_id = 'CPE001'
AND question_id = 'QTN9904';

DELETE
FROM razonapro.questions
WHERE competence_id = 'CPE001'
AND question_id = 'QTN9905';

SELECT *
FROM razonapro.audi_questions
ORDER BY row_id;