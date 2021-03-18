--------------------------------------------------------
--  DDL for Index SYS_AI_a2p1wpx501kkg
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_a2p1wpx501kkg" ON "DW"."W_LEASE_ACTIVITY_D" ("DATASOURCE", "LOCK_FLAG", "LEASE_ACTIVITY_SRC_KEY") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
