--------------------------------------------------------
--  DDL for Index SYS_AI_gpghks9ga68tp
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_gpghks9ga68tp" ON "DW"."W_LEASE_TERMS_D" ("AMENDMENT_EXPIRE_DATE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_gpghks9ga68tp"  UNUSABLE;
