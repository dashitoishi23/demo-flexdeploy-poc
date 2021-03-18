--------------------------------------------------------
--  DDL for Index SYS_AI_9s3ak05tt0da1
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_9s3ak05tt0da1" ON "DW"."W_LEASE_ACTIVITY_D" ("DATASOURCE", "SOURCE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_9s3ak05tt0da1"  UNUSABLE;
