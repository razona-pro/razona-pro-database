DROP FUNCTION IF EXISTS razonapro.fn_audi_students() CASCADE;

CREATE OR REPLACE FUNCTION razonapro.fn_audi_students()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
    IF (TG_OP = 'UPDATE') THEN
        INSERT INTO razonapro.audi_students (row_id, student_id, program_id, email, is_active, email_verified, identity_verified, registered_at, db_user, action)
        VALUES (DEFAULT, OLD.student_id, OLD.program_id, OLD.email, OLD.is_active, OLD.email_verified, OLD.identity_verified, CURRENT_TIMESTAMP, CURRENT_USER, 'U');
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO razonapro.audi_students (row_id, student_id, program_id, email, is_active, email_verified, identity_verified, registered_at, db_user, action)
        VALUES (DEFAULT, OLD.student_id, OLD.program_id, OLD.email, OLD.is_active, OLD.email_verified, OLD.identity_verified, CURRENT_TIMESTAMP, CURRENT_USER, 'D');
        RETURN OLD;
    END IF;
END;
$$;

CREATE TRIGGER trg_audi_students
    BEFORE UPDATE OR DELETE ON razonapro.students
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_students();
