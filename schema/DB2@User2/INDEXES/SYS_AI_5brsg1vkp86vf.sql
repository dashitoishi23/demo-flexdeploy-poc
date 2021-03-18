--------------------------------------------------------
--  DDL for Index SYS_AI_5brsg1vkp86vf
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_5brsg1vkp86vf" ON "DW"."W_OCCUPANCY_F" ("SNAPSHOT_DATE", "DATASOURCE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_5brsg1vkp86vf"  UNUSABLE;
