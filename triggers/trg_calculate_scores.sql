DROP FUNCTION IF EXISTS razonapro.fn_calculate_tried_score() CASCADE;
DROP FUNCTION IF EXISTS razonapro.fn_calculate_ai_tried_score() CASCADE;

-- Calcula score cuando un TRIED pasa a FINISHED
-- Se ejecuta BEFORE para poder modificar NEW antes de persistir
CREATE OR REPLACE FUNCTION razonapro.fn_calculate_tried_score()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
    IF NEW.status = 'FINISHED' AND (TG_OP = 'INSERT' OR OLD.status <> 'FINISHED') THEN
        IF NEW.total_questions > 0 AND NEW.correct_answers IS NOT NULL THEN
            NEW.score := ROUND(
                (NEW.correct_answers::NUMERIC / NEW.total_questions::NUMERIC) * 100, 2
            );
        END IF;
        IF NEW.finished_at IS NULL THEN
            NEW.finished_at := CURRENT_TIMESTAMP;
        END IF;
    END IF;
    RETURN NEW;
END;
$$;

-- Igual que el anterior pero para AI_TRIEDS
CREATE OR REPLACE FUNCTION razonapro.fn_calculate_ai_tried_score()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
    IF NEW.status = 'FINISHED' AND (TG_OP = 'INSERT' OR OLD.status <> 'FINISHED') THEN
        IF NEW.total_questions > 0 AND NEW.correct_answers IS NOT NULL THEN
            NEW.score := ROUND(
                (NEW.correct_answers::NUMERIC / NEW.total_questions::NUMERIC) * 100, 2
            );
        END IF;
        IF NEW.finished_at IS NULL THEN
            NEW.finished_at := CURRENT_TIMESTAMP;
        END IF;
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_calculate_tried_score
    BEFORE INSERT OR UPDATE OF status, correct_answers ON razonapro.trieds
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_calculate_tried_score();

CREATE TRIGGER trg_calculate_ai_tried_score
    BEFORE INSERT OR UPDATE OF status, correct_answers ON razonapro.ai_trieds
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_calculate_ai_tried_score();
