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