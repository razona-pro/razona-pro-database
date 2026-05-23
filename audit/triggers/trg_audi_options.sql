DROP TRIGGER  IF EXISTS trg_audi_options
ON razonapro.options;

DROP FUNCTION IF EXISTS razonapro.fn_audi_options();

CREATE FUNCTION razonapro.fn_audi_options()
RETURNS TRIGGER AS $trg_audi_options$
BEGIN
    INSERT INTO razonapro.audi_options (
        competence_id, question_id, option_id,
        option_text, is_correct,
        registered_at, db_user, action
    ) VALUES (
        OLD.competence_id, OLD.question_id, OLD.option_id,
        OLD.option_text, OLD.is_correct,
        CURRENT_TIMESTAMP, CURRENT_USER,
        CASE TG_OP WHEN 'UPDATE' THEN 'U' ELSE 'D' END
    );

    IF TG_OP = 'UPDATE' THEN
        RETURN NEW;
    ELSE
        RETURN OLD;
    END IF;
END;
$trg_audi_options$ LANGUAGE plpgsql;

CREATE TRIGGER trg_audi_options
BEFORE UPDATE OR DELETE ON razonapro.options
FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_options();