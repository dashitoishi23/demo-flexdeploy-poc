--------------------------------------------------------
--  DDL for Index SYS_AI_119v77qnpv1pq
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_119v77qnpv1pq" ON "DW"."W_CUSTOMER_D" ("SALES_SECTOR", "L1_SALES_SECTOR", "DATASOURCE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_119v77qnpv1pq"  UNUSABLE;
