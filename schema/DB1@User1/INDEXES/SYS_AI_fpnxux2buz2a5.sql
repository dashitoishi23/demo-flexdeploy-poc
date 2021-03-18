--------------------------------------------------------
--  DDL for Index SYS_AI_fpnxux2buz2a5
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_fpnxux2buz2a5" ON "DW"."W_PROPERTY_D" ("LIVE_FLAG", "UNIT_SRC_KEY") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_fpnxux2buz2a5"  UNUSABLE;
