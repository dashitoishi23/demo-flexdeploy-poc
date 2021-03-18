--------------------------------------------------------
--  DDL for Index SYS_AI_fnhhx3bcnrvjy
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_fnhhx3bcnrvjy" ON "DW"."W_LEASE_TERMS_D" ("LEASE_NUMBER", "UNIT") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_fnhhx3bcnrvjy"  UNUSABLE;
