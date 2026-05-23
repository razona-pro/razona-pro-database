DROP TRIGGER IF EXISTS trg_update_ranking_on_tried
ON razonapro.trieds;

DROP TRIGGER IF EXISTS trg_update_ranking_on_ai_tried
ON razonapro.ai_trieds;

DROP FUNCTION IF EXISTS razonapro.fn_update_ranking_on_tried();
DROP FUNCTION IF EXISTS razonapro.fn_update_ranking_on_ai_tried();
DROP FUNCTION IF EXISTS razonapro.fn_refresh_student_ranking(VARCHAR, VARCHAR);

-- Recalcula y persiste los puntajes de un estudiante en todos los
-- rankings activos. Se invoca desde los triggers de TRIEDS y AI_TRIEDS
CREATE FUNCTION razonapro.fn_refresh_student_ranking(
    p_student_id VARCHAR,
    p_program_id VARCHAR
)
RETURNS VOID AS $$
DECLARE
    v_ranking RECORD;
    v_period_start DATE;
    v_period_end DATE;
    v_trieds_score NUMERIC(7,2);
    v_trieds_count INTEGER;
    v_ai_score NUMERIC(7,2);
    v_ai_count INTEGER;
    v_existing_id INTEGER;
BEGIN
    FOR v_ranking IN
        SELECT * FROM razonapro.rankings WHERE is_active = 'Y'
    LOOP
        CASE v_ranking.period_type
            WHEN 'WEEKLY' THEN
                v_period_start := DATE_TRUNC('week', CURRENT_DATE)::DATE;
                v_period_end := (DATE_TRUNC('week', CURRENT_DATE) + INTERVAL '6 days')::DATE;
            WHEN 'MONTHLY' THEN
                v_period_start := DATE_TRUNC('month', CURRENT_DATE)::DATE;
                v_period_end := (DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' - INTERVAL '1 day')::DATE;
            ELSE
                v_period_start := NULL;
                v_period_end := NULL;
        END CASE;

        IF v_ranking.source_filter IN ('ALL', 'TRIEDS') THEN
            SELECT COALESCE(SUM(score), 0), COUNT(*)
            INTO v_trieds_score, v_trieds_count
            FROM razonapro.trieds
            WHERE student_id = p_student_id
            AND program_id = p_program_id
            AND status = 'FINISHED'
            AND score IS NOT NULL
            AND (v_period_start IS NULL OR finished_at::DATE >= v_period_start)
            AND (v_period_end IS NULL OR finished_at::DATE <= v_period_end);
        ELSE
            v_trieds_score := 0;
            v_trieds_count := 0;
        END IF;

        IF v_ranking.source_filter IN ('ALL', 'AI_TRIEDS') THEN
            SELECT COALESCE(SUM(score), 0), COUNT(*)
            INTO v_ai_score, v_ai_count
            FROM razonapro.ai_trieds
            WHERE student_id = p_student_id
            AND program_id = p_program_id
            AND status = 'FINISHED'
            AND score IS NOT NULL
            AND (v_period_start IS NULL OR finished_at::DATE >= v_period_start)
            AND (v_period_end IS NULL OR finished_at::DATE <= v_period_end);
        ELSE
            v_ai_score := 0;
            v_ai_count := 0;
        END IF;

        SELECT ranking_student_id INTO v_existing_id
        FROM razonapro.rankings_students
        WHERE ranking_id = v_ranking.ranking_id
        AND student_id = p_student_id
        AND program_id = p_program_id
        AND (period_start IS NOT DISTINCT FROM v_period_start)
        AND (period_end IS NOT DISTINCT FROM v_period_end);

        IF FOUND THEN
            UPDATE razonapro.rankings_students
            SET
                trieds_score = v_trieds_score,
                trieds_count = v_trieds_count,
                ai_trieds_score = v_ai_score,
                ai_trieds_count = v_ai_count,
                total_score = v_trieds_score + v_ai_score,
                last_activity_at = CURRENT_TIMESTAMP,
                updated_at = CURRENT_TIMESTAMP
            WHERE ranking_student_id = v_existing_id;
        ELSE
            INSERT INTO razonapro.rankings_students (
                program_id, student_id, ranking_id,
                period_start, period_end,
                total_score, trieds_score, ai_trieds_score,
                trieds_count, ai_trieds_count,
                last_activity_at
            ) VALUES (
                p_program_id, p_student_id, v_ranking.ranking_id,
                v_period_start, v_period_end,
                v_trieds_score + v_ai_score,
                v_trieds_score, v_ai_score,
                v_trieds_count, v_ai_count,
                CURRENT_TIMESTAMP
            );
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION razonapro.fn_update_ranking_on_tried()
RETURNS TRIGGER AS $trg_update_ranking_on_tried$
BEGIN
    IF NEW.status = 'FINISHED' AND (TG_OP = 'INSERT' OR OLD.status <> 'FINISHED') THEN
        PERFORM razonapro.fn_refresh_student_ranking(NEW.student_id, NEW.program_id);
    END IF;
    RETURN NEW;
END;
$trg_update_ranking_on_tried$ LANGUAGE plpgsql;

CREATE FUNCTION razonapro.fn_update_ranking_on_ai_tried()
RETURNS TRIGGER AS $trg_update_ranking_on_ai_tried$
BEGIN
    IF NEW.status = 'FINISHED' AND (TG_OP = 'INSERT' OR OLD.status <> 'FINISHED') THEN
        PERFORM razonapro.fn_refresh_student_ranking(NEW.student_id, NEW.program_id);
    END IF;
    RETURN NEW;
END;
$trg_update_ranking_on_ai_tried$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_ranking_on_tried
AFTER INSERT OR UPDATE OF status ON razonapro.trieds
FOR EACH ROW EXECUTE FUNCTION razonapro.fn_update_ranking_on_tried();

CREATE TRIGGER trg_update_ranking_on_ai_tried
AFTER INSERT OR UPDATE OF status ON razonapro.ai_trieds
FOR EACH ROW EXECUTE FUNCTION razonapro.fn_update_ranking_on_ai_tried();