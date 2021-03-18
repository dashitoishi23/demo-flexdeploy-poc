--------------------------------------------------------
--  DDL for Index SYS_AI_5fq8m9zmt9vyj
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_5fq8m9zmt9vyj" ON "DW"."W_CUSTOMER_D" ("L4_LEGAL_ENTITY_NAME", "ACTIVE_RECORD_FLAG", "L4_LEGAL_ENTITY_SRC_KEY", "L4_LEGAL_ENTITY_CODE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_5fq8m9zmt9vyj"  UNUSABLE;
