--------------------------------------------------------
--  DDL for Index SYS_AI_f4vpaaqbn28ws
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_f4vpaaqbn28ws" ON "DW"."W_ETL_AUDIT_LOG" ("LOAD_PLAN_NAME", "SESS_END_TIME") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_f4vpaaqbn28ws"  UNUSABLE;
