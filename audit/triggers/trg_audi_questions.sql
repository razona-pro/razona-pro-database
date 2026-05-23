DROP TRIGGER IF EXISTS trg_audi_questions
ON razonapro.questions;

DROP FUNCTION IF EXISTS razonapro.fn_audi_questions();

CREATE FUNCTION razonapro.fn_audi_questions()
RETURNS TRIGGER AS $trg_audi_questions$
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
    RETURN NULL;
END;
$trg_audi_questions$ LANGUAGE plpgsql;

CREATE TRIGGER trg_audi_questions
BEFORE UPDATE OR DELETE ON razonapro.questions
FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_questions();