DROP FUNCTION IF EXISTS razonapro.fn_audi_programs() CASCADE;

CREATE OR REPLACE FUNCTION razonapro.fn_audi_programs()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
    IF (TG_OP = 'UPDATE') THEN
        INSERT INTO razonapro.audi_programs (row_id, program_id, program_name, is_active, registered_at, db_user, action)
        VALUES (DEFAULT, OLD.program_id, OLD.program_name, OLD.is_active, CURRENT_TIMESTAMP, CURRENT_USER, 'U');
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO razonapro.audi_programs (row_id, program_id, program_name, is_active, registered_at, db_user, action)
        VALUES (DEFAULT, OLD.program_id, OLD.program_name, OLD.is_active, CURRENT_TIMESTAMP, CURRENT_USER, 'D');
        RETURN OLD;
    END IF;
END;
$$;

CREATE TRIGGER trg_audi_programs
    BEFORE UPDATE OR DELETE ON razonapro.programs
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_programs();
