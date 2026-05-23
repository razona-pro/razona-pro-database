DROP FUNCTION IF EXISTS razonapro.fn_audi_admins() CASCADE;

CREATE OR REPLACE FUNCTION razonapro.fn_audi_admins()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
    IF (TG_OP = 'UPDATE') THEN
        INSERT INTO razonapro.audi_admins (row_id, admin_id, email, is_active, registered_at, db_user, action)
        VALUES (DEFAULT, OLD.admin_id, OLD.email, OLD.is_active, CURRENT_TIMESTAMP, CURRENT_USER, 'U');
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO razonapro.audi_admins (row_id, admin_id, email, is_active, registered_at, db_user, action)
        VALUES (DEFAULT, OLD.admin_id, OLD.email, OLD.is_active, CURRENT_TIMESTAMP, CURRENT_USER, 'D');
        RETURN OLD;
    END IF;
END;
$$;

CREATE TRIGGER trg_audi_admins
    BEFORE UPDATE OR DELETE ON razonapro.admins
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_admins();
