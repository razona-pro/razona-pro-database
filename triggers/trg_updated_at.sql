DROP TRIGGER IF EXISTS trg_admins_updated_at
ON razonapro.admins;

DROP TRIGGER IF EXISTS trg_programs_updated_at
ON razonapro.programs;

DROP TRIGGER IF EXISTS trg_competences_updated_at
ON razonapro.competences;

DROP TRIGGER IF EXISTS trg_rankings_updated_at
ON razonapro.rankings;

DROP TRIGGER IF EXISTS trg_students_updated_at
ON razonapro.students;

DROP TRIGGER IF EXISTS trg_questions_updated_at
ON razonapro.questions;

DROP TRIGGER IF EXISTS trg_tests_updated_at
ON razonapro.tests;

DROP TRIGGER IF EXISTS trg_tests_questions_updated_at
ON razonapro.tests_questions;

DROP TRIGGER IF EXISTS trg_trieds_updated_at
ON razonapro.trieds;

DROP TRIGGER IF EXISTS trg_rankings_students_updated_at
ON razonapro.rankings_students;

DROP FUNCTION IF EXISTS razonapro.fn_set_updated_at();

CREATE FUNCTION razonapro.fn_set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

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