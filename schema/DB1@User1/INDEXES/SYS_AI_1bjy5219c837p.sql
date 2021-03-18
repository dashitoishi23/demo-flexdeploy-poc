--------------------------------------------------------
--  DDL for Index SYS_AI_1bjy5219c837p
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_1bjy5219c837p" ON "DW"."W_CUSTOMER_D" ("L4_LEGAL_ENTITY_NAME", "L4_LEGAL_ENTITY_SRC_KEY") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_1bjy5219c837p"  UNUSABLE;
