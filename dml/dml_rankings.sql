SELECT *
FROM razonapro.rankings;

-- INSERT de rankings

INSERT INTO razonapro.rankings (ranking_id, ranking_name, description, period_type, source_filter, is_active, created_at)
VALUES
    ('RKG001','RANKING SEMANAL','RANKING SEMANAL BASADO EN TODOS LOS INTENTOS DEL PERIODO','WEEKLY','ALL','Y',CURRENT_TIMESTAMP),
    ('RKG002','RANKING MENSUAL','RANKING MENSUAL BASADO EN TODOS LOS INTENTOS DEL PERIODO','MONTHLY','ALL','Y',CURRENT_TIMESTAMP),
    ('RKG003','RANKING GENERAL','RANKING HISTORICO ACUMULADO DE TODOS LOS INTENTOS','GENERAL','ALL','Y',CURRENT_TIMESTAMP),
    ('RKG004','RANKING TESTS','RANKING BASADO EXCLUSIVAMENTE EN INTENTOS DE TESTS','GENERAL','TRIEDS','Y',CURRENT_TIMESTAMP),
    ('RKG005','RANKING IA','RANKING BASADO EXCLUSIVAMENTE EN SESIONES DE INTELIGENCIA IA','GENERAL','AI_TRIEDS','Y',CURRENT_TIMESTAMP);

SELECT *
FROM razonapro.rankings;

-- UPDATE (dispara trg_audi_rankings)

UPDATE razonapro.rankings
SET description = 'RANKING SEMANAL GENERAL PARA TODOS LOS PROGRAMAS UFPSO OCANA'
WHERE ranking_id = 'RKG001';

UPDATE razonapro.rankings
SET description = 'RANKING MENSUAL GENERAL PARA TODOS LOS PROGRAMAS UFPSO OCANA'
WHERE ranking_id = 'RKG002';

UPDATE razonapro.rankings
SET source_filter = 'TRIEDS'
WHERE ranking_id = 'RKG002';

UPDATE razonapro.rankings
SET is_active = 'N'
WHERE ranking_id = 'RKG004';

UPDATE razonapro.rankings
SET ranking_name = 'RANKING IA GENERAL'
WHERE ranking_id = 'RKG005';

SELECT *
FROM razonapro.rankings;

SELECT *
FROM razonapro.audi_rankings;

-- INSERT Y DELETE

INSERT INTO razonapro.rankings (ranking_id, ranking_name, description, period_type, source_filter, is_active, created_at)
VALUES
    ('RKG901','TEMP 1','TEMPORAL','WEEKLY','ALL','N',CURRENT_TIMESTAMP),
    ('RKG902','TEMP 2','TEMPORAL','MONTHLY','ALL','N',CURRENT_TIMESTAMP),
    ('RKG903','TEMP 3','TEMPORAL','GENERAL','ALL','N',CURRENT_TIMESTAMP),
    ('RKG904','TEMP 4','TEMPORAL','WEEKLY','ALL','N',CURRENT_TIMESTAMP),
    ('RKG905','TEMP 5','TEMPORAL','MONTHLY','ALL','N',CURRENT_TIMESTAMP);

DELETE
FROM razonapro.rankings
WHERE ranking_id = 'RKG901';

DELETE
FROM razonapro.rankings
WHERE ranking_id = 'RKG902';

DELETE
FROM razonapro.rankings
WHERE ranking_id = 'RKG903';

DELETE
FROM razonapro.rankings
WHERE ranking_id = 'RKG904';

DELETE
FROM razonapro.rankings
WHERE ranking_id = 'RKG905';

SELECT *
FROM razonapro.audi_rankings
ORDER BY row_id DESC;