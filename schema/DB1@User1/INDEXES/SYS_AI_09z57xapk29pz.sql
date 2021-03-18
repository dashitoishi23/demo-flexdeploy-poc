--------------------------------------------------------
--  DDL for Index SYS_AI_09z57xapk29pz
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_09z57xapk29pz" ON "DW"."W_PROPERTY_D" ("LEAF_LEVEL", "UNIT_SRC_KEY", "SNAPSHOT_PERIOD") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_09z57xapk29pz"  UNUSABLE;
