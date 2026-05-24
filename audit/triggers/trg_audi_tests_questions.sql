DROP TRIGGER  IF EXISTS trg_audi_tests_questions
ON razonapro.tests_questions;

DROP FUNCTION IF EXISTS razonapro.fn_audi_tests_questions();

CREATE FUNCTION razonapro.fn_audi_tests_questions()
RETURNS TRIGGER AS $trg_audi_tests_questions$
BEGIN
    INSERT INTO razonapro.audi_tests_questions (
        test_question_id, admin_id, competence_id,
        test_id, question_id, question_order, is_active,
        registered_at, db_user, action
    ) VALUES (
        OLD.test_question_id, OLD.admin_id, OLD.competence_id,
        OLD.test_id, OLD.question_id, OLD.question_order, OLD.is_active,
        CURRENT_TIMESTAMP, CURRENT_USER,
        CASE TG_OP WHEN 'UPDATE' THEN 'U' ELSE 'D' END
    );

    IF TG_OP = 'UPDATE' THEN
        RETURN NEW;
    ELSE
        RETURN OLD;
    END IF;
END;
$trg_audi_tests_questions$ LANGUAGE plpgsql;

CREATE TRIGGER trg_audi_tests_questions
BEFORE UPDATE OR DELETE ON razonapro.tests_questions
FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_tests_questions();