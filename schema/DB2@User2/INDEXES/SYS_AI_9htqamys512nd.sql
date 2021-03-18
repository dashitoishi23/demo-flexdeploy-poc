--------------------------------------------------------
--  DDL for Index SYS_AI_9htqamys512nd
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_9htqamys512nd" ON "DW"."W_PRODUCT_HIERARCHY_MAP" ("DATASOURCE", "CURRENT_FLG") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_9htqamys512nd"  UNUSABLE;
