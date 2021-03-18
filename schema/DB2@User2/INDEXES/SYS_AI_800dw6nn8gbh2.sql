--------------------------------------------------------
--  DDL for Index SYS_AI_800dw6nn8gbh2
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_800dw6nn8gbh2" ON "DW"."W_LEASE_TERMS_D" ("LEASE_NUMBER", "DATASOURCE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_800dw6nn8gbh2"  UNUSABLE;
