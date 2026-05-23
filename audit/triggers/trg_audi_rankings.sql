DROP TRIGGER IF EXISTS trg_audi_rankings
ON razonapro.rankings;

DROP FUNCTION IF EXISTS razonapro.fn_audi_rankings();

CREATE FUNCTION razonapro.fn_audi_rankings()
RETURNS TRIGGER AS $trg_audi_rankings$
BEGIN
    IF (TG_OP = 'UPDATE') THEN
        INSERT INTO razonapro.audi_rankings (row_id, ranking_id, ranking_name, period_type, source_filter, is_active, registered_at, db_user, action)
        VALUES (DEFAULT, OLD.ranking_id, OLD.ranking_name, OLD.period_type, OLD.source_filter, OLD.is_active, CURRENT_TIMESTAMP, CURRENT_USER, 'U');
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO razonapro.audi_rankings (row_id, ranking_id, ranking_name, period_type, source_filter, is_active, registered_at, db_user, action)
        VALUES (DEFAULT, OLD.ranking_id, OLD.ranking_name, OLD.period_type, OLD.source_filter, OLD.is_active, CURRENT_TIMESTAMP, CURRENT_USER, 'D');
        RETURN OLD;
    END IF;
    RETURN NULL;
END;
$trg_audi_rankings$ LANGUAGE plpgsql;

CREATE TRIGGER trg_audi_rankings
BEFORE UPDATE OR DELETE ON razonapro.rankings
FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_rankings();