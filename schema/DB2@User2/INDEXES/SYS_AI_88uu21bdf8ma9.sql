--------------------------------------------------------
--  DDL for Index SYS_AI_88uu21bdf8ma9
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_88uu21bdf8ma9" ON "DW"."W_ETL_AUDIT_LOG" ("PKG_NAME", "TARGET_NAME", "LOAD_PLAN_NAME", "MAPPING_NAME", "PKG_STATUS") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_88uu21bdf8ma9"  UNUSABLE;
