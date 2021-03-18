--------------------------------------------------------
--  DDL for View VW_OCCUPANCY_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_OCCUPANCY_F" ("PROPERTY_WID", "CUSTOMER_WID", "LEASE_TERMS_WID", "REPORTED_DATE_WID", "RENTABLE_SQ_FT", "RENTABLE_SQ_M", "BOMA_SQ_FT", "RAISED_FLOOR_SQ_FT", "KW", "MONTHLY_GAAP_RENT_NATIVE", "MONTHLY_RENT_NATIVE", "MONTHLY_TERMED_CONNECTIVITY_NATIVE", "RENT_AT_EXPIRATION_NATIVE", "CURRENT_EXPIRING_LEASE_TERM_IN_MONTHS", "FULL_LEASE_TERM_IN_MONTHS", "LEASE_REMAINING_TERM_IN_MONTHS", "CURRENCY_CODE", "EXCHANGE_RATE_USD", "EARLY_TERMINATION_TERM_IN_MONTHS", "EARLY_TERMINATION_RENT_AT_EXPIRATION", "LOAD_FACTOR", "LOCKED_FLAG", "CREATED_ON_DT", "CHANGED_ON_DT", "ETL_UPDATE_DT", "ETL_INSERT_DT", "ETL_PROC_WID", "DATASOURCE", "MONTHLY_NON_TERMED_CONNECTIVITY_REVENUE_NATIVE", "SNAPSHOT_PERIOD", "SNAPSHOT_DATE", "LEGACY_SRC_KEY", "ROW_WID", "UPDATED_BY", "ADJUSTMENT_COMMENT", "PRODUCT_WID", "PRODUCT_HIERARCHY_WID", "CURRENT_ABR_NATIVE", "CURRENT_ABR_USD", "EXPIRATION_ABR_NATIVE", "EXPIRATION_ABR_USD", "KW_GROUP", "MONTHLY_CONNECTIVITY_REVENUE_NATIVE", "MONTHLY_CONNECTIVITY_REVENUE_USD", "ANNUALIZED_CONNECTIVITY_REVENUE_NATIVE", "ANNUALIZED_CONNECTIVITY_REVENUE_USD", "MONTHLY_GAAP_RENT_USD", "MONTHLY_NON_TERMED_CONNECTIVITY_REVENUE_USD", "MONTHLY_RENT_USD", "MONTHLY_TERMED_CONNECTIVITY_REVENUE_USD", "RENT_AT_EXPIRATION_USD", "SQFT_DISTRIBUTION", "DLR_SHARE_RENTABLE_SQ_FT", "DLR_SHARE_KW", "DLR_SHARE_ANNUALIZED_CONNECTIVITY_REVENUE_NATIVE", "DLR_SHARE_ANNUALIZED_CONNECTIVITY_REVENUE_USD", "DLR_SHARE_CURRENT_ABR_NATIVE", "DLR_SHARE_CURRENT_ABR_USD", "DLR_SHARE_EXPIRATION_ABR_NATIVE", "DLR_SHARE_EXPIRATION_ABR_USD", "DLR_SHARE_WEIGHTED_FULL_LEASE_TERM_BY_ABR_USD", "DLR_SHARE_WEIGHTED_FULL_LEASE_TERM_BY_SQFT", "DLR_SHARE_WEIGHTED_LEASE_TERM_REMAINING_BY_SQFT", "DLR_SHARE_WEIGHTED_LEASE_TERM_REMAINING_BY_ABR_USD", "DLR_SHARE_CURRENT_ARR_NATIVE", "DLR_SHARE_CURRENT_ARR_USD", "DLR_SHARE_WEIGHTED_LEASE_TERM_REMAINING_BY_ARR_USD", "HELD_FOR_DEVELOPMENT_SQ_FT", "UNDER_ACTIVE_DEVELOPMENT_SQ_FT", "DLR_SHARE_HELD_FOR_DEVELOPMENT_SQ_FT", "DLR_SHARE_UNDER_ACTIVE_DEVELOPMENT_SQ_FT", "BUSINESS_UNIT", "EXPIRATION_YEAR_GROUP", "EXPIRATION_YEAR") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
    property_wid,
    customer_wid,
    lease_terms_wid,
    reported_date_wid,
    rentable_sq_ft,
    rentable_sq_m,
    boma_sq_ft,
    raised_floor_sq_ft,
    kw,
    monthly_gaap_rent_native,
    monthly_rent_native,
    monthly_termed_connectivity_native,
    rent_at_expiration_native,
    current_expiring_lease_term_in_months,
    full_lease_term_in_months,
    lease_remaining_term_in_months,
    currency_code,
    exchange_rate_usd,
    early_termination_term_in_months,
    early_termination_rent_at_expiration,
    load_factor,
    f.locked_flag,
    f.created_on_dt,
    f.changed_on_dt,
    f.etl_update_dt,
    f.etl_insert_dt,
    f.etl_proc_wid,
    f.datasource,
    monthly_non_termed_connectivity_revenue_native,
    f.snapshot_period,
    f.snapshot_date,
    f.legacy_src_key,
    f.row_wid,
    f.updated_by,
    f.adjustment_comment,
    product_wid,
    PRODUCT_HIERARCHY_WID,
    nvl(monthly_rent_native, 0) * 12 current_abr_native,
    nvl(monthly_rent_native, 0) * nvl(exchange_rate_usd, 1) * 12 current_abr_usd,
    nvl(rent_at_expiration_native, 0) * 12 expiration_abr_native,
    nvl(rent_at_expiration_native, 0) * nvl(exchange_rate_usd, 1) * 12 expiration_abr_usd,
    CASE
    WHEN COALESCE(unit_Status,'(Not Assigned)') = 'Vacant' THEN 'Available'
    WHEN COALESCE(unit_Status,'(Not Assigned)') = 'Occupied' and kw <= 300  THEN '0-300 kW'
    WHEN COALESCE(unit_Status,'(Not Assigned)') = 'Occupied' and (kw >= 301 AND kw <= 1000) THEN '301-1,000 kW'
    WHEN COALESCE(unit_Status,'(Not Assigned)') = 'Occupied' and (kw >= 1001 AND kw <= 2000) THEN  '1,001-2,000 kW'
    WHEN COALESCE(unit_Status,'(Not Assigned)') = 'Occupied' and kw >= 2001 THEN '>2,000 kW'
    ELSE 'Non-Datacenter'
    END kw_group ,
    nvl(monthly_termed_connectivity_native, 0) + nvl(monthly_non_termed_connectivity_revenue_native, 0) monthly_connectivity_revenue_native
    ,
    nvl(exchange_rate_usd, 1) * (nvl(monthly_termed_connectivity_native, 0) + nvl(monthly_non_termed_connectivity_revenue_native, 0))
    monthly_connectivity_revenue_usd,
    
    12 * (nvl(monthly_termed_connectivity_native, 0) + nvl(monthly_non_termed_connectivity_revenue_native, 0))
       Annualized_Connectivity_Revenue_Native,
    nvl(exchange_rate_usd, 1) * 12 * (nvl(monthly_termed_connectivity_native, 0) + nvl(monthly_non_termed_connectivity_revenue_native, 0))
       Annualized_Connectivity_Revenue_USD,
    nvl(monthly_gaap_rent_native, 0) * nvl(exchange_rate_usd, 1) monthly_gaap_rent_usd,
    nvl(monthly_non_termed_connectivity_revenue_native, 0) * nvl(exchange_rate_usd, 1) monthly_non_termed_connectivity_revenue_usd
    ,
    nvl(monthly_rent_native, 0) * nvl(exchange_rate_usd, 1) monthly_rent_usd,
    nvl(monthly_termed_connectivity_native, 0) * nvl(exchange_rate_usd, 0) monthly_termed_connectivity_revenue_usd,
    nvl(rent_at_expiration_native, 0) * nvl(exchange_rate_usd, 1) rent_at_expiration_usd,
    CASE
        WHEN UNIT_STATUS = 'Vacant' THEN 'Available'
        WHEN UNIT_STATUS = 'Occupied' AND nvl(rentable_sq_ft, 0) = 0           THEN
            '2,500 or less'
        WHEN UNIT_STATUS = 'Occupied' AND rentable_sq_ft BETWEEN 1 AND 2500     THEN
            '2,500 or less'
        WHEN UNIT_STATUS = 'Occupied' AND rentable_sq_ft BETWEEN 2501 AND 10000 THEN
            '2,501 to 10,000'
        WHEN UNIT_STATUS = 'Occupied' AND rentable_sq_ft BETWEEN 10001 AND 20000 THEN
            '10,001 to 20,000'
        WHEN UNIT_STATUS = 'Occupied' AND rentable_sq_ft BETWEEN 20001 AND 40000 THEN
            '20,001 to 40,000'
        WHEN UNIT_STATUS = 'Occupied' AND rentable_sq_ft BETWEEN 40001 AND 100000 THEN
            '40,001 to 100,000'
        WHEN UNIT_STATUS = 'Occupied' AND rentable_sq_ft > 100000 THEN 
            'Greater than 100,000'
        ELSE 'Development'
    END sqft_distribution
    
    ,nvl(Portfolio_Ownership_Percentage,1) * nvl(RENTABLE_SQ_FT,0) DLR_Share_RENTABLE_SQ_FT
    
    ,nvl(Portfolio_Ownership_Percentage,1) * nvl(kw,0)  DLR_Share_kw
    
    ,nvl(Portfolio_Ownership_Percentage,1) * 12 * (nvl(monthly_termed_connectivity_native, 0) + nvl(monthly_non_termed_connectivity_revenue_native, 0))
       DLR_Share_Annualized_Connectivity_Revenue_Native
    
    ,nvl(Portfolio_Ownership_Percentage,1) * 12 * nvl(exchange_rate_usd, 1) * (nvl(monthly_termed_connectivity_native, 0) + nvl(monthly_non_termed_connectivity_revenue_native, 0))
       DLR_Share_Annualized_Connectivity_Revenue_usd
    
    ,nvl(Portfolio_Ownership_Percentage,1) * nvl(monthly_rent_native, 0) * 12 DLR_Share_Current_ABR_Native
    
    ,nvl(Portfolio_Ownership_Percentage,1) * nvl(exchange_rate_usd, 1) * nvl(monthly_rent_native, 0) * 12 DLR_Share_Current_ABR_USD
    
    ,nvl(Portfolio_Ownership_Percentage,1) * nvl(rent_at_expiration_native, 0) * 12 DLR_Share_Expiration_ABR_Native
    
    ,nvl(Portfolio_Ownership_Percentage,1) * nvl(exchange_rate_usd, 1) * nvl(rent_at_expiration_native, 0) * 12 DLR_Share_Expiration_ABR_usd
    
    ,nvl(Portfolio_Ownership_Percentage,1) * nvl(exchange_rate_usd, 1) * nvl(monthly_rent_native, 0) * 12 * full_lease_term_in_months
        DLR_Share_Weighted_Full_Lease_Term_By_ABR_USD 
    
    ,nvl(Portfolio_Ownership_Percentage,1) * nvl(RENTABLE_SQ_FT,0) * full_lease_term_in_months DLR_Share_Weighted_Full_Lease_Term_by_SQFT
    
    ,nvl(Portfolio_Ownership_Percentage,1) * nvl(RENTABLE_SQ_FT,0) * lease_remaining_term_in_months DLR_Share_Weighted_Lease_Term_Remaining_By_SQFT
    
    ,nvl(Portfolio_Ownership_Percentage,1) * nvl(exchange_rate_usd, 1) * nvl(monthly_rent_native, 0) * 12 * lease_remaining_term_in_months
        DLR_Share_Weighted_Lease_Term_Remaining_By_ABR_USD
    
    ,( nvl(Portfolio_Ownership_Percentage,1) * 12 * (nvl(monthly_termed_connectivity_native, 0) + nvl(monthly_non_termed_connectivity_revenue_native, 0))  )
      + ( nvl(Portfolio_Ownership_Percentage,1) * nvl(monthly_rent_native, 0) * 12 )
         DLR_Share_Current_ARR_Native
    
    ,( nvl(Portfolio_Ownership_Percentage,1) * nvl(exchange_rate_usd, 1) * 12 * (nvl(monthly_termed_connectivity_native, 0) + nvl(monthly_non_termed_connectivity_revenue_native, 0))  )
      + 
     ( nvl(Portfolio_Ownership_Percentage,1) * nvl(exchange_rate_usd, 1) * nvl(monthly_rent_native, 0) * 12 )
         DLR_Share_Current_ARR_usd
    
    , ( 
         ( nvl(Portfolio_Ownership_Percentage,1) * nvl(exchange_rate_usd, 1) * 12 * (nvl(monthly_termed_connectivity_native, 0) + nvl(monthly_non_termed_connectivity_revenue_native, 0))  )
            + 
         ( nvl(Portfolio_Ownership_Percentage,1) * nvl(exchange_rate_usd, 1) * nvl(monthly_rent_native, 0) * 12 ) 
      ) * lease_remaining_term_in_months 
         DLR_Share_weighted_lease_term_remaining_by_ARR_USD
    
     , case when unit_status = 'Held for Development' then  nvl(RENTABLE_SQ_FT,0) else 0 end Held_For_Development_SQ_FT
    
     , case when unit_status = 'Under Active Development' then  nvl(RENTABLE_SQ_FT,0) else 0 end under_active_Development_SQ_FT
    
     , nvl(Portfolio_Ownership_Percentage,1) * (case when unit_status = 'Held for Development' then  nvl(RENTABLE_SQ_FT,0) else 0 end) 
           DLR_Share_Held_For_Development_SQ_FT
    
     , nvl(Portfolio_Ownership_Percentage,1) * (case when unit_status = 'Under Active Development' then  nvl(RENTABLE_SQ_FT,0) else 0 end) 
           DLR_Share_under_active_Development_SQ_FT
    , case 
             when to_char(f.datasource) = 'HISTORY LOAD~Apttus' 
                then 'EMEA Colo'
             when to_char(f.datasource) = 'HISTORY LOAD~Apttus Adjustments' 
                then 'EMEA Colo'
             when to_char(f.datasource) = 'HISTORY LOAD~Apttus Detail Adjustments' 
                then 'EMEA Colo'
             when to_char(f.datasource) = 'HISTORY LOAD~DLR Adjustments' then 
                'Scale'
             when to_char(f.datasource) = 'HISTORY LOAD~DLR Detail Adjustments' 
                then 'Scale'
             when to_char(f.datasource) = 'HISTORY LOAD~Interxion' 
                then 'Interxion'
             when to_char(f.datasource) = 'HISTORY LOAD~Telx Detail' 
                then 'NA Colo'
             when to_char(f.datasource) = 'HISTORY LOAD~Yardi7' 
                then 'Scale'
             when to_char(f.datasource) = 'YARDI' 
                then 'Scale'
             else to_char(f.datasource)
            end business_unit , 
            CASE
                WHEN COALESCE(unit_Status,'(Not Assigned)') = 'Vacant' THEN 'Available'
                WHEN COALESCE(unit_Status,'(Not Assigned)') LIKE '%Dev%' THEN 'Development'
                WHEN COALESCE(unit_Status,'(Not Assigned)') = 'Occupied' AND COALESCE(MTM_FLAG,'') = 'MTM' THEN 'Month To Month'
                WHEN COALESCE(unit_Status,'(Not Assigned)') = 'Occupied' AND EXTRACT( YEAR FROM(amendment_expire_reported_date)) > EXTRACT( YEAR FROM sysdate) + 9 THEN 'Thereafter'
                WHEN COALESCE(unit_Status,'(Not Assigned)') = 'Occupied' AND COALESCE(MTM_FLAG,'') <> 'MTM' THEN to_char(amendment_expire_reported_date,'YYYY') 
                  ELSE to_char(amendment_expire_reported_date,'YYYY')
            END AS Expiration_Year_Group,
             CASE 
              WHEN COALESCE(unit_Status,'(Not Assigned)') = 'Occupied' AND COALESCE(MTM_FLAG,'') = 'MTM' 
                     THEN EXTRACT(YEAR FROM ADD_MONTHS(F.SNAPSHOT_DATE,2)) 
              ELSE EXTRACT (YEAR FROM amendment_expire_reported_date) END as Expiration_Year
FROM
    (
        SELECT
            f.property_wid property_wid,
            nvl(af.customer_wid, f.customer_wid) customer_wid,
            nvl(af.lease_terms_wid, f.lease_terms_wid) lease_terms_wid,
            f.reported_date_wid,
            nvl(af.rentable_sq_ft, f.rentable_sq_ft) rentable_sq_ft,
            nvl(af.rentable_sq_m, f.rentable_sq_m) rentable_sq_m,
            nvl(af.boma_sq_ft, f.boma_sq_ft) boma_sq_ft,
            nvl(af.raised_floor_sq_ft, f.raised_floor_sq_ft) raised_floor_sq_ft,
            nvl(af.kw, f.kw) kw,
            nvl(af.monthly_gaap_rent_native, f.monthly_gaap_rent_native) monthly_gaap_rent_native,
            nvl(af.monthly_rent_native, f.monthly_rent_native) monthly_rent_native,
            nvl(af.monthly_termed_connectivity_native, f.monthly_termed_connectivity_native) monthly_termed_connectivity_native,
            nvl(af.rent_at_expiration_native, f.rent_at_expiration_native) rent_at_expiration_native,
            nvl(af.current_expiring_lease_term_in_months, f.current_expiring_lease_term_in_months) current_expiring_lease_term_in_months
            ,
            nvl(af.full_lease_term_in_months, f.full_lease_term_in_months) full_lease_term_in_months,
            nvl(af.lease_remaining_term_in_months, f.lease_remaining_term_in_months) lease_remaining_term_in_months,
            nvl(af.currency_code, f.currency_code) currency_code,
            nvl(af.exchange_rate_usd, f.exchange_rate_usd) exchange_rate_usd,
            nvl(af.early_termination_term_in_months, f.early_termination_term_in_months) early_termination_term_in_months,
            nvl(af.early_termination_rent_at_expiration, f.early_termination_rent_at_expiration) early_termination_rent_at_expiration
            ,
            nvl(af.load_factor, f.load_factor) load_factor,
            nvl(af.locked_flag, f.locked_flag) locked_flag,
            f.created_on_dt,
            f.changed_on_dt,
            f.etl_update_dt,
            f.etl_insert_dt,
            f.etl_proc_wid,
            f.datasource,
            nvl(af.monthly_non_termed_connectivity_revenue_native, f.monthly_non_termed_connectivity_revenue_native) monthly_non_termed_connectivity_revenue_native
            ,
            f.snapshot_period snapshot_period,
            f.snapshot_date snapshot_date,
            nvl(af.legacy_src_key, f.legacy_src_key) legacy_src_key,
            f.row_wid,
            nvl(af.updated_by, f.updated_by) updated_by,
            nvl(af.adjustment_comment, f.adjustment_comment) adjustment_comment,
            f.product_wid,
            nvl(af.PRODUCT_HIERARCHY_WID, f.PRODUCT_HIERARCHY_WID) PRODUCT_HIERARCHY_WID
        FROM
            w_occupancy_f       f
            LEFT JOIN w_occupancy_adj_f   af ON af.row_wid = f.row_wid
    ) f 
    join vw_property_dh p on f.property_wid = p.row_wid
    join vw_lease_terms_d d on f.lease_terms_wid = d.row_wid
;
  GRANT SELECT ON "DW"."VW_OCCUPANCY_F" TO "DW_RO";
  GRANT READ ON "DW"."VW_OCCUPANCY_F" TO "DW_RO";
