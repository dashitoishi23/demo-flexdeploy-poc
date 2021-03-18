--------------------------------------------------------
--  DDL for Index SYS_AI_djcwggdavaabc
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_djcwggdavaabc" ON "DW"."W_LOCATION_D" ("SNAPSHOT_PERIOD", "INTERNAL_LOCATION_CODE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_djcwggdavaabc"  UNUSABLE;
