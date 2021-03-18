--------------------------------------------------------
--  DDL for Index SYS_AI_a047jgpc3m84t
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_a047jgpc3m84t" ON "DW"."W_GL_ACCOUNT_DH" ("L7_ACCOUNT_SUB_TYPE", "L5_ACCOUNT_GROUP", "L6_ACCOUNT_TYPE", "ACCOUNT_DESCRIPTION") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_a047jgpc3m84t"  UNUSABLE;
