--------------------------------------------------------
--  DDL for Index SYS_AI_3hzfwn08xqv17
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_3hzfwn08xqv17" ON "DW"."W_PROPERTY_D" ("LEAF_LEVEL", "DATASOURCE", "PROPERTY_CODE", "UNIT") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_3hzfwn08xqv17"  UNUSABLE;
