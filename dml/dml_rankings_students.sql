-- UPDATE

UPDATE razonapro.rankings_students
SET last_activity_at = CURRENT_TIMESTAMP
WHERE student_id = '0140001'
AND ranking_id = 'RKG001';

UPDATE razonapro.rankings_students
SET last_activity_at = CURRENT_TIMESTAMP
WHERE student_id = '0170001'
AND ranking_id = 'RKG002';

UPDATE razonapro.rankings_students
SET last_activity_at = CURRENT_TIMESTAMP
WHERE student_id = '0190001'
AND ranking_id = 'RKG003';

UPDATE razonapro.rankings_students
SET last_activity_at = CURRENT_TIMESTAMP
WHERE student_id = '0220001'
AND ranking_id = 'RKG001';

UPDATE razonapro.rankings_students
SET last_activity_at = CURRENT_TIMESTAMP
WHERE student_id = '0310001'
AND ranking_id = 'RKG002';

-- DELETE

DELETE FROM razonapro.rankings_students
WHERE ranking_id = 'RKG004'
AND student_id = '0140001';

DELETE FROM razonapro.rankings_students
WHERE ranking_id = 'RKG004'
AND student_id = '0170001';

DELETE FROM razonapro.rankings_students
WHERE ranking_id = 'RKG004'
AND student_id = '0190001';

DELETE FROM razonapro.rankings_students
WHERE ranking_id = 'RKG004'
AND student_id = '0220001';

DELETE FROM razonapro.rankings_students
WHERE ranking_id = 'RKG004'
AND student_id = '0310001';