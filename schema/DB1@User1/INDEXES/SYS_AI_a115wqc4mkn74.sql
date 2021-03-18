--------------------------------------------------------
--  DDL for Index SYS_AI_a115wqc4mkn74
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_a115wqc4mkn74" ON "DW"."W_GL_BUDGET_F" ("ACCOUNT_WID", "DATE_WID") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
