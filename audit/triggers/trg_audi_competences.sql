DROP TRIGGER IF EXISTS trg_audi_competences
ON razonapro.competences;

DROP FUNCTION IF EXISTS razonapro.fn_audi_competences();

CREATE FUNCTION razonapro.fn_audi_competences()
RETURNS TRIGGER AS $trg_audi_competences$
BEGIN
    IF (TG_OP = 'UPDATE') THEN
        INSERT INTO razonapro.audi_competences (row_id, competence_id, competence_name, is_active, registered_at, db_user, action)
        VALUES (DEFAULT, OLD.competence_id, OLD.competence_name, OLD.is_active, CURRENT_TIMESTAMP, CURRENT_USER, 'U');
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO razonapro.audi_competences (row_id, competence_id, competence_name, is_active, registered_at, db_user, action)
        VALUES (DEFAULT, OLD.competence_id, OLD.competence_name, OLD.is_active, CURRENT_TIMESTAMP, CURRENT_USER, 'D');
        RETURN OLD;
    END IF;
    RETURN NULL;
END;
$trg_audi_competences$ LANGUAGE plpgsql;

CREATE TRIGGER trg_audi_competences
BEFORE UPDATE OR DELETE ON razonapro.competences
FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_competences();