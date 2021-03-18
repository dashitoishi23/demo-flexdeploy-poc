--------------------------------------------------------
--  DDL for Index SYS_AI_81yhhs4jr0gw5
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_81yhhs4jr0gw5" ON "DW"."W_LEASE_ACTIVITY_D" ("SNAPSHOT_PERIOD", "LEASE_REPORTING_TYPE", "DATASOURCE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_81yhhs4jr0gw5"  UNUSABLE;
