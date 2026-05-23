DROP TRIGGER IF EXISTS trg_audi_admins
ON razonapro.admins;

DROP FUNCTION IF EXISTS razonapro.fn_audi_admins();

CREATE FUNCTION razonapro.fn_audi_admins()
RETURNS TRIGGER AS $trg_audi_admins$
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
    RETURN NULL;
END;
$trg_audi_admins$ LANGUAGE plpgsql;

CREATE TRIGGER trg_audi_admins
BEFORE UPDATE OR DELETE ON razonapro.admins
FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_admins();