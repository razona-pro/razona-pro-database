DROP FUNCTION IF EXISTS razonapro.fn_set_updated_at() CASCADE;

CREATE OR REPLACE FUNCTION razonapro.fn_set_updated_at()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
    NEW.updated_at := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_admins_updated_at
    BEFORE UPDATE ON razonapro.admins
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();

CREATE TRIGGER trg_programs_updated_at
    BEFORE UPDATE ON razonapro.programs
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();

CREATE TRIGGER trg_competences_updated_at
    BEFORE UPDATE ON razonapro.competences
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();

CREATE TRIGGER trg_rankings_updated_at
    BEFORE UPDATE ON razonapro.rankings
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();

CREATE TRIGGER trg_students_updated_at
    BEFORE UPDATE ON razonapro.students
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();

CREATE TRIGGER trg_questions_updated_at
    BEFORE UPDATE ON razonapro.questions
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();

CREATE TRIGGER trg_tests_updated_at
    BEFORE UPDATE ON razonapro.tests
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();

CREATE TRIGGER trg_tests_questions_updated_at
    BEFORE UPDATE ON razonapro.tests_questions
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();

CREATE TRIGGER trg_trieds_updated_at
    BEFORE UPDATE ON razonapro.trieds
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();

CREATE TRIGGER trg_rankings_students_updated_at
    BEFORE UPDATE ON razonapro.rankings_students
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();
