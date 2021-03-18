--------------------------------------------------------
--  DDL for Index SYS_AI_b530q6mrnhjwr
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_b530q6mrnhjwr" ON "DW"."W_CUSTOMER_D" ("L3_CUSTOMER_SRC_KEY", "DATASOURCE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_b530q6mrnhjwr"  UNUSABLE;
