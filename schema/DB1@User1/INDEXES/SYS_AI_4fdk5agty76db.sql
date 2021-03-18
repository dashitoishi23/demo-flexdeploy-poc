--------------------------------------------------------
--  DDL for Index SYS_AI_4fdk5agty76db
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_4fdk5agty76db" ON "DW"."W_LEASE_ACTIVITY_F" ("LEASE_ACTIVITY_WID", "SNAPSHOT_PERIOD") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_4fdk5agty76db"  UNUSABLE;
