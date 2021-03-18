--------------------------------------------------------
--  DDL for Index SYS_AI_9gnf6cw9rwdus
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_9gnf6cw9rwdus" ON "DW"."W_PROPERTY_D" ("LEAF_LEVEL", "SUITE", "DATASOURCE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_9gnf6cw9rwdus"  UNUSABLE;
