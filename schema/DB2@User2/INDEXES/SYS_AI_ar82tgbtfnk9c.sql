--------------------------------------------------------
--  DDL for Index SYS_AI_ar82tgbtfnk9c
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_ar82tgbtfnk9c" ON "DW"."W_CUSTOMER_D" ("CURRENT_FLAG", "DATASOURCE", "L4_LEGAL_ENTITY_CODE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_ar82tgbtfnk9c"  UNUSABLE;
