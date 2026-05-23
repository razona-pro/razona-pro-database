DROP FUNCTION IF EXISTS razonapro.fn_audi_rankings() CASCADE;

CREATE OR REPLACE FUNCTION razonapro.fn_audi_rankings()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
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
END;
$$;

CREATE TRIGGER trg_audi_rankings
    BEFORE UPDATE OR DELETE ON razonapro.rankings
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_rankings();
