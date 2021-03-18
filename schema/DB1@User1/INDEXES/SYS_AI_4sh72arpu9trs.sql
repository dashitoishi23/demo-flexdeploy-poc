--------------------------------------------------------
--  DDL for Index SYS_AI_4sh72arpu9trs
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_4sh72arpu9trs" ON "DW"."W_LOCATION_D" ("SITE_CODE_OPERATIONAL", "INTERNAL_LOCATION_CODE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_4sh72arpu9trs"  UNUSABLE;
