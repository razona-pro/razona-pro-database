SELECT *
FROM razonapro.ai_tried_responses;

-- INSERT CON CSV

COPY razonapro.ai_tried_responses
FROM 'C:\razonapro\repositorios\razona-pro-database\dml\csv\ai_tried_responses.csv'
WITH DELIMITER AS ';' CSV QUOTE AS '"' NULL AS '\N';

SELECT *
FROM razonapro.ai_tried_responses;

SELECT COUNT(*) AS total_respuestas_ia
FROM razonapro.ai_tried_responses;

SELECT is_correct, COUNT(*), ROUND(COUNT(*)::NUMERIC/140000*100,2) AS pct
FROM razonapro.ai_tried_responses
GROUP BY is_correct;

-- UPDATE

UPDATE razonapro.ai_tried_responses
SET is_correct = 'Y'
WHERE ai_tried_response_id = 'ATE0000001';

UPDATE razonapro.ai_tried_responses
SET is_correct = 'N'
WHERE ai_tried_response_id = 'ATE0000002';

UPDATE razonapro.ai_tried_responses
SET correct_answer = 'EL PENSAMIENTO CRITICO IMPLICA ANALISIS REFLEXIVO Y EVALUACION SISTEMATICA DE EVIDENCIAS'
WHERE ai_tried_response_id = 'ATE0000003';

UPDATE razonapro.ai_tried_responses
SET student_answer = 'EL ESTUDIANTE DEMOSTRO COMPRENSION PARCIAL DEL CONCEPTO EVALUADO'
WHERE ai_tried_response_id = 'ATE0000004';

UPDATE razonapro.ai_tried_responses
SET answered_at = CURRENT_TIMESTAMP
WHERE ai_tried_response_id = 'ATE0000005';

-- DELETE

DELETE
FROM razonapro.ai_tried_responses
WHERE ai_tried_response_id = 'ATE0139996';

DELETE
FROM razonapro.ai_tried_responses
WHERE ai_tried_response_id = 'ATE0139997';

DELETE
FROM razonapro.ai_tried_responses
WHERE ai_tried_response_id = 'ATE0139998';

DELETE
FROM razonapro.ai_tried_responses
WHERE ai_tried_response_id = 'ATE0139999';

DELETE
FROM razonapro.ai_tried_responses
WHERE ai_tried_response_id = 'ATE0140000';

SELECT is_correct, COUNT(*), ROUND(COUNT(*)::NUMERIC / SUM(COUNT(*)) OVER () * 100, 2) AS pct
FROM razonapro.ai_tried_responses
GROUP BY is_correct;