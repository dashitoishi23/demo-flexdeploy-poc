--------------------------------------------------------
--  DDL for Index SYS_AI_32dsuqp1cyvqp
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_32dsuqp1cyvqp" ON "DW"."W_LEASE_ACTIVITY_F" ("LEASE_REPORTING_TYPE", "ID") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_32dsuqp1cyvqp"  UNUSABLE;
