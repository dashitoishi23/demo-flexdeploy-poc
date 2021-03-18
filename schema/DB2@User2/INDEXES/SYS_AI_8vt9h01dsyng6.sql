--------------------------------------------------------
--  DDL for Index SYS_AI_8vt9h01dsyng6
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_8vt9h01dsyng6" ON "DW"."W_LEASE_ACTIVITY_D" ("LEASE_ACTIVITY_SRC_KEY", "LEASE_REPORTING_TYPE", "DATASOURCE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_8vt9h01dsyng6"  UNUSABLE;
