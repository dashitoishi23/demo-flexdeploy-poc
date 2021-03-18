--------------------------------------------------------
--  DDL for View VW_LOCATION_D
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_LOCATION_D" ("ROW_WID", "LOCATION_SRC_KEY", "EFFECTIVE_START_DATE", "EFFECTIVE_END_DATE", "OBJECT_VERSION_NUMBER", "BUSINESS_GROUP_ID", "ACTIVE_STATUS", "SITE_CODE_OPERATIONAL", "FORMALLY_KNOWN_AS_SITE_CODE", "ACQUIRED_DATE", "DISPOSITION_DATE", "PROPERTY_TYPE", "CAMPUS", "CORPORATE_OFFICE", "REGION", "MARKET", "DIVISION", "LANDLORD_OPERATED", "NON_DLR_SITE", "OWNERSHIP_PERCENTAGE", "PORTFOLIO_OWNERSHIP_PERCENTAGE", "OWNERSHIP_TYPE", "EXTERNALLY_REPORTED", "DATA_CENTER_MANAGER", "DATA_CENTER_OPERATIONS_DIRECTOR", "MANAGER_FACILITY_ENGINEERING", "PORTFOLIO_MANAGER", "PORTFOLIO_OPERATIONS_DIRECTOR", "PROPERTY_ASSISTANT", "REAL_ESTATE_MANAGER", "REGIONAL_DATA_CENTER_OPERATIONS_MANAGER", "REGIONAL_PORTFOLIO_OPERATIONS_MANAGER", "SENIOR_REAL_ESTATE_MANAGER", "FACILITY_DEVELOPMENT_STATUS", "LEASED_OWNED", "METRO", "LAST_UPDATE_DATE", "SNAPSHOT_PERIOD", "SNAPSHOT_DATE", "CREATED_ON_DT", "CHANGED_ON_DT", "ETL_UPDATE_DT", "ETL_INSERT_DT", "ETL_PROC_WID", "DATASOURCE", "INTERNAL_LOCATION_CODE", "ADDRESS1", "ADDRESS2", "CITY", "STATE", "COUNTRY_CODE", "ZIP_POSTAL_CODE", "COUNTRY", "UPDATED_BY", "ADJUSTMENT_COMMENT") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
    dw.row_wid,
    dw.location_src_key,
    nvl(adj.effective_start_date, dw.effective_start_date) effective_start_date,
    nvl(adj.effective_end_date, dw.effective_end_date) effective_end_date,
    dw.object_version_number,
    nvl(adj.business_group_id, dw.business_group_id) business_group_id,
    nvl(adj.active_status, dw.active_status) active_status,
    nvl(adj.site_code_operational, dw.site_code_operational) site_code_operational,
    nvl(adj.formally_known_as_site_code, dw.formally_known_as_site_code) formally_known_as_site_code,
    nvl(adj.acquired_date, dw.acquired_date) acquired_date,
    nvl(adj.disposition_date, dw.disposition_date) disposition_date,
    nvl(adj.property_type, dw.property_type) property_type,
    nvl(adj.campus, dw.campus) campus,
    nvl(adj.corporate_office, dw.corporate_office) corporate_office,
    nvl(adj.region, dw.region) region,
    nvl(adj.market, dw.market) market,
    nvl(adj.division, dw.division) division,
    nvl(adj.landlord_operated, dw.landlord_operated) landlord_operated,
    nvl(adj.non_dlr_site, dw.non_dlr_site) non_dlr_site,
    nvl(adj.ownership_percentage, dw.ownership_percentage) ownership_percentage,
    nvl(adj.portfolio_ownership_percentage, dw.portfolio_ownership_percentage) portfolio_ownership_percentage,
    nvl(adj.ownership_type, dw.ownership_type) ownership_type,
    nvl(adj.externally_reported, dw.externally_reported) externally_reported,
    nvl(adj.data_center_manager, dw.data_center_manager) data_center_manager,
    nvl(adj.data_center_operations_director, dw.data_center_operations_director) data_center_operations_director,
    nvl(adj.manager_facility_engineering, dw.manager_facility_engineering) manager_facility_engineering,
    nvl(adj.portfolio_manager, dw.portfolio_manager) portfolio_manager,
    nvl(adj.portfolio_operations_director, dw.portfolio_operations_director) portfolio_operations_director,
    nvl(adj.property_assistant, dw.property_assistant) property_assistant,
    nvl(adj.real_estate_manager, dw.real_estate_manager) real_estate_manager,
    nvl(adj.regional_data_center_operations_manager, dw.regional_data_center_operations_manager) regional_data_center_operations_manager    ,
    nvl(adj.regional_portfolio_operations_manager, dw.regional_portfolio_operations_manager) regional_portfolio_operations_manager    ,
    nvl(adj.senior_real_estate_manager, dw.senior_real_estate_manager) senior_real_estate_manager,
    nvl(adj.facility_development_status, dw.facility_development_status) facility_development_status,
    nvl(adj.leased_owned, dw.leased_owned) leased_owned,
    nvl(adj.metro, dw.metro) metro,
    nvl(adj.last_update_date, dw.last_update_date) last_update_date,
    nvl(adj.snapshot_period, dw.snapshot_period) snapshot_period,
    nvl(adj.snapshot_date, dw.snapshot_date) snapshot_date,
    nvl(adj.created_on_dt, dw.created_on_dt) created_on_dt,
    nvl(adj.changed_on_dt, dw.changed_on_dt) changed_on_dt,
    nvl(adj.etl_update_dt, dw.etl_update_dt) etl_update_dt,
    nvl(adj.etl_insert_dt, dw.etl_insert_dt) etl_insert_dt,
    nvl(adj.etl_proc_wid, dw.etl_proc_wid) etl_proc_wid,
    dw.datasource,
    nvl(adj.internal_location_code, dw.internal_location_code) internal_location_code,
    nvl(adj.address1, dw.address1) address1,
    nvl(adj.address2, dw.address2) address2,
    nvl(adj.city, dw.city) city,
    nvl(adj.state, dw.state) state,
    nvl(adj.country_code, dw.country_code) country_code,
    nvl(adj.zip_postal_code, dw.zip_postal_code) zip_postal_code,
    nvl(adj.country, dw.country) country,
    adj.updated_by,
    adj.adjustment_comment
FROM
    w_location_d       dw
    LEFT JOIN w_location_adj_d   adj
    on dw.row_wid = adj.row_wid
;
  GRANT READ ON "DW"."VW_LOCATION_D" TO "ODS";
  GRANT READ ON "DW"."VW_LOCATION_D" TO "DW_RO";
