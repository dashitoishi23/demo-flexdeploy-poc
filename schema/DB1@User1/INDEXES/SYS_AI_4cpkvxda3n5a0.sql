--------------------------------------------------------
--  DDL for Index SYS_AI_4cpkvxda3n5a0
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_4cpkvxda3n5a0" ON "DW"."W_ETL_AUDIT_LOG" ("SESSION_NO") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_4cpkvxda3n5a0"  UNUSABLE;
