--------------------------------------------------------
--  DDL for Index SYS_AI_9qsz1jm6c4ymg
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_9qsz1jm6c4ymg" ON "DW"."W_LEASE_ACTIVITY_F" ("PROPERTY_WID", "DATASOURCE", "LEASE_REPORTING_TYPE", "SNAPSHOT_PERIOD") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_9qsz1jm6c4ymg"  UNUSABLE;
