--------------------------------------------------------
--  DDL for Index SYS_AI_dh4hd4y2ch02j
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_dh4hd4y2ch02j" ON "DW"."W_PRODUCT_HIERARCHY_MAP" ("CURRENT_FLG", "PRODUCT_SRC_DESC") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_dh4hd4y2ch02j"  UNUSABLE;
