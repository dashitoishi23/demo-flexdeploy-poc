--------------------------------------------------------
--  DDL for Index SYS_AI_37fqdb7jna3uz
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_37fqdb7jna3uz" ON "DW"."W_PRODUCT_HIERARCHY_MAP" ("INCLUDE_IN_LA", "QUANTITY_IS_SQFT") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_37fqdb7jna3uz"  UNUSABLE;
