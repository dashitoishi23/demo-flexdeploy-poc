--------------------------------------------------------
--  DDL for Index SYS_AI_0pckwpmnvnjfq
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_0pckwpmnvnjfq" ON "DW"."W_PROPERTY_D" ("SUITE", "BUILDING", "SNAPSHOT_DATE", "DATASOURCE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_0pckwpmnvnjfq"  UNUSABLE;
