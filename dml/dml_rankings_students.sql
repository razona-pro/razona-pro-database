-- INSERT de registros semanales y mensuales

INSERT INTO razonapro.rankings_students
    (ranking_student_id, program_id, student_id, ranking_id, period_start, period_end,
     total_score, trieds_score, ai_trieds_score, trieds_count, ai_trieds_count, created_at, last_activity_at)
VALUES
    (DEFAULT,'014','0140001','RKG001','2025-05-19','2025-05-25',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'014','0140001','RKG002','2025-05-01','2025-05-31',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'014','0140002','RKG001','2025-05-19','2025-05-25',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'014','0140002','RKG002','2025-05-01','2025-05-31',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'017','0170001','RKG001','2025-05-19','2025-05-25',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'017','0170001','RKG002','2025-05-01','2025-05-31',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'017','0170002','RKG001','2025-05-19','2025-05-25',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'017','0170002','RKG002','2025-05-01','2025-05-31',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'019','0190001','RKG001','2025-05-19','2025-05-25',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'019','0190001','RKG002','2025-05-01','2025-05-31',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'019','0190002','RKG001','2025-05-19','2025-05-25',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'019','0190002','RKG002','2025-05-01','2025-05-31',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'022','0220001','RKG001','2025-05-19','2025-05-25',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'022','0220001','RKG002','2025-05-01','2025-05-31',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'022','0220002','RKG001','2025-05-19','2025-05-25',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'022','0220002','RKG002','2025-05-01','2025-05-31',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'031','0310001','RKG001','2025-05-19','2025-05-25',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'031','0310001','RKG002','2025-05-01','2025-05-31',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'031','0310002','RKG001','2025-05-19','2025-05-25',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'031','0310002','RKG002','2025-05-01','2025-05-31',80.0,48.0,32.0,5,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

-- Registros generales (period_start/end = NULL)
INSERT INTO razonapro.rankings_students
    (ranking_student_id, program_id, student_id, ranking_id, period_start, period_end,
     total_score, trieds_score, ai_trieds_score, trieds_count, ai_trieds_count, created_at, last_activity_at)
VALUES
    (DEFAULT,'014','0140001','RKG003',NULL,NULL,85.50,51.30,34.20,8,4,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'017','0170001','RKG003',NULL,NULL,85.50,51.30,34.20,8,4,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'019','0190001','RKG003',NULL,NULL,85.50,51.30,34.20,8,4,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'022','0220001','RKG003',NULL,NULL,85.50,51.30,34.20,8,4,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    (DEFAULT,'031','0310001','RKG003',NULL,NULL,85.50,51.30,34.20,8,4,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

SELECT * FROM razonapro.rankings_students;

SELECT rs.ranking_id, rs.student_id, rs.total_score
FROM razonapro.rankings_students rs
ORDER BY rs.ranking_id, rs.total_score DESC;

-- UPDATE

UPDATE razonapro.rankings_students
SET total_score = 92.50, trieds_score = 55.50, ai_trieds_score = 37.00
WHERE student_id = '0140001'
AND ranking_id = 'RKG001';

UPDATE razonapro.rankings_students
SET total_score = 88.00, trieds_score = 52.80, ai_trieds_score = 35.20
WHERE student_id = '0170001'
AND ranking_id = 'RKG001';

UPDATE razonapro.rankings_students
SET trieds_count = 8, ai_trieds_count = 5
WHERE student_id = '0190001'
AND ranking_id = 'RKG002';

UPDATE razonapro.rankings_students
SET last_activity_at = CURRENT_TIMESTAMP
WHERE student_id = '0220001'
AND ranking_id = 'RKG001';

UPDATE razonapro.rankings_students
SET last_activity_at = CURRENT_TIMESTAMP
WHERE student_id = '0310001'
AND ranking_id = 'RKG002';

-- DELETE

DELETE
FROM razonapro.rankings_students
WHERE student_id = '0140002'
AND ranking_id = 'RKG001';

DELETE
FROM razonapro.rankings_students
WHERE student_id = '0140002'
AND ranking_id = 'RKG002';

DELETE
FROM razonapro.rankings_students
WHERE student_id = '0170002'
AND ranking_id = 'RKG001';

DELETE
FROM razonapro.rankings_students
WHERE student_id = '0170002'
AND ranking_id = 'RKG002';

DELETE
FROM razonapro.rankings_students
WHERE student_id = '0310002'
AND ranking_id = 'RKG002';