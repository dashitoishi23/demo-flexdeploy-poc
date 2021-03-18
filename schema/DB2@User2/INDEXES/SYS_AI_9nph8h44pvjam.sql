--------------------------------------------------------
--  DDL for Index SYS_AI_9nph8h44pvjam
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_9nph8h44pvjam" ON "DW"."W_LEASE_TERMS_D" ("LEASE_END_DATE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_9nph8h44pvjam"  UNUSABLE;
