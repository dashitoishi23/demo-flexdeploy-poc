--------------------------------------------------------
--  DDL for Index SYS_AI_bby4azgpwtf9a
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_bby4azgpwtf9a" ON "DW"."W_SUITE_METRICS_F" ("PROPERTY_WID", "DATASOURCE", "SUITE_SRC_KEY") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_bby4azgpwtf9a"  UNUSABLE;
