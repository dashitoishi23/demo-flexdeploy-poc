--------------------------------------------------------
--  DDL for Index SYS_AI_9s06tcjzdmpp7
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_9s06tcjzdmpp7" ON "DW"."W_PROPERTY_D" ("LEAF_LEVEL", "LOCKED") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_9s06tcjzdmpp7"  UNUSABLE;
