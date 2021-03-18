--------------------------------------------------------
--  DDL for Index SYS_AI_8txyupynb48rw
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_8txyupynb48rw" ON "DW"."W_CUSTOMER_D" ("L4_LEGAL_ENTITY_CODE", "ACTIVE_RECORD_FLAG") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_8txyupynb48rw"  UNUSABLE;
