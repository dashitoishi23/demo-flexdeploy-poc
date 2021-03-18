--------------------------------------------------------
--  DDL for Index IDX_W_ACCOUNT_RECEIVABLE_DETAILS_F_CURRENCY_WID
--------------------------------------------------------

  CREATE INDEX "DW"."IDX_W_ACCOUNT_RECEIVABLE_DETAILS_F_CURRENCY_WID" ON "DW"."W_ACCOUNT_RECEIVABLE_DETAILS_F" ("CURRENCY_WID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
