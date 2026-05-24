SELECT *
FROM razonapro.students_responses;

-- INSERT CON CSV

COPY razonapro.students_responses
FROM 'C:\razonapro\repositorios\razona-pro-database\dml\csv\students_responses.csv'
WITH DELIMITER AS ';' CSV QUOTE AS '"';

SELECT COUNT(*) AS total_respuestas
FROM razonapro.students_responses;

SELECT is_correct, COUNT(*) AS cantidad, ROUND(COUNT(*)::NUMERIC / SUM(COUNT(*)) OVER () * 100, 2) AS porcentaje
FROM razonapro.students_responses
GROUP BY is_correct;

SELECT competence_id, COUNT(*) AS respuestas
FROM razonapro.students_responses
GROUP BY competence_id
ORDER BY competence_id;

-- UPDATE

UPDATE razonapro.students_responses
SET is_correct = 'Y'
WHERE student_response_id = 'SRE0000001';

UPDATE razonapro.students_responses
SET is_correct = 'N'
WHERE student_response_id = 'SRE0000002';

UPDATE razonapro.students_responses
SET answered_at = CURRENT_TIMESTAMP
WHERE student_response_id = 'SRE0000003';

UPDATE razonapro.students_responses
SET answered_at = CURRENT_TIMESTAMP
WHERE student_response_id = 'SRE0000004';

UPDATE razonapro.students_responses
SET option_id   = 'OTN002'
WHERE student_response_id = 'SRE0000005';

-- DELETE

DELETE
FROM razonapro.students_responses
WHERE student_response_id = 'SRE1199996';

DELETE
FROM razonapro.students_responses
WHERE student_response_id = 'SRE1199997';

DELETE
FROM razonapro.students_responses
WHERE student_response_id = 'SRE1199998';

DELETE
FROM razonapro.students_responses
WHERE student_response_id = 'SRE1199999';

DELETE
FROM razonapro.students_responses
WHERE student_response_id = 'SRE1200000';