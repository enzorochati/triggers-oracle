CREATE OR REPLACE TRIGGER enzo.trg_situquei_enforna_olaria AFTER
    UPDATE ON dev.enforna
    FOR EACH ROW
BEGIN
    IF ( :new.situacao = 'QUIMA' ) THEN
        UPDATE sag.pocamves
        SET
            situmves = 'QUEIMA',
            codimves = :new.codimves
        WHERE
            codimves = :new.codigene;

    END IF;
END;
/