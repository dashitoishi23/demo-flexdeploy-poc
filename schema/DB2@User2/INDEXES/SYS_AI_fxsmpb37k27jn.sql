--------------------------------------------------------
--  DDL for Index SYS_AI_fxsmpb37k27jn
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_fxsmpb37k27jn" ON "DW"."W_PRODUCT_HIERARCHY_MAP" ("DATASOURCE", "PRODUCT_TYPE_GROUP") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_fxsmpb37k27jn"  UNUSABLE;
