SELECT *
FROM razonapro.trieds;

-- INSERT CON CSV

COPY razonapro.trieds
FROM 'C:\razonapro\repositorios\razona-pro-database\dml\csv\trieds.csv'
WITH DELIMITER AS ';' CSV QUOTE AS '"' NULL AS '\N';

SELECT status, COUNT(*) AS cantidad, ROUND(AVG(score),2) AS score_promedio
FROM razonapro.trieds
GROUP BY status;

SELECT competence_id, COUNT(*) AS intentos
FROM razonapro.trieds
GROUP BY competence_id;

-- UPDATE

UPDATE razonapro.trieds
SET status = 'ABANDONED'
WHERE tried_id = 'TRD0000001';

UPDATE razonapro.trieds
SET status = 'TIMED_OUT'
WHERE tried_id = 'TRD0000002';

UPDATE razonapro.trieds
SET time_spent_seconds = 300
WHERE tried_id = 'TRD0000003';

UPDATE razonapro.trieds
SET time_spent_seconds = 600
WHERE tried_id = 'TRD0000004';

UPDATE razonapro.trieds
SET status = 'IN_PROGRESS'
WHERE tried_id = 'TRD0000005';

-- DELETE

DELETE
FROM razonapro.trieds
WHERE tried_id = 'TRD0073996'
AND status IN ('IN_PROGRESS','ABANDONED');

DELETE
FROM razonapro.trieds
WHERE tried_id = 'TRD0073997'
AND status IN ('IN_PROGRESS','ABANDONED');

DELETE
FROM razonapro.trieds
WHERE tried_id = 'TRD0073998'
AND status IN ('IN_PROGRESS','ABANDONED');

DELETE
FROM razonapro.trieds
WHERE tried_id = 'TRD0073999'
AND status IN ('IN_PROGRESS','ABANDONED');

DELETE
FROM razonapro.trieds
WHERE tried_id = 'TRD0074000'
AND status IN ('IN_PROGRESS','ABANDONED');