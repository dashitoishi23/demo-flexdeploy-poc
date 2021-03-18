--------------------------------------------------------
--  DDL for Index SYS_AI_5xadju8wp9d2s
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_5xadju8wp9d2s" ON "DW"."W_LEASE_ACTIVITY_D" ("LEASE_CURRENCY_CODE", "LEASE_EXCHANGE_RATE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_5xadju8wp9d2s"  UNUSABLE;
