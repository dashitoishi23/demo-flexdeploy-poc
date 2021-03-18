--------------------------------------------------------
--  DDL for Index SYS_AI_dtydsq02c8sjy
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_dtydsq02c8sjy" ON "DW"."W_LEASE_ACTIVITY_D" ("SOURCE", "LOCK_FLAG") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_dtydsq02c8sjy"  UNUSABLE;
