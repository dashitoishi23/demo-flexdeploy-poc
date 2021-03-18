--------------------------------------------------------
--  DDL for Index SYS_AI_06p2k05tjggkv
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_06p2k05tjggkv" ON "DW"."W_DATE_D" ("QUARTER", "MONTH", "YEAR") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_06p2k05tjggkv"  UNUSABLE;
