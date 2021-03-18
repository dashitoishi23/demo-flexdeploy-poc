--------------------------------------------------------
--  DDL for Index SYS_AI_3b2tbtk5sf2yx
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_3b2tbtk5sf2yx" ON "DW"."W_PROPERTY_D" ("PROPERTY_CODE", "SNAPSHOT_PERIOD", "LEAF_LEVEL", "DATASOURCE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_3b2tbtk5sf2yx"  UNUSABLE;
