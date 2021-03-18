--------------------------------------------------------
--  DDL for View VW_LEASE_TERMS_D
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_LEASE_TERMS_D" ("ROW_WID", "REPORTED_DATE", "LEASE_TYPE", "LEASE_SIGN_DATE", "LEASE_START_DATE", "LEASE_END_DATE", "AMENDMENT_TYPE", "AMENDMENT_SIGN_DATE", "AMENDMENT_START_DATE", "AMENDMENT_END_DATE", "AMENDMENT_EXPIRE_DATE", "AMENDMENT_EXPIRE_REPORTED_DATE", "MTM_FLAG", "EARLY_TERMINATION_OPTION_DATE", "AMENDMENT_ORIGINAL_START_DATE", "LOCKED_FLAG", "LEASE_NUMBER", "CREATED_ON_DT", "CHANGED_ON_DT", "ETL_UPDATE_DT", "ETL_INSERT_DT", "ETL_PROC_WID", "DATASOURCE", "LEASE_REMAINING_TERM", "DATE_EXPIRATION_YEAR", "LEGACY_SRC_KEY", "UNIT", "BUSINESS_UNIT") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
    row_wid,
    reported_date,
    lease_type,
    lease_sign_date,
    lease_start_date,
    lease_end_date,
    amendment_type,
    amendment_sign_date,
    amendment_start_date,
    amendment_end_date,
    amendment_expire_date,
    amendment_expire_reported_date,
    mtm_flag,
    early_termination_option_date,
    amendment_original_start_date,
    locked_flag,
    lease_number,
    created_on_dt,
    changed_on_dt,
    etl_update_dt,
    etl_insert_dt,
    etl_proc_wid,
    datasource,
    lease_remaining_term,
    to_number(to_char(amendment_expire_date,'YYYY')) date_expiration_year,
    legacy_src_key,
    unit,
    business_unit
FROM
    w_lease_terms_d
;
  GRANT READ ON "DW"."VW_LEASE_TERMS_D" TO "ODS";
  GRANT READ ON "DW"."VW_LEASE_TERMS_D" TO "DW_RO";
