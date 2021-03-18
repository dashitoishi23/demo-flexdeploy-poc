--------------------------------------------------------
--  DDL for Index SYS_AI_04hf397wtsx93
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_04hf397wtsx93" ON "DW"."W_PROPERTY_D" ("LIVE_FLAG", "LEAF_LEVEL", "SNAPSHOT_DATE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_04hf397wtsx93"  UNUSABLE;
