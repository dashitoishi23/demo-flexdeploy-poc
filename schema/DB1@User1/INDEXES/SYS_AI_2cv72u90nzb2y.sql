--------------------------------------------------------
--  DDL for Index SYS_AI_2cv72u90nzb2y
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_2cv72u90nzb2y" ON "DW"."W_LEASE_ACTIVITY_D" ("LEASE_REPORTING_TYPE", "LEASE_ACTIVITY_SRC_KEY", "SNAPSHOT_PERIOD") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_2cv72u90nzb2y"  UNUSABLE;
