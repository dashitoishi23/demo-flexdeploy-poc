--------------------------------------------------------
--  DDL for Index SYS_AI_grhcq58ngrh14
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_grhcq58ngrh14" ON "DW"."W_ETL_AUDIT_LOG" ("SESS_START_TIME", "STATUS") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_grhcq58ngrh14"  UNUSABLE;
