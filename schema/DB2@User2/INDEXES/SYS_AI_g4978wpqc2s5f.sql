--------------------------------------------------------
--  DDL for Index SYS_AI_g4978wpqc2s5f
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_g4978wpqc2s5f" ON "DW"."W_ETL_AUDIT_LOG" ("TARGET_NAME", "STATUS") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_g4978wpqc2s5f"  UNUSABLE;
