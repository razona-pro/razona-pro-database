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

-- UPDATE — debe fallar con: "Solo se permite actualizar option_id y answered_at"

UPDATE razonapro.students_responses
SET is_correct = 'Y'
WHERE student_response_id = 'SRE0000001';

-- UPDATE sobre intento FINISHED — debe fallar con: "el intento X tiene estado FINISHED y ya no admite cambios"

UPDATE razonapro.students_responses
SET option_id = 'OTN002'
WHERE student_response_id = 'SRE0000001';

-- DELETE — debe fallar con: "DELETE no permitido en students_responses"

DELETE FROM razonapro.students_responses
WHERE student_response_id = 'SRE0000001';