--------------------------------------------------------
--  DDL for Index SYS_AI_f02v2p82awy9s
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_f02v2p82awy9s" ON "DW"."W_SUITE_METRICS_F" ("SNAPSHOT_DATE", "SUITE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_f02v2p82awy9s"  UNUSABLE;
