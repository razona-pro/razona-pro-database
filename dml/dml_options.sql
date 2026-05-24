SELECT *
FROM razonapro.options;

-- INSERT CON CSV

COPY razonapro.options
FROM 'C:\razonapro\repositorios\razona-pro-database\dml\csv\options.csv'
WITH DELIMITER AS ';' CSV QUOTE AS '"';

SELECT COUNT(*) AS total_opciones
FROM razonapro.options;

SELECT is_correct, COUNT(*) AS distribucion
FROM razonapro.options GROUP BY is_correct;

SELECT option_id, COUNT(*) AS por_opcion
FROM razonapro.options
GROUP BY option_id
ORDER BY option_id;

-- UPDATE

UPDATE razonapro.options
SET option_text = 'LA DEFENSA DEL VALOR SOCIAL E HISTORICO DE LA EDUCACION EN COLOMBIA COMO PROCESO TRANSFORMADOR ESENCIAL'
WHERE competence_id = 'CPE001'
AND question_id = 'QTN0001'
AND option_id = 'OTN001';

UPDATE razonapro.options
SET option_text = 'EL RESULTADO CORRECTO DEL EJERCICIO DE PORCENTAJES Y PROPORCIONES ES EL INDICADO'
WHERE competence_id = 'CPE002'
AND question_id = 'QTN0001'
AND option_id = 'OTN001';

UPDATE razonapro.options
SET option_text = 'GARANTIA PLENA DE LOS FINES ESENCIALES DEL ESTADO MEDIANTE MECANISMOS CONSTITUCIONALES VIGENTES'
WHERE competence_id = 'CPE003'
AND question_id = 'QTN0001'
AND option_id = 'OTN001';

UPDATE razonapro.options
SET option_text = 'ORACION QUE APLICA LA COHERENCIA TEXTUAL DE FORMA CORRECTA SEGUN LAS NORMAS ACADEMICAS'
WHERE competence_id = 'CPE004'
AND question_id = 'QTN0001'
AND option_id = 'OTN001';

UPDATE razonapro.options
SET option_text = 'THE CORRECT INTERPRETATION OF THE MAIN IDEA ABOUT READING COMPREHENSION AS PRESENTED'
WHERE competence_id = 'CPE005'
AND question_id = 'QTN0001'
AND option_id = 'OTN001';

SELECT *
FROM razonapro.audi_options
ORDER BY row_id;

-- INSERT Y DELETE

INSERT INTO razonapro.options (competence_id, question_id, option_id, option_text, is_correct)
VALUES
    ('CPE001','QTN0001','OTN901','OPCION TEMPORAL 1 PARA PRUEBA DE BORRADO','N'),
    ('CPE001','QTN0001','OTN902','OPCION TEMPORAL 2 PARA PRUEBA DE BORRADO','N'),
    ('CPE001','QTN0001','OTN903','OPCION TEMPORAL 3 PARA PRUEBA DE BORRADO','N'),
    ('CPE001','QTN0001','OTN904','OPCION TEMPORAL 4 PARA PRUEBA DE BORRADO','N'),
    ('CPE001','QTN0001','OTN905','OPCION TEMPORAL 5 PARA PRUEBA DE BORRADO','N');

DELETE
FROM razonapro.options
WHERE competence_id = 'CPE001'
AND question_id = 'QTN0001'
AND option_id = 'OTN901';

DELETE
FROM razonapro.options
WHERE competence_id = 'CPE001'
AND question_id = 'QTN0001'
AND option_id = 'OTN902';

DELETE
FROM razonapro.options
WHERE competence_id = 'CPE001'
AND question_id = 'QTN0001'
AND option_id = 'OTN903';

DELETE
FROM razonapro.options
WHERE competence_id = 'CPE001'
AND question_id = 'QTN0001'
AND option_id = 'OTN904';

DELETE
FROM razonapro.options
WHERE competence_id = 'CPE001'
AND question_id = 'QTN0001'
AND option_id = 'OTN905';

SELECT *
FROM razonapro.audi_options
ORDER BY row_id;