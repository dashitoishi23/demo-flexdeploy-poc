--------------------------------------------------------
--  DDL for Index SYS_AI_34bdxfrd0hu5t
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_34bdxfrd0hu5t" ON "DW"."W_LEASE_ACTIVITY_D" ("CONTRACT_NUMBER", "DATASOURCE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_34bdxfrd0hu5t"  UNUSABLE;
