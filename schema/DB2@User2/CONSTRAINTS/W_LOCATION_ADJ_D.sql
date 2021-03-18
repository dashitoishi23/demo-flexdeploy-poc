--------------------------------------------------------
--  Constraints for Table W_LOCATION_ADJ_D
--------------------------------------------------------

  ALTER TABLE "DW"."W_LOCATION_ADJ_D" MODIFY ("ROW_WID" NOT NULL ENABLE);
  ALTER TABLE "DW"."W_LOCATION_ADJ_D" ADD PRIMARY KEY ("ROW_WID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "DATA"  ENABLE;
