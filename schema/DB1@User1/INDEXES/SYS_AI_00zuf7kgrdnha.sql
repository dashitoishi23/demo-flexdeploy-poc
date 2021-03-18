--------------------------------------------------------
--  DDL for Index SYS_AI_00zuf7kgrdnha
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_00zuf7kgrdnha" ON "DW"."W_PROPERTY_D" ("HRIS_DIVISION", "DATASOURCE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_00zuf7kgrdnha"  UNUSABLE;
