--------------------------------------------------------
--  DDL for Index SYS_AI_d6mg8vvvkqsms
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_d6mg8vvvkqsms" ON "DW"."W_OCCUPANCY_F" ("SNAPSHOT_PERIOD", "PROPERTY_WID") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_d6mg8vvvkqsms"  UNUSABLE;
