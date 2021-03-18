--------------------------------------------------------
--  DDL for Index SYS_AI_05uqtvwvtcmwr
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_05uqtvwvtcmwr" ON "DW"."W_LEASE_ACTIVITY_F" ("DATASOURCE", "LEASE_REPORTING_TYPE", "ID", "SNAPSHOT_PERIOD") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_05uqtvwvtcmwr"  UNUSABLE;
