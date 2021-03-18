--------------------------------------------------------
--  DDL for Index SYS_AI_b8nb5tawmd8p5
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_b8nb5tawmd8p5" ON "DW"."W_ACCOUNT_RECEIVABLE_DETAILS_F" ("PULL_DATE_WID", "DATASOURCE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_b8nb5tawmd8p5"  UNUSABLE;
