--------------------------------------------------------
--  DDL for Index SYS_AI_7tmprspbsp5fs
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_7tmprspbsp5fs" ON "DW"."W_PROPERTY_D" ("PROPERTY_CODE", "SNAPSHOT_DATE", "UNIT") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_7tmprspbsp5fs"  UNUSABLE;
