DROP TRIGGER IF EXISTS trg_audi_tests
ON razonapro.tests;

DROP FUNCTION IF EXISTS razonapro.fn_audi_tests();

CREATE FUNCTION razonapro.fn_audi_tests()
RETURNS TRIGGER AS $trg_audi_tests$
BEGIN
    IF (TG_OP = 'UPDATE') THEN
        INSERT INTO razonapro.audi_tests (row_id, test_id, competence_id, test_name, test_mode, duration_seconds, is_active, registered_at, db_user, action)
        VALUES (DEFAULT, OLD.test_id, OLD.competence_id, OLD.test_name, OLD.test_mode, OLD.duration_seconds, OLD.is_active, CURRENT_TIMESTAMP, CURRENT_USER, 'U');
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO razonapro.audi_tests (row_id, test_id, competence_id, test_name, test_mode, duration_seconds, is_active, registered_at, db_user, action)
        VALUES (DEFAULT, OLD.test_id, OLD.competence_id, OLD.test_name, OLD.test_mode, OLD.duration_seconds, OLD.is_active, CURRENT_TIMESTAMP, CURRENT_USER, 'D');
        RETURN OLD;
    END IF;
    RETURN NULL;
END;
$trg_audi_tests$ LANGUAGE plpgsql;

CREATE TRIGGER trg_audi_tests
BEFORE UPDATE OR DELETE ON razonapro.tests
FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_tests();