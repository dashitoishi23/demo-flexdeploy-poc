--------------------------------------------------------
--  DDL for Index SYS_AI_1s7ub15c2ktmq
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_1s7ub15c2ktmq" ON "DW"."W_PROPERTY_D" ("UNIT", "SNAPSHOT_PERIOD", "PROPERTY_CODE", "DATASOURCE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_1s7ub15c2ktmq"  UNUSABLE;
