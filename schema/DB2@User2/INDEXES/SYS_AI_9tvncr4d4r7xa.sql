--------------------------------------------------------
--  DDL for Index SYS_AI_9tvncr4d4r7xa
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_9tvncr4d4r7xa" ON "DW"."W_PROPERTY_D" ("ROW_WID", "LIVE_FLAG", "LEAF_LEVEL") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_9tvncr4d4r7xa"  UNUSABLE;
