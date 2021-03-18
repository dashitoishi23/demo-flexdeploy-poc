--------------------------------------------------------
--  DDL for Index SYS_AI_5pa63c3qv1qt0
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_5pa63c3qv1qt0" ON "DW"."W_OCCUPANCY_F" ("DATASOURCE", "SNAPSHOT_PERIOD") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_5pa63c3qv1qt0"  UNUSABLE;
