--------------------------------------------------------
--  DDL for View VW_CUSTOMER_D
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_CUSTOMER_D" ("ROW_WID", "L4_LEGAL_ENTITY_SRC_KEY", "L4_LEGAL_ENTITY_CODE", "L4_LEGAL_ENTITY_NAME", "L3_CUSTOMER_SRC_KEY", "L3_CUSTOMER_CODE", "L3_CUSTOMER_NAME", "L2_PARENT_CUSTOMER_SRC_KEY", "L2_PARENT_CUSTOMER_CODE", "L2_PARENT_CUSTOMER_NAME", "L1_GLOBAL_ULTIMATE_CUSTOMER_SRC_KEY", "L1_GLOBAL_ULTIMATE_CUSTOMER_NAME", "IS_GLOBAL_ULTIMATE", "MARKET_SEGMENT1", "MARKET_SEGMENT2", "MARKET_SEGMENT3", "DIVERSITY", "DIVERSITY_CATEGORY", "DIVERSITY_SUBCATEGORY", "COMPANY_OWNERSHIP_TYPE_NAME", "ACCOUNT_OWNER", "SALES_SECTOR", "ACTIVE_FLAG", "ACCOUNT_REFERENCE_NUMBER", "ACCOUNT_REVENUE_RANGE", "CUSTOMER_SUCCESS_DIRECTOR", "CUSTOMER_SUCCESS_MANAGER", "LEGACY_SRC_KEY", "EFFECTIVE_START_DATE", "EFFECTIVE_END_DATE", "CURRENT_FLAG", "CREATED_ON_DT", "CHANGED_ON_DT", "ETL_UPDATE_DT", "ETL_INSERT_DT", "ETL_PROC_WID", "DATASOURCE", "CUSTOMER_TYPE", "CUSTOMER_TIER", "GOLDEN_CUSTOMER_NAME", "UPDATED_BY", "ADJUSTMENT_COMMENT", "INTERCOMPANY_TELX") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
    dw.row_wid,
    dw.l4_legal_entity_src_key,
    dw.l4_legal_entity_code,
    dw.l4_legal_entity_name,
    nvl(adj.l3_customer_src_key, dw.l3_customer_src_key) l3_customer_src_key,
    nvl(adj.l3_customer_code, dw.l3_customer_code) l3_customer_code,
    nvl(adj.l3_customer_name, dw.l3_customer_name) l3_customer_name,
    nvl(adj.l2_parent_customer_src_key, dw.l2_parent_customer_src_key) l2_parent_customer_src_key,
    nvl(adj.l2_parent_customer_code, dw.l2_parent_customer_code) l2_parent_customer_code,
    nvl(adj.l2_parent_customer_name, dw.l2_parent_customer_name) l2_parent_customer_name,
    nvl(adj.l1_global_ultimate_customer_src_key, dw.l1_global_ultimate_customer_src_key) l1_global_ultimate_customer_src_key,
    nvl(adj.l1_global_ultimate_customer_name, dw.l1_global_ultimate_customer_name) l1_global_ultimate_customer_name,
    nvl(adj.is_global_ultimate, dw.is_global_ultimate) is_global_ultimate,
    nvl(adj.market_segment1, dw.market_segment1) market_segment1,
    nvl(adj.market_segment2, dw.market_segment2) market_segment2,
    nvl(adj.market_segment3, dw.market_segment3) market_segment3,
    nvl(adj.diversity, dw.diversity) diversity,
    nvl(adj.diversity_category, dw.diversity_category) diversity_category,
    nvl(adj.diversity_subcategory, dw.diversity_subcategory) diversity_subcategory,
    nvl(adj.company_ownership_type_name, dw.company_ownership_type_name) company_ownership_type_name,
    nvl(adj.account_owner, dw.account_owner) account_owner,
    nvl(adj.sales_sector, dw.sales_sector) sales_sector,
    nvl(adj.active_flag, dw.active_flag) active_flag,
    nvl(adj.account_reference_number, dw.account_reference_number) account_reference_number,
    nvl(adj.account_revenue_range, dw.account_revenue_range) account_revenue_range,
    nvl(adj.customer_success_director, dw.customer_success_director) customer_success_director,
    nvl(adj.customer_success_manager, dw.customer_success_manager) customer_success_manager,
    nvl(adj.legacy_src_key, dw.legacy_src_key) legacy_src_key,
    nvl(adj.effective_start_date, dw.effective_start_date) effective_start_date,
    nvl(adj.effective_end_date, dw.effective_end_date) effective_end_date,
    nvl(adj.current_flag, dw.current_flag) current_flag,
    dw.created_on_dt,
    dw.changed_on_dt,
    dw.etl_update_dt,
    dw.etl_insert_dt,
    dw.etl_proc_wid,
    dw.datasource,
    case 
       when nvl(adj.customer_type, dw.customer_type) is null then '(Not Assigned)'
       when nvl(adj.customer_type, dw.customer_type) in ('NA') then '(Not Assigned)'
       else initcap(nvl(adj.customer_type, dw.customer_type))
    end customer_type,
    nvl(adj.customer_tier, dw.customer_tier) customer_tier,
    nvl(adj.golden_customer_name, dw.golden_customer_name) golden_customer_name,
    adj.updated_by,
    adj.adjustment_comment,
    CASE
        WHEN nvl(adj.l2_parent_customer_code, dw.l2_parent_customer_code) = 'tel-x' THEN
            'Intercompany Telx'
        ELSE
            'All Reported Records'
    END intercompany_telx
FROM
    w_customer_d       dw
    LEFT JOIN w_customer_adj_d adj ON dw.row_wid = adj.row_wid
WHERE dw.Active_Record_Flag = 'Y'
;
  GRANT READ ON "DW"."VW_CUSTOMER_D" TO "ODS";
  GRANT READ ON "DW"."VW_CUSTOMER_D" TO "DW_RO";
