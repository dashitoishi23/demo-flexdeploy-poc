--------------------------------------------------------
--  DDL for Index SYS_AI_4k8t8surr46g8
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_4k8t8surr46g8" ON "DW"."W_LEASE_ACTIVITY_D" ("LEASE_EXCHANGE_RATE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_4k8t8surr46g8"  UNUSABLE;
