--------------------------------------------------------
--  DDL for View VW_LEASE_ACTIVITY_D
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_LEASE_ACTIVITY_D" ("ROW_WID", "LEASE_ACTIVITY_SRC_KEY", "SNAPSHOT_PERIOD", "SNAPSHOT_DATE", "CONTRACT_NUMBER", "LEASE_REPORTING_TYPE", "TRANSACTION_TYPE", "LEASE_TYPE", "ACTIVITY_STATUS", "LEASE_DESCRIPTION", "LEASE_COMMENTS", "REPORT_DATE", "START_DATE", "END_DATE", "SIGN_DATE", "START_DATE_WID", "END_DATE_WID", "SIGN_DATE_WID", "LEASE_COMMENCEMENT_DATE", "ORIGINAL_TERM_EXPIRATION_DATE", "EXPIRATION_DATE", "CONTRACTUAL_START_DATE", "SUITES", "RENEWAL_TYPE", "CONTRACTUAL_RENT_START_DATE", "RENT_START_DATE", "ORIGINAL_TERM_END_DATE", "REPORTED_FLAG", "RENT_TREND_EXCLUDED_FLAG", "NON_LEASE_DEAL", "COMMENCEMENT_DATE_STATUS", "RETENTION_TYPE", "GENERATION", "CASH__RENT__STABILIZES", "RELEASE_FLAG", "PUBLISHED_FLAG", "PRODUCT_TYPE", "CROSS_CONNECT_TYPE", "BUSINESS_UNIT", "TELX_CASE_NUMBER", "LEASE_CURRENCY_CODE", "LEASE_EXCHANGE_RATE", "SIGN_PERIOD", "REPORT_PERIOD", "COMMENCEMENT_PERIOD", "SIGN_YEAR", "REPORT_YEAR", "COMMENCEMENT_YEAR", "REDUNDANCY", "CREATED_ON_DT", "CHANGED_ON_DT", "ETL_UPDATE_DT", "ETL_INSERT_DT", "ETL_PROC_WID", "DATASOURCE", "SOURCE", "ORDER_LINE_NUMBER", "PUBLISHED_LEASE_IDENTIFIER", "CUSTOMER_TYPE", "YARDI_TCODE", "UNIT_TYPE", "LEGACY_SRC_KEY", "UNIT_TYPE_SRC_KEY", "EXCLUDE_FROM_LEASESTATS", "LOCK_FLAG", "UPDATED_BY", "ADJUSTMENT_COMMENT", "LEASE_TRANSACTION_TYPE_GROUP", "PRODUCT_GROUP") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
    dw.row_wid,
    nvl(adj.lease_activity_src_key, dw.lease_activity_src_key) lease_activity_src_key,
    dw.snapshot_period,
    dw.snapshot_date,
    dw.contract_number,
    nvl(adj.lease_reporting_type, dw.lease_reporting_type) lease_reporting_type,
    nvl(adj.transaction_type, dw.transaction_type) transaction_type,
    nvl(adj.lease_type, dw.lease_type) lease_type,
    nvl(adj.activity_status, dw.activity_status) activity_status,
    nvl(adj.lease_description, dw.lease_description) lease_description,
    nvl(adj.lease_comments, dw.lease_comments) lease_comments,
    nvl(adj.report_date, dw.report_date) report_date,
    nvl(adj.start_date, dw.start_date) start_date,
    nvl(adj.end_date, dw.end_date) end_date,
    nvl(adj.sign_date, dw.sign_date) sign_date,
    nvl(adj.start_date_wid, dw.start_date_wid) start_date_wid,
    nvl(adj.end_date_wid, dw.end_date_wid) end_date_wid,
    nvl(adj.sign_date_wid, dw.sign_date_wid) sign_date_wid,
    nvl(adj.lease_commencement_date, dw.lease_commencement_date) lease_commencement_date,
    nvl(adj.original_term_expiration_date, dw.original_term_expiration_date) original_term_expiration_date,
    nvl(adj.expiration_date, dw.expiration_date) expiration_date,
    nvl(adj.contractual_start_date, dw.contractual_start_date) contractual_start_date,
    nvl(adj.suites, dw.suites) suites,
    nvl(adj.renewal_type, dw.renewal_type) renewal_type,
    nvl(adj.contractual_rent_start_date, dw.contractual_rent_start_date) contractual_rent_start_date,
    nvl(adj.rent_start_date, dw.rent_start_date) rent_start_date,
    nvl(adj.original_term_end_date, dw.original_term_end_date) original_term_end_date,
    nvl(adj.reported_flag, dw.reported_flag) reported_flag,
    nvl(adj.rent_trend_excluded_flag, dw.rent_trend_excluded_flag) rent_trend_excluded_flag,
    nvl(adj.non_lease_deal, dw.non_lease_deal) non_lease_deal,
    nvl(adj.commencement_date_status, dw.commencement_date_status) commencement_date_status,
    nvl(adj.retention_type, dw.retention_type) retention_type,
    nvl(adj.generation, dw.generation) generation,
    nvl(adj.cash__rent__stabilizes, dw.cash__rent__stabilizes) cash__rent__stabilizes,
    nvl(adj.release_flag, dw.release_flag) release_flag,
    nvl(adj.published_flag, dw.published_flag) published_flag,
    nvl(adj.product_type, dw.product_type) product_type,
    nvl(adj.cross_connect_type, dw.cross_connect_type) cross_connect_type,
    nvl(adj.business_unit, dw.business_unit) business_unit,
    nvl(adj.telx_case_number, dw.telx_case_number) telx_case_number,
    nvl(adj.lease_currency_code, dw.lease_currency_code) lease_currency_code,
    nvl(adj.lease_exchange_rate, dw.lease_exchange_rate) lease_exchange_rate,
    nvl(adj.sign_period, dw.sign_period) sign_period,
    nvl(adj.report_period, dw.report_period) report_period,
    nvl(adj.commencement_period, dw.commencement_period) commencement_period,
    nvl(adj.sign_year, dw.sign_year) sign_year,
    nvl(adj.report_year, dw.report_year) report_year,
    nvl(adj.commencement_year, dw.commencement_year) commencement_year,
    nvl(adj.redundancy, dw.redundancy) redundancy,
    dw.created_on_dt,
    dw.changed_on_dt,
    dw.etl_update_dt,
    dw.etl_insert_dt,
    dw.etl_proc_wid,
    dw.datasource,
    nvl(adj.source, dw.source) source,
    nvl(adj.order_line_number, dw.order_line_number) order_line_number,
    nvl(adj.published_lease_identifier, dw.published_lease_identifier) published_lease_identifier,
    nvl(adj.customer_type, dw.customer_type) customer_type,
    nvl(adj.yardi_tcode, dw.yardi_tcode) yardi_tcode,
    nvl(adj.unit_type, dw.unit_type) unit_type,
    nvl(adj.legacy_src_key, dw.legacy_src_key) legacy_src_key,
    --nvl(adj.transaction_type_group, dw.transaction_type_group) transaction_type_group,
    nvl(adj.unit_type_src_key, dw.unit_type_src_key) unit_type_src_key,
    nvl(adj.exclude_from_leasestats, dw.exclude_from_leasestats) exclude_from_leasestats,
    dw.lock_flag,
    adj.updated_by,
    adj.adjustment_comment,
     CASE  
        WHEN dw.Transaction_Type IN ('New', 'Expansion') THEN 'New Leases' 
        WHEN dw.Transaction_Type IN ('Renewal', 'Extension', 'Hold Over') THEN 'Renewing Leases' 
        WHEN dw.Transaction_Type IN ('Termination', 'Reduction', 'Expiration') THEN 'Terminating Leases' 
        WHEN dw.Transaction_Type IN ('Conversion') THEN 'Converted Leases' 
        ELSE 'Other' 
    END Lease_Transaction_Type_Group,
    CASE
        WHEN upper(dw.unit_type) IN (
            'POWERED BASE BUILDING',
            'TURN-KEY FLEX'
        ) THEN
            'Data Center'
        WHEN upper(dw.unit_type) IN (
            'COLOCATION',
            'CONNECT',
            'CONNECTIVITY',
            'PATHWAY'
        ) THEN
            'Colo and Interconnection'
        WHEN upper(dw.unit_type) IN (
            'OFFICE',
            'RETAIL'
        ) THEN
            'Non-Technical'
        ELSE
            'Other'
    END PRODUCT_GROUP
FROM
    w_lease_activity_d       dw
    LEFT JOIN w_lease_activity_adj_d   adj ON dw.row_wid = adj.row_wid
;
  GRANT READ ON "DW"."VW_LEASE_ACTIVITY_D" TO "ODS";
  GRANT READ ON "DW"."VW_LEASE_ACTIVITY_D" TO "DW_RO";
