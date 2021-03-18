--------------------------------------------------------
--  DDL for Index SYS_AI_2c2r6cd1pnu7k
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_2c2r6cd1pnu7k" ON "DW"."W_ETL_AUDIT_LOG" ("LOAD_PLAN_NAME", "SESSION_NO") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_2c2r6cd1pnu7k"  UNUSABLE;
