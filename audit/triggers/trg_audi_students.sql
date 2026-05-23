DROP TRIGGER IF EXISTS trg_audi_students
ON razonapro.students;

DROP FUNCTION IF EXISTS razonapro.fn_audi_students();

CREATE FUNCTION razonapro.fn_audi_students()
RETURNS TRIGGER AS $trg_audi_students$
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
    RETURN NULL;
END;
$trg_audi_students$ LANGUAGE plpgsql;

CREATE TRIGGER trg_audi_students
BEFORE UPDATE OR DELETE ON razonapro.students
FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_students();