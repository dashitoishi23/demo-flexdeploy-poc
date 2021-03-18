--------------------------------------------------------
--  DDL for Index SYS_AI_47r29k7x1d50s
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_47r29k7x1d50s" ON "DW"."W_LEASE_ACTIVITY_F" ("LOCK_FLAG", "ID") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_47r29k7x1d50s"  UNUSABLE;
