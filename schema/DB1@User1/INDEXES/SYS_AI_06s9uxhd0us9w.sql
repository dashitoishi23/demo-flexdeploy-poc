--------------------------------------------------------
--  DDL for Index SYS_AI_06s9uxhd0us9w
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_06s9uxhd0us9w" ON "DW"."W_OPPORTUNITY_D" ("OPPORTUNITY_STATUS", "TRANSACTION_TYPE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_06s9uxhd0us9w"  UNUSABLE;
