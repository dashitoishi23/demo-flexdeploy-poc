--------------------------------------------------------
--  DDL for Index SYS_AI_3x883bq1py3pg
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_3x883bq1py3pg" ON "DW"."W_PROPERTY_D" ("SUITE", "PROPERTY_CODE", "SNAPSHOT_PERIOD") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_3x883bq1py3pg"  UNUSABLE;
