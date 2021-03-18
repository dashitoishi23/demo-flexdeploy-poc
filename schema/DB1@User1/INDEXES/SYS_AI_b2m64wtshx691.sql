--------------------------------------------------------
--  DDL for Index SYS_AI_b2m64wtshx691
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_b2m64wtshx691" ON "DW"."W_CUSTOMER_D" ("ACTIVE_RECORD_FLAG", "DATASOURCE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_b2m64wtshx691"  UNUSABLE;
