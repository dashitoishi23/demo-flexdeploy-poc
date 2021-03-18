--------------------------------------------------------
--  DDL for Index SYS_AI_5crhub8f3zsys
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_5crhub8f3zsys" ON "DW"."W_ETL_AUDIT_LOG" ("LOAD_PLAN_NAME", "PKG_NAME", "SESS_START_TIME") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_5crhub8f3zsys"  UNUSABLE;
