--------------------------------------------------------
--  DDL for Index SYS_AI_6r8py640t5v76
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_6r8py640t5v76" ON "DW"."W_LEASE_ACTIVITY_D" ("LEASE_ACTIVITY_SRC_KEY", "LOCK_FLAG") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_6r8py640t5v76"  UNUSABLE;
