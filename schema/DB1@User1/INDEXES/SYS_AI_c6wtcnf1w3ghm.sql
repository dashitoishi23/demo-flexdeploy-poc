--------------------------------------------------------
--  DDL for Index SYS_AI_c6wtcnf1w3ghm
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_c6wtcnf1w3ghm" ON "DW"."W_PROPERTY_D" ("LEAF_LEVEL", "PROPERTY_CODE", "LIVE_FLAG", "SUITE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ;
