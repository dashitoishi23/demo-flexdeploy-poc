--------------------------------------------------------
--  DDL for Index SYS_AI_9zbj5xdtcmdw8
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_9zbj5xdtcmdw8" ON "DW"."W_ACCOUNT_RECEIVABLE_SUMMARY_F" ("PULL_DATE_WID", "DATASOURCE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_9zbj5xdtcmdw8"  UNUSABLE;
