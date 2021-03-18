--------------------------------------------------------
--  DDL for Index SYS_AI_cr6s8x2czttbm
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_cr6s8x2czttbm" ON "DW"."W_PROPERTY_D" ("SNAPSHOT_DATE", "DATASOURCE", "SUITE", "PROPERTY_CODE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_cr6s8x2czttbm"  UNUSABLE;
