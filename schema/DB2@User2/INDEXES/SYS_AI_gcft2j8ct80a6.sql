--------------------------------------------------------
--  DDL for Index SYS_AI_gcft2j8ct80a6
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_gcft2j8ct80a6" ON "DW"."W_GL_ACCOUNT_DH" ("L2_ACCOUNT_CLASS", "L1_FINANCIAL_STATEMENT", "ACCOUNT_CODE") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_gcft2j8ct80a6"  UNUSABLE;
