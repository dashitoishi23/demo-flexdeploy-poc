--------------------------------------------------------
--  DDL for Index SYS_AI_77mkmxv7bj38c
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_77mkmxv7bj38c" ON "DW"."W_LEASE_ACTIVITY_D" ("ROW_WID", "SNAPSHOT_PERIOD") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_77mkmxv7bj38c"  UNUSABLE;
