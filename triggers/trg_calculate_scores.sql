DROP TRIGGER IF EXISTS trg_calculate_tried_score
ON razonapro.trieds;

DROP TRIGGER IF EXISTS trg_calculate_ai_tried_score
ON razonapro.ai_trieds;

DROP FUNCTION IF EXISTS razonapro.fn_calculate_tried_score();
DROP FUNCTION IF EXISTS razonapro.fn_calculate_ai_tried_score();

CREATE FUNCTION razonapro.fn_calculate_tried_score()
RETURNS TRIGGER AS $trg_calculate_tried_score$
BEGIN
    IF NEW.status = 'FINISHED' AND (TG_OP = 'INSERT' OR OLD.status <> 'FINISHED') THEN
        IF NEW.total_questions > 0 AND NEW.correct_answers IS NOT NULL THEN
            NEW.score := ROUND((NEW.correct_answers::NUMERIC / NEW.total_questions::NUMERIC) * 100, 2);
        END IF;
        IF NEW.finished_at IS NULL THEN
            NEW.finished_at := CURRENT_TIMESTAMP;
        END IF;
    END IF;
    RETURN NEW;
END;
$trg_calculate_tried_score$ LANGUAGE plpgsql;

CREATE FUNCTION razonapro.fn_calculate_ai_tried_score()
RETURNS TRIGGER AS $trg_calculate_ai_tried_score$
BEGIN
    IF NEW.status = 'FINISHED' AND (TG_OP = 'INSERT' OR OLD.status <> 'FINISHED') THEN
        IF NEW.total_questions > 0 AND NEW.correct_answers IS NOT NULL THEN
            NEW.score := ROUND((NEW.correct_answers::NUMERIC / NEW.total_questions::NUMERIC) * 100, 2);
        END IF;
        IF NEW.finished_at IS NULL THEN
            NEW.finished_at := CURRENT_TIMESTAMP;
        END IF;
    END IF;
    RETURN NEW;
END;
$trg_calculate_ai_tried_score$ LANGUAGE plpgsql;

CREATE TRIGGER trg_calculate_tried_score
BEFORE INSERT OR UPDATE OF status, correct_answers ON razonapro.trieds
FOR EACH ROW EXECUTE FUNCTION razonapro.fn_calculate_tried_score();

CREATE TRIGGER trg_calculate_ai_tried_score
BEFORE INSERT OR UPDATE OF status, correct_answers ON razonapro.ai_trieds
FOR EACH ROW EXECUTE FUNCTION razonapro.fn_calculate_ai_tried_score();