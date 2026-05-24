SELECT *
FROM razonapro.ai_trieds;

-- INSERT CON CSV

COPY razonapro.ai_trieds
FROM 'C:\razonapro\repositorios\razona-pro-database\dml\csv\ai_trieds.csv'
WITH DELIMITER AS ';' CSV QUOTE AS '"' NULL AS '\N';

SELECT status, COUNT(*) AS cantidad, ROUND(AVG(score),2) AS score_promedio
FROM razonapro.ai_trieds
GROUP BY status;

-- UPDATE

UPDATE razonapro.ai_trieds
SET description  = 'SESION IA COMPETENCIAS CIUDADANAS NIVEL AVANZADO'
WHERE ai_tried_id = 'ATD0000002';

-- DELETE (solo ai_trieds sin ai_tried_responses)

DELETE
FROM razonapro.ai_trieds
WHERE ai_tried_id = 'ATD0034996'
AND status IN ('IN_PROGRESS','ABANDONED');

DELETE
FROM razonapro.ai_trieds
WHERE ai_tried_id = 'ATD0034997'
AND status IN ('IN_PROGRESS','ABANDONED');

DELETE
FROM razonapro.ai_trieds
WHERE ai_tried_id = 'ATD0034998'
AND status IN ('IN_PROGRESS','ABANDONED');

DELETE
FROM razonapro.ai_trieds
WHERE ai_tried_id = 'ATD0034999'
AND status IN ('IN_PROGRESS','ABANDONED');

DELETE
FROM razonapro.ai_trieds
WHERE ai_tried_id = 'ATD0035000'
AND status IN ('IN_PROGRESS','ABANDONED');