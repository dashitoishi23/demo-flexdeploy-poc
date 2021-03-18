--------------------------------------------------------
--  DDL for Index SYS_AI_a9qmpgy9wd0vg
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_a9qmpgy9wd0vg" ON "DW"."W_LEASE_ACTIVITY_F" ("SNAPSHOT_PERIOD", "DATASOURCE", "PROPERTY_WID") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_a9qmpgy9wd0vg"  UNUSABLE;
