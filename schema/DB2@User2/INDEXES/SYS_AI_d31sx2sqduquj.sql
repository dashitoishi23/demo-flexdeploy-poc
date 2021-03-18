--------------------------------------------------------
--  DDL for Index SYS_AI_d31sx2sqduquj
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_d31sx2sqduquj" ON "DW"."W_LEASE_ACTIVITY_F" ("LEASE_REPORTING_TYPE", "DATASOURCE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_d31sx2sqduquj"  UNUSABLE;
