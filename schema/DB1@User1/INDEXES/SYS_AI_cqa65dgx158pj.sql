--------------------------------------------------------
--  DDL for Index SYS_AI_cqa65dgx158pj
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_cqa65dgx158pj" ON "DW"."W_CURRENCY_G" ("EXCHANGE_RATE_TYPE", "ISO_CODE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_cqa65dgx158pj"  UNUSABLE;
