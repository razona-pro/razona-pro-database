DROP FUNCTION IF EXISTS razonapro.fn_audi_tests() CASCADE;

CREATE OR REPLACE FUNCTION razonapro.fn_audi_tests()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
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
END;
$$;

CREATE TRIGGER trg_audi_tests
    BEFORE UPDATE OR DELETE ON razonapro.tests
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_tests();
