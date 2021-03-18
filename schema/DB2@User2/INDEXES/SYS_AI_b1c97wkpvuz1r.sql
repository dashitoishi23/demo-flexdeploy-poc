--------------------------------------------------------
--  DDL for Index SYS_AI_b1c97wkpvuz1r
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_b1c97wkpvuz1r" ON "DW"."W_ETL_AUDIT_LOG" ("STATUS", "LOAD_PLAN_NAME") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_b1c97wkpvuz1r"  UNUSABLE;
