--------------------------------------------------------
--  DDL for Index SYS_AI_1hpvgsj2fpkq9
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_1hpvgsj2fpkq9" ON "DW"."W_OCCUPANCY_F" ("REPORTED_DATE_WID", "DATASOURCE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_1hpvgsj2fpkq9"  UNUSABLE;
