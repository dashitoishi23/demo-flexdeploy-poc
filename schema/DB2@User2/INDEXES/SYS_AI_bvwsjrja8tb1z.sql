--------------------------------------------------------
--  DDL for Index SYS_AI_bvwsjrja8tb1z
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_bvwsjrja8tb1z" ON "DW"."W_LEASE_ACTIVITY_F" ("CUSTOMER_WID", "LEASE_REPORTING_TYPE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_bvwsjrja8tb1z"  UNUSABLE;
