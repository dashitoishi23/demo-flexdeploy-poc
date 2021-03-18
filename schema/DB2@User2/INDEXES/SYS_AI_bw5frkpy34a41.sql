--------------------------------------------------------
--  DDL for Index SYS_AI_bw5frkpy34a41
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_bw5frkpy34a41" ON "DW"."W_LEASE_TERMS_D" ("REPORTED_DATE", "UNIT") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_bw5frkpy34a41"  UNUSABLE;
