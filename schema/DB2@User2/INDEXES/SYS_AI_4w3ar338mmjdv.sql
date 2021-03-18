--------------------------------------------------------
--  DDL for Index SYS_AI_4w3ar338mmjdv
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_4w3ar338mmjdv" ON "DW"."W_PRODUCT_HIERARCHY_MAP" ("INCLUDE_IN_LA", "ASSET_TYPE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_4w3ar338mmjdv"  UNUSABLE;
