--------------------------------------------------------
--  DDL for Trigger TRG_W_SUPPL_SNAPSHOT_CONTROL_G
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "DW"."TRG_W_SUPPL_SNAPSHOT_CONTROL_G" 
BEFORE INSERT OR UPDATE
ON DW.W_SUPPL_SNAPSHOT_CONTROL_G
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
   IF INSERTING THEN
      SELECT SYSDATE, v('APP_USER'), v('APP_USER'), SYSDATE
      INTO :NEW.CREATED_ON_DT, :NEW.CREATED_BY,:NEW.CHANGED_BY, :NEW.CHANGED_ON_DT
            FROM DUAL;
   END IF;
    IF UPDATING THEN
      SELECT SYSDATE, v('APP_USER')
      INTO :NEW.CHANGED_ON_DT, :NEW.CHANGED_BY
            FROM DUAL;
   END IF;
END;
/
ALTER TRIGGER "DW"."TRG_W_SUPPL_SNAPSHOT_CONTROL_G" ENABLE;
