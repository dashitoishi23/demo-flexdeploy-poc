--------------------------------------------------------
--  Constraints for Table W_LEASE_ACTIVITY_ADJ_F
--------------------------------------------------------

  ALTER TABLE "DW"."W_LEASE_ACTIVITY_ADJ_F" MODIFY ("ROW_WID" NOT NULL ENABLE);
  ALTER TABLE "DW"."W_LEASE_ACTIVITY_ADJ_F" ADD PRIMARY KEY ("ROW_WID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "DATA"  ENABLE;
