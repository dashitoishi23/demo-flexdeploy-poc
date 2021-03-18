--------------------------------------------------------
--  DDL for Index SYS_AI_25w25rmtxf9hr
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_25w25rmtxf9hr" ON "DW"."W_PROPERTY_D" ("SITE_CODE", "LEAF_LEVEL") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_25w25rmtxf9hr"  UNUSABLE;
