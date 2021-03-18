--------------------------------------------------------
--  DDL for Index IDX_W_CUSTOMER_D_L4_LEGAL_ENTITY_SRC_KEY
--------------------------------------------------------

  CREATE INDEX "DW"."IDX_W_CUSTOMER_D_L4_LEGAL_ENTITY_SRC_KEY" ON "DW"."W_CUSTOMER_D" ("L4_LEGAL_ENTITY_SRC_KEY") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
