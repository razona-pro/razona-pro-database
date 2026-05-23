DROP FUNCTION IF EXISTS razonapro.fn_audi_questions() CASCADE;

CREATE OR REPLACE FUNCTION razonapro.fn_audi_questions()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
    IF (TG_OP = 'UPDATE') THEN
        INSERT INTO razonapro.audi_questions (row_id, competence_id, question_id, difficulty_level, is_active, registered_at, db_user, action)
        VALUES (DEFAULT, OLD.competence_id, OLD.question_id, OLD.difficulty_level, OLD.is_active, CURRENT_TIMESTAMP, CURRENT_USER, 'U');
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO razonapro.audi_questions (row_id, competence_id, question_id, difficulty_level, is_active, registered_at, db_user, action)
        VALUES (DEFAULT, OLD.competence_id, OLD.question_id, OLD.difficulty_level, OLD.is_active, CURRENT_TIMESTAMP, CURRENT_USER, 'D');
        RETURN OLD;
    END IF;
END;
$$;

CREATE TRIGGER trg_audi_questions
    BEFORE UPDATE OR DELETE ON razonapro.questions
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_questions();
