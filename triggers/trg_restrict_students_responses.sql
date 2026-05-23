DROP TRIGGER  IF EXISTS trg_restrict_students_responses
ON razonapro.students_responses;

DROP FUNCTION IF EXISTS razonapro.fn_restrict_students_responses();

CREATE OR REPLACE FUNCTION razonapro.fn_restrict_students_responses()
RETURNS TRIGGER AS $trg_restrict_students_responses$
DECLARE
    v_status razonapro.trieds.status%TYPE;
BEGIN
    IF TG_OP = 'DELETE' THEN
        RAISE EXCEPTION
            'DELETE no permitido en students_responses. '
            'Registro: student_response_id = %', OLD.student_response_id;

    ELSIF TG_OP = 'UPDATE' THEN

        -- Validar que el intento asociado este EN PROGRESO
        SELECT status INTO v_status
        FROM razonapro.trieds
        WHERE tried_id = OLD.tried_id;

        IF v_status <> 'IN_PROGRESS' THEN
            RAISE EXCEPTION
                'No se puede modificar la respuesta %: '
                'el intento % tiene estado % y ya no admite cambios',
                OLD.student_response_id, OLD.tried_id, v_status;
        END IF;

        -- Solo se permite cambiar option_id y answered_at
        IF OLD.student_response_id <> NEW.student_response_id
        OR OLD.competence_id       <> NEW.competence_id
        OR OLD.test_id             <> NEW.test_id
        OR OLD.tried_id            <> NEW.tried_id
        OR OLD.student_id          <> NEW.student_id
        OR OLD.question_id         <> NEW.question_id
        OR OLD.is_correct          <> NEW.is_correct THEN
            RAISE EXCEPTION
                'Solo se permite actualizar option_id y answered_at '
                'en students_responses. Registro: %', OLD.student_response_id;
        END IF;

        RETURN NEW;
    END IF;
END;
$trg_restrict_students_responses$ LANGUAGE plpgsql;

CREATE TRIGGER trg_restrict_students_responses
BEFORE UPDATE OR DELETE ON razonapro.students_responses
FOR EACH ROW EXECUTE FUNCTION razonapro.fn_restrict_students_responses();