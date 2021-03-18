--------------------------------------------------------
--  DDL for Index SYS_AI_87yg0j6k30g4t
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_87yg0j6k30g4t" ON "DW"."W_PROPERTY_D" ("UNIT", "PROPERTY_CODE", "DATASOURCE", "LEAF_LEVEL", "SNAPSHOT_PERIOD") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_87yg0j6k30g4t"  UNUSABLE;
