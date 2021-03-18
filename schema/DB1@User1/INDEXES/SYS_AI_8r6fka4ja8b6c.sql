--------------------------------------------------------
--  DDL for Index SYS_AI_8r6fka4ja8b6c
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_8r6fka4ja8b6c" ON "DW"."W_ETL_AUDIT_LOG" ("MAPPING_NAME", "STATUS") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_8r6fka4ja8b6c"  UNUSABLE;
