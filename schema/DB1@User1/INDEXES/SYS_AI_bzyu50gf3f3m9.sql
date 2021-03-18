--------------------------------------------------------
--  DDL for Index SYS_AI_bzyu50gf3f3m9
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_bzyu50gf3f3m9" ON "DW"."W_PROPERTY_D" ("BUILDING", "SUITE", "PROPERTY_CODE", "SNAPSHOT_DATE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_bzyu50gf3f3m9"  UNUSABLE;
