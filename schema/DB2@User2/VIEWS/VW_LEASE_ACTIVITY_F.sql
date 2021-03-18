--------------------------------------------------------
--  DDL for View VW_LEASE_ACTIVITY_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_LEASE_ACTIVITY_F" ("ROW_WID", "CUSTOMER_WID", "PROPERTY_WID", "OPPORTUNITY_WID", "LEASE_ACTIVITY_WID", "LEASE_REPORTING_TYPE", "SIGNED_PERIOD_DATE_WID", "REPORTED_PERIOD_DATE_WID", "COMMENCEMENT_PERIOD_DATE_WID", "CONTRACTUAL_TOTAL_RENT", "CONTRACTUAL_GAAP_RENT", "TOTAL_RENT", "MONTHLY_GAAP_RENT", "EXPIRING_LAST_YEAR", "TERM", "KW", "NRSF", "CONTRACTUAL_TERM", "RSF", "INCREMENTAL_GAAP_ANNUAL_REVENUE", "CASH_RENT_EXPIRING_LAST_YEAR", "AVG_RENT_ESCALATION", "LANDLORD_WORK", "INSTALLATION_FEES", "TENANT_IMPROVEMENTS", "PRIOR_GAAP_RENT", "PRIOR_LAST_YEAR_CASH_RENT", "CONTRACTUAL_INCREMENTAL_RENT", "EXPIRING_GAAP_RENT", "SECOND_YEAR_REVENUE", "FIRST_YEAR_REVENUE", "TENANT_BROKER_COMMISSION", "LANDLORD_BROKER_COMMISSION", "REFERRING_AGENT_COMMISSION", "STABILIZED_FIRST_YEAR_CASH_RENT", "ACTUAL_FIRST_YEAR_CASH", "FREE_RENT", "OPEX_EQUIVALENT", "CROSS_CONNECT_COUNT", "CROSS_CONNECT_DISCOUNT", "NET_EFFECTIVE_YIELD", "AVERAGE_YIELD", "STABILIZED_YIELD", "INVESTMENT_BASIS", "TELX_CASE_NUMBER", "OPPORTUNITY_AMOUNT_NATIVE", "OPPORTUNITY_AMOUNT_USD", "TOTAL_CONTRACTUAL_KW_COMMITMENT", "TOTAL_INTERNAL_COMMISSIONS", "TOTAL_EXTERNAL_COMMISSIONS", "TOTAL_LEASE_COST", "LOCK_FLAG", "LOCK_TIMESTAMP", "CREATED_ON_DT", "CHANGED_ON_DT", "ETL_UPDATE_DT", "ETL_INSERT_DT", "ETL_PROC_WID", "DATASOURCE", "ID", "SNAPSHOT_PERIOD", "LEGACY_SRC_KEY", "PRODUCT_WID", "UPDATED_BY", "ADJUSTMENT_COMMENT", "PRODUCT_HIERARCHY_WID", "TERM_BY_NRSF", "OPEX_BY_NRSF", "ABSOLUTE_NRSF", "ANNUALIZED_FREE_RENT", "ANNUALIZED_FREE_RENT_PSF", "ANNUALIZED_GAAP_RENT_USD", "ANNUALIZED_GAAP_RENT_USD_PSF", "ANNUALIZED_OPEX_PSF", "POTENTIAL_RENT", "ANNUALIZED_POTENTIAL_RENT", "ANNUALIZED_POTENTIAL_RENT_PSF", "ANNUALIZED_TENANT_IMPROVEMENTS", "ANNUALIZED_TI", "ANNUALIZED_TI_PSF", "ANNUALIZED_TOTAL_COMMISSION", "ANNUALIZED_TOTAL_COMMISSION_PSF", "ANNUALIZED_TOTAL_LEASE_COSTS", "CONTRACTUAL_GAAP_RENT_PER_KW", "CONTRACTUAL_GAAP_RENT_PSF", "EXPIRING_CASH_RENT_PSF", "EXPIRING_GAAP_RENT_PSF", "EXPIRING_MONTHLY_GAAP_PER_KW", "EXTERNAL_COMMISSIONS", "GAAP_RENT_CHANGE_PERCENT", "GAAP_RENT_VS_CASH_RENT", "GROSS_NET_RENT", "LEASE_COSTS_PSF", "LOAD_FACTOR", "MONTHLY_GAAP_RENT_PER_KW", "NET_EFFECTIVE_RENT", "STABILIZED_FIRST_YEAR_CASH_RENT_PSF", "TOTAL_COMMISSION", "TOTAL_COMMISSION_PER_PSF", "WEIGHTED_ANNUALIZED_TERM_BY_SQFT", "WEIGHTED_ANNUALIZED_TERM_BY_SQFT_YEARS", "OPEX_PER_KW", "OPEX_LESS_UTILITIES_PER_KW", "SALES_DIRECTOR_COMMISSION", "VP_SALES_COMMISSION", "SVP_SALES_COMMISSION", "PARTNER_BROKER_COMMISION", "COLO_MANAGER_COMMISSION", "MONTHLY_OPEX_ON_KW", "MONTHLY_OPEX_LESS_UTILITIES_ON_KW", "ANNUALIZED_OPEX_ON_KW", "ANNUALIZED_OPEX_ON_NRSF", "ANNUALIZED_NET_RENT_ON_KW", "MONTHLY_NET_RENT_ON_KW", "ANNUALIZED_NET_RENT_LESS_UTILITIES_ON_KW", "MONTHLY_NET_RENT_LESS_UTILITIES_ON_KW", "ANNUALIZED_NET_RENT_ON_SQ_FT", "ANNUALIZED_NET_RENT_PKW", "ANNUALIZED_NET_RENT_PSF", "ANNUALIZED_NET_EFFECTIVE_RENT_ON_KW", "MONTHLY_NET_EFFECTIVE_RENT_ON_KW", "ANNUALIZED_NET_EFFECTIVE_RENT_ON_SQ_FT", "NET_EFFECTIVE_RENT_PKW", "NET_EFFECTIVE_RENT_PSF", "ANNUALIZED_GAAP_RENT_VS_STABILIZED_FIRST_YEAR_CASH", "CASH_RENT_CHANGE_PERCENT", "DAYS_COMMENCING_LAG", "KW_GROUP1", "KW_GROUP2", "KW_GROUPING", "KW_TRANCHE", "TOTAL_TI_AND_LANDLORDWORK", "GAAP_RENT_OPP_VARIANCE") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  (

 SELECT
        w_lease_activity_f.row_wid,
        w_lease_activity_f.customer_wid,
        w_lease_activity_f.property_wid,
        w_lease_activity_f.opportunity_wid,
        w_lease_activity_f.lease_activity_wid,
        w_lease_activity_f.lease_reporting_type,
        w_lease_activity_f.signed_period_date_wid,
        w_lease_activity_f.reported_period_date_wid,
        w_lease_activity_f.commencement_period_date_wid,
        nvl(w_lease_activity_f.contractual_total_rent,0) contractual_total_rent,
        nvl(w_lease_activity_f.contractual_gaap_rent,0) contractual_gaap_rent,
        nvl(w_lease_activity_f.total_rent,0) total_rent,
        nvl(w_lease_activity_f.monthly_gaap_rent,0) monthly_gaap_rent,        
        --nvl(nvl(w_lease_activity_f.contractual_total_rent,0) / ( nullif(term,0) ),0) monthly_gaap_rent ,
        w_lease_activity_f.expiring_last_year,
        nvl(w_lease_activity_f.term,0) term,
        nvl(w_lease_activity_f.kw,0) kw,
        nvl(w_lease_activity_f.nrsf,0) nrsf,
        nvl(w_lease_activity_f.contractual_term,0) contractual_term,
        nvl(w_lease_activity_f.rsf,0) rsf,
        nvl(w_lease_activity_f.incremental_gaap_annual_revenue,0) incremental_gaap_annual_revenue,
        nvl(w_lease_activity_f.cash_rent_expiring_last_year,0) cash_rent_expiring_last_year,
        nvl(w_lease_activity_f.avg_rent_escalation,0) avg_rent_escalation,
        nvl(w_lease_activity_f.landlord_work,0) landlord_work,
        nvl(w_lease_activity_f.installation_fees,0) installation_fees,
        nvl(w_lease_activity_f.tenant_improvements,0) tenant_improvements,
        nvl(w_lease_activity_f.prior_gaap_rent,0) prior_gaap_rent,
        nvl(w_lease_activity_f.prior_last_year_cash_rent,0) prior_last_year_cash_rent,
        nvl(w_lease_activity_f.contractual_incremental_rent,0) contractual_incremental_rent,
        nvl(w_lease_activity_f.expiring_gaap_rent,0) expiring_gaap_rent,
        nvl(w_lease_activity_f.second_year_revenue,0) second_year_revenue,
        nvl(w_lease_activity_f.first_year_revenue,0) first_year_revenue,
        nvl(w_lease_activity_f.tenant_broker_commission,0) tenant_broker_commission,
        nvl(w_lease_activity_f.landlord_broker_commission,0) landlord_broker_commission,
        nvl(w_lease_activity_f.referring_agent_commission,0) referring_agent_commission,
        nvl(w_lease_activity_f.stabilized_first_year_cash_rent,0) stabilized_first_year_cash_rent,
        nvl(w_lease_activity_f.actual_first_year_cash,0) actual_first_year_cash,
        nvl(w_lease_activity_f.free_rent,0) free_rent,
        nvl(w_lease_activity_f.opex_equivalent,0) opex_equivalent,
        nvl(w_lease_activity_f.cross_connect_count,0) cross_connect_count,
        nvl(w_lease_activity_f.cross_connect_discount,0) cross_connect_discount,
        nvl(w_lease_activity_f.net_effective_yield,0) net_effective_yield,
        nvl(w_lease_activity_f.average_yield,0) average_yield,
        nvl(w_lease_activity_f.stabilized_yield,0) stabilized_yield,
        nvl(w_lease_activity_f.investment_basis,0) investment_basis,
        w_lease_activity_f.telx_case_number,
        nvl(w_lease_activity_f.opportunity_amount_native,0) opportunity_amount_native,
        w_lease_activity_f.opportunity_amount_usd,
        nvl(w_lease_activity_f.total_contractual_kw_commitment,0) total_contractual_kw_commitment,
        nvl(w_lease_activity_f.total_internal_commissions,0) total_internal_commissions,
        nvl(w_lease_activity_f.total_external_commissions,0) total_external_commissions,
        nvl(w_lease_activity_f.total_lease_cost,0) total_lease_cost,
        --load_factor,
        w_lease_activity_f.lock_flag,
        w_lease_activity_f.lock_timestamp,
        w_lease_activity_f.created_on_dt,
        w_lease_activity_f.changed_on_dt,
        w_lease_activity_f.etl_update_dt,
        w_lease_activity_f.etl_insert_dt,
        w_lease_activity_f.etl_proc_wid,
        w_lease_activity_f.datasource,
        w_lease_activity_f.id,
        w_lease_activity_f.snapshot_period,
        w_lease_activity_f.legacy_src_key,
        w_lease_activity_f.product_wid,
        w_lease_activity_f.updated_by,
        w_lease_activity_f.adjustment_comment,
        w_lease_activity_f.PRODUCT_HIERARCHY_WID,

        nvl(ABS(Term) * ABS(NRSF),0) AS Term_By_NRSF,

        nvl(OPEX_Equivalent * ABS(NRSF),0) AS Opex_By_NRSF,

        nvl(ABS(NRSF), 0) AS Absolute_NRSF ,

        nvl(nullif((nvl(Free_Rent, 0) / nullif(ABS(Term), 0)), 0) * 12,0) annualized_free_rent,

        nvl(free_rent * 12 / ( nullif(term,0) * nullif(nrsf,0) ),0) annualized_free_rent_psf,
        --nvl(contractual_total_rent * 12 / nullif(term,0),0) annualized_gaap_rent_usd,
		case when Lease_Transaction_Type_Group =  'Terminating Leases' then abs(nvl((monthly_gaap_rent * 12 ) , 0)) else nvl((monthly_gaap_rent * 12 ) , 0) end annualized_gaap_rent_usd,
        --nvl(contractual_total_rent * 12 / ( nullif(term,0) * nullif(nrsf,0) ),0) annualized_gaap_rent_usd_psf,
		case when Lease_Transaction_Type_Group =  'Terminating Leases' then abs(nvl((monthly_gaap_rent * 12) /  nullif(nrsf,0) ,0)) else  nvl((monthly_gaap_rent * 12) /  nullif(nrsf,0) ,0) end annualized_gaap_rent_usd_psf,
        nvl((opex_equivalent / nullif(nrsf,0)) * 12,0) annualized_opex_psf,

        nvl(( nvl(contractual_total_rent, 0) + nvl(free_rent, 0) ),0) potential_rent,

        case when Lease_Transaction_Type_Group =  'Terminating Leases' then abs(nvl(( nvl(contractual_total_rent, 0) + nvl(free_rent, 0) ) / nullif(term,0) * 12,0))
				else nvl(( nvl(contractual_total_rent, 0) + nvl(free_rent, 0) ) / nullif(term,0) * 12,0) end annualized_potential_rent,
        case when Lease_Transaction_Type_Group =  'Terminating Leases' then abs(nvl(( nvl(contractual_total_rent, 0) + nvl(free_rent, 0) ) / nullif(term, 0) * 12 / nullif(nrsf,0),0))
				else nvl(( nvl(contractual_total_rent, 0) + nvl(free_rent, 0) ) / nullif(term, 0) * 12 / nullif(nrsf,0),0) end annualized_potential_rent_psf,
        nvl((tenant_improvements / nullif(term,0)) * 12,0) annualized_tenant_improvements,

        nvl(( nvl(tenant_improvements, 0) + nvl(landlord_work, 0) ) / nullif(term,0) * 12,0) annualized_ti,

        nvl(( nvl(tenant_improvements, 0) + nvl(landlord_work, 0) ) / nullif(term,0) * 12 / nullif(nrsf,0),0) annualized_ti_psf,

        nvl((( /* nvl(tenant_broker_commission, 0) + nvl(landlord_broker_commission, 0) + nvl(referring_agent_commission, 0) + */
        nvl(total_internal_commissions, 0) + nvl(total_external_commissions, 0) ) / nullif(term,0)) * 12,0) annualized_total_commission,

        nvl(((( /* nvl(tenant_broker_commission, 0) + nvl(landlord_broker_commission, 0) + nvl(referring_agent_commission, 0) + */
        nvl(total_internal_commissions, 0) + nvl(total_external_commissions, 0) ) / nullif(term,0)) * 12) / nullif(nrsf,0),0) annualized_total_commission_psf,

        nvl(total_lease_cost / nullif(term,0) * 12,0) annualized_total_lease_costs,

        nvl(contractual_gaap_rent / nullif(kw,0) , 0) contractual_gaap_rent_per_kw,

        nvl(contractual_gaap_rent / nullif(nrsf,0) ,0) contractual_gaap_rent_psf,

        nvl(cash_rent_expiring_last_year / nullif(nrsf,0) ,0) expiring_cash_rent_psf,

        nvl(expiring_gaap_rent / nullif(nrsf,0),0) expiring_gaap_rent_psf,

        nvl(expiring_gaap_rent / ( 12 * nullif(kw,0) ),0) expiring_monthly_gaap_per_kw,

        nvl(tenant_broker_commission, 0) + nvl(landlord_broker_commission, 0) + nvl(referring_agent_commission, 0) external_commissions        ,

        nvl(( nvl(contractual_total_rent * 12 / nullif(term,0), 0) - nvl(expiring_gaap_rent, 0) ) / nullif(expiring_gaap_rent,0) ,0) gaap_rent_change_percent        ,

        nvl(( contractual_total_rent * 12 / nullif(term,0) ) / nullif(stabilized_first_year_cash_rent,0) ,0) gaap_rent_vs_cash_rent,

        nvl((contractual_total_rent * 12) / nullif(term,0),0) gross_net_rent,

        /* nvl(( contractual_total_rent * 12 / nullif(term,0) ) / nullif(kw,0) ,0) gross_net_rent_pkw, */

        /* nvl(( contractual_total_rent * 12 / nullif(term,0) ) / nullif(nrsf,0) ,0) gross_net_rent_psf, */

        /* nvl(( nvl(tenant_broker_commission, 0) + nvl(landlord_broker_commission, 0) + nvl(referring_agent_commission, 0) + */
        -- nvl((nvl(total_internal_commissions, 0) + nvl(total_external_commissions, 0) + nvl(landlord_work, 0) + nvl(tenant_improvements, 0) ) / nullif(nrsf,0) , 0) lease_costs_psf,
		nvl((nvl(total_lease_cost, 0)) / nullif(nrsf,0) , 0) lease_costs_psf,
        load_factor  load_factor,

        nvl(( contractual_total_rent * 12 / nullif(term,0) ) / ( 12 * nullif(kw,0) ),0) monthly_gaap_rent_per_kw,

        nvl( ( contractual_total_rent * 12 / nullif(term,0) - tenant_improvements / nullif(term,0) * 12 - ( 
        /* nvl(tenant_broker_commission, 0) + nvl(landlord_broker_commission, 0) + nvl(referring_agent_commission, 0) + */
        nvl(total_internal_commissions, 0) ) / nullif(term,0) * 12 )  ,0) net_effective_rent        ,

        /*
        nvl( ( contractual_total_rent * 12 / nullif(term,0) - tenant_improvements / nullif(term,0) * 12 - ( nvl(tenant_broker_commission, 0) + nvl(landlord_broker_commission
        , 0) + nvl(referring_agent_commission, 0) + nvl(total_internal_commissions, 0) ) / nullif(term,0) * 12 ) / nullif(nrsf,0) ,0) net_effective_rent_psf        ,
        */

        nvl(stabilized_first_year_cash_rent / nullif(nrsf,0) ,0) stabilized_first_year_cash_rent_psf,

        /* nvl(tenant_broker_commission, 0) + nvl(landlord_broker_commission, 0) + nvl(referring_agent_commission, 0) + */
        nvl(total_internal_commissions, 0) + nvl(total_external_commissions, 0) total_commission,

        nvl(nvl(total_internal_commissions, 0) + nvl(total_external_commissions, 0) / nullif(nrsf,0) ,0) total_commission_per_psf,

        nvl((term / 12) * nrsf,0) weighted_annualized_term_by_sqft,
        nvl((term / 12) * (nrsf / 12),0) weighted_annualized_term_by_sqft_years,

        nvl(w_lease_activity_f.OPEX_PER_KW ,0) OPEX_PER_KW ,
        nvl(w_lease_activity_f.OPEX_LESS_UTILITIES_PER_KW,0) OPEX_LESS_UTILITIES_PER_KW,
        nvl(w_lease_activity_f.SALES_DIRECTOR_COMMISSION,0) SALES_DIRECTOR_COMMISSION,
        nvl(w_lease_activity_f.VP_SALES_COMMISSION,0) VP_SALES_COMMISSION,
        nvl(w_lease_activity_f.SVP_SALES_COMMISSION,0) SVP_SALES_COMMISSION,
        nvl(w_lease_activity_f.PARTNER_BROKER_COMMISION,0) PARTNER_BROKER_COMMISION,
        nvl(w_lease_activity_f.COLO_MANAGER_COMMISSION,0) COLO_MANAGER_COMMISSION,

        nvl(OPEX_PER_KW * kW ,0) Monthly_Opex_on_kW,
        nvl(OPEX_LESS_UTILITIES_PER_KW * kW ,0) Monthly_Opex_less_Utilities_on_kW,

        nvl(w_lease_activity_f.OPEX_PER_KW * kW * 12,0) Annualized_Opex_on_kW,

        nvl(w_lease_activity_f.OPEX_PER_KW * NRSF * 12,0) Annualized_Opex_on_NRSF,


        (nvl(( nvl(contractual_total_rent, 0) + nvl(free_rent, 0) ) / nullif(term,0) * 12,0) /* Annualized_Potential_Rent */ ) 
        - ( nvl(w_lease_activity_f.OPEX_PER_KW * kW * 12,0) /* Annualized_Opex_on_kW */ )
        - (nvl(nullif((nvl(Free_Rent, 0) / nullif(ABS(Term), 0)), 0) * 12,0) /* Annualized_Free_Rent */ ) Annualized_Net_Rent_on_kW ,

        ((nvl(( nvl(contractual_total_rent, 0) + nvl(free_rent, 0) ) / nullif(term,0) * 12,0) /* Annualized_Potential_Rent */ ) 
        - ( nvl(w_lease_activity_f.OPEX_PER_KW * kW * 12,0) /* Annualized_Opex_on_kW */ )
        - (nvl(nullif((nvl(Free_Rent, 0) / nullif(ABS(Term), 0)), 0) * 12,0) /* Annualized_Free_Rent */ ))/12 Monthly_Net_Rent_on_kW ,

        (nvl(( nvl(contractual_total_rent, 0) + nvl(free_rent, 0) ) / nullif(term,0) * 12,0) /* Annualized_Potential_Rent */ ) 
        - ( nvl(w_lease_activity_f.OPEX_LESS_UTILITIES_PER_KW * kW * 12,0) /* Annualized_Opex_on_kW */ )
        - (nvl(nullif((nvl(Free_Rent, 0) / nullif(ABS(Term), 0)), 0) * 12,0) /* Annualized_Free_Rent */ ) Annualized_Net_Rent_less_Utilities_on_kW ,

        ((nvl(( nvl(contractual_total_rent, 0) + nvl(free_rent, 0) ) / nullif(term,0) * 12,0) /* Annualized_Potential_Rent */ ) 
        - ( nvl(w_lease_activity_f.OPEX_LESS_UTILITIES_PER_KW * kW * 12,0) /* Annualized_Opex_on_kW */ )
        - (nvl(nullif((nvl(Free_Rent, 0) / nullif(ABS(Term), 0)), 0) * 12,0) /* Annualized_Free_Rent */ ))/12 Monthly_Net_Rent_less_Utilities_on_kW ,

        (nvl(( nvl(contractual_total_rent, 0) + nvl(free_rent, 0) ) / nullif(term,0) * 12,0) /* Annualized_Potential_Rent */ ) 
        - ( nvl(w_lease_activity_f.OPEX_PER_KW * NRSF * 12,0) /* Annualized_Opex_on_NRSF */ )
        - (nvl(nullif((nvl(Free_Rent, 0) / nullif(ABS(Term), 0)), 0) * 12,0) /* Annualized_Free_Rent */ ) Annualized_Net_Rent_on_sq_ft,


        nvl(((nvl(( nvl(contractual_total_rent, 0) + nvl(free_rent, 0) ) / nullif(term,0) * 12,0) /* Annualized_Potential_Rent */ ) 
        - ( nvl(w_lease_activity_f.OPEX_PER_KW * kW * 12,0) /* Annualized_Opex_on_kW */ )
        - (nvl(nullif((nvl(Free_Rent, 0) / nullif(ABS(Term), 0)), 0) * 12,0) /* Annualized_Free_Rent */ )) / nullif(kw,0),0) Annualized_Net_Rent_pkW ,

        nvl(((nvl(( nvl(contractual_total_rent, 0) + nvl(free_rent, 0) ) / nullif(term,0) * 12,0) /* Annualized_Potential_Rent */ ) 
        - ( nvl(w_lease_activity_f.OPEX_PER_KW * NRSF * 12,0) /* Annualized_Opex_on_NRSF */ )
        - (nvl(nullif((nvl(Free_Rent, 0) / nullif(ABS(Term), 0)), 0) * 12,0) /* Annualized_Free_Rent */ ) ) / nullif(nrsf,0) ,0) Annualized_Net_Rent_psf,

        --Annualized_Net_Effective_Rent_on_kW
        (
        (nvl(( nvl(contractual_total_rent, 0) + nvl(free_rent, 0) ) / nullif(term,0) * 12,0) /* Annualized_Potential_Rent */ ) 
        - ( nvl(w_lease_activity_f.OPEX_PER_KW * kW * 12,0) /* Annualized_Opex_on_kW */ )
        - (nvl(nullif((nvl(Free_Rent, 0) / nullif(ABS(Term), 0)), 0) * 12,0) /* Annualized_Free_Rent */ )
        /* Annualized_Net_Rent_on_kW */
        ) 
        - 
        (
        nvl((tenant_improvements / nullif(term,0)) * 12,0)
         /* Annualized_Tenant_Improvements */
        ) 
        - 
        (
        nvl((( /* nvl(tenant_broker_commission, 0) + nvl(landlord_broker_commission, 0) + nvl(referring_agent_commission, 0) + */
        nvl(total_internal_commissions, 0) + nvl(total_external_commissions, 0) ) / nullif(term,0)) * 12,0)
        /* Annualized_Total_Commission */
        )
        Annualized_Net_Effective_Rent_on_kW,

        -- Monthly_Net_Effective_Rent_on_kW
        (
        (
        (nvl(( nvl(contractual_total_rent, 0) + nvl(free_rent, 0) ) / nullif(term,0) * 12,0) /* Annualized_Potential_Rent */ ) 
        - ( nvl(w_lease_activity_f.OPEX_PER_KW * kW * 12,0) /* Annualized_Opex_on_kW */ )
        - (nvl(nullif((nvl(Free_Rent, 0) / nullif(ABS(Term), 0)), 0) * 12,0) /* Annualized_Free_Rent */ )
        /* Annualized_Net_Rent_on_kW */
        ) 
        - 
        (
        nvl((tenant_improvements / nullif(term,0)) * 12,0)
         /* Annualized_Tenant_Improvements */
        ) 
        - 
        (
         nvl((( /* nvl(tenant_broker_commission, 0) + nvl(landlord_broker_commission, 0) + nvl(referring_agent_commission, 0) + */ 
        nvl(total_internal_commissions, 0) + nvl(total_external_commissions, 0) ) / nullif(term,0)) * 12,0)
        /* Annualized_Total_Commission */
        )
        ) / 12 Monthly_Net_Effective_Rent_on_kW,



        -- Net_Effective_Rent_on_Sq_Ft
        (
        (nvl(( nvl(contractual_total_rent, 0) + nvl(free_rent, 0) ) / nullif(term,0) * 12,0) /* Annualized_Potential_Rent */ ) 
        - ( nvl(w_lease_activity_f.OPEX_PER_KW * NRSF * 12,0) /* Annualized_Opex_on_NRSF */ )
        - (nvl(nullif((nvl(Free_Rent, 0) / nullif(ABS(Term), 0)), 0) * 12,0) /* Annualized_Free_Rent */ )
        /* Annualized_Net_Rent_on_sq_ft */
        ) 
        - 
        (
        nvl((tenant_improvements / nullif(term,0)) * 12,0)
         /* Annualized_Tenant_Improvements */
        ) 
        - 
        (
        nvl((( /* nvl(tenant_broker_commission, 0) + nvl(landlord_broker_commission, 0) + nvl(referring_agent_commission, 0) + */ 
        nvl(total_internal_commissions, 0) + nvl(total_external_commissions, 0) ) / nullif(term,0)) * 12,0)
        /* Annualized_Total_Commission */
        )
        Annualized_Net_Effective_Rent_on_Sq_Ft,

        nvl(
        ((
                (
                    (nvl(( nvl(contractual_total_rent, 0) + nvl(free_rent, 0) ) / nullif(term,0) * 12,0) /* Annualized_Potential_Rent */ ) 
                    - ( nvl(w_lease_activity_f.OPEX_PER_KW * kW * 12,0) /* Annualized_Opex_on_kW */ )
                    - (nvl(nullif((nvl(Free_Rent, 0) / nullif(ABS(Term), 0)), 0) * 12,0) /* Annualized_Free_Rent */ )
                    /* Annualized_Net_Rent_on_kW */
                ) 
                - 
                (
                    nvl((tenant_improvements / nullif(term,0)) * 12,0)
                     /* Annualized_Tenant_Improvements */
                ) 
                - 
                (
                    nvl((( /* nvl(tenant_broker_commission, 0) + nvl(landlord_broker_commission, 0) + nvl(referring_agent_commission, 0) + */
                    nvl(total_internal_commissions, 0) + nvl(total_external_commissions, 0) ) / nullif(term,0)) * 12,0)
                    /* Annualized_Total_Commission */
                ) 
        ) /* Net_Effective_Rent_on_kW */ 
        / nullif(kw,0)),0)  Net_Effective_Rent_pkW,

        nvl(((
            (
                (nvl(( nvl(contractual_total_rent, 0) + nvl(free_rent, 0) ) / nullif(term,0) * 12,0) /* Annualized_Potential_Rent */ ) 
                - ( nvl(w_lease_activity_f.OPEX_PER_KW * NRSF * 12,0) /* Annualized_Opex_on_NRSF */ )
                - (nvl(nullif((nvl(Free_Rent, 0) / nullif(ABS(Term), 0)), 0) * 12,0) /* Annualized_Free_Rent */ )
                /* Annualized_Net_Rent_on_sq_ft */
            ) 
            - 
            (
                nvl((tenant_improvements / nullif(term,0)) * 12,0)
                 /* Annualized_Tenant_Improvements */
            ) 
            - 
            (
                nvl((( /* nvl(tenant_broker_commission, 0) + nvl(landlord_broker_commission, 0) + nvl(referring_agent_commission, 0) + */
                nvl(total_internal_commissions, 0) + nvl(total_external_commissions, 0) ) / nullif(term,0)) * 12,0)
                /* Annualized_Total_Commission */
            ) /*         Net_Effective_Rent_on_Sq_Ft */
        ) / nullif (nrsf,0)),0) Net_Effective_Rent_pSF,

        nvl(CONTRACTUAL_TOTAL_RENT * 12 / nullif(TERM,0) - STABILIZED_FIRST_YEAR_CASH_RENT,0) Annualized_GAAP_Rent_vs_Stabilized_First_Year_Cash,
nvl((Stabilized_First_Year_Cash_Rent - Expiring_Last_Year) / nullif(Expiring_Last_Year,0),0) Cash_Rent_Change_Percent,
CASE 
				WHEN sign_date  > start_date 
					THEN 0
				ELSE  w_lease_activity_d.Start_Date - w_lease_activity_d.Sign_Date
				END Days_Commencing_Lag,
CASE  WHEN nvl(kw,0) < 1001 THEN '0-1000 kW' WHEN kw > 1000 THEN '1000+ kW' END kW_Group1,
CASE  WHEN nvl(kw,0) < 301 THEN '0-300 kW' 
      WHEN kw > 300 AND kw < 401 THEN '300-400 kW' 
      WHEN kw > 400 AND kw < 501 THEN '400-500 kW' 
      WHEN kw > 500 AND kw < 601 THEN '500-600 kW' 
      WHEN kw > 600 AND kw < 701 THEN '600-700 kW' 
      WHEN kw > 700 AND kw < 801 THEN '700-800 kW' 
      WHEN kw > 800 AND kw < 901 THEN '800-900 kW' 
      WHEN kw > 900 AND kw < 1001 THEN '900-1000 kW' 
      WHEN kw > 1000 AND kw < 3001 THEN '1000-3000 kW' 
      WHEN kw > 3000 THEN '3000+ kW' ELSE '0' END kW_Group2,
CASE  WHEN nvl(kw,0) < 1001 THEN '0-1000 kW' WHEN kw > 1000 THEN '1000 kW' END kW_Grouping,
CASE  WHEN nvl(kw,0) < 300 THEN '0-299 kW' 
      WHEN kw >= 300 AND kw < 400 THEN '300-399 kW' 
      WHEN kw >= 400 AND kw < 500 THEN '400-499 kW' 
      WHEN kw >= 500 AND kw < 600 THEN '500-599 kW' 
      WHEN kw >= 600 AND kw < 700 THEN '600-699 kW' 
      WHEN kw >= 700 AND kw < 800 THEN '700-799 kW' 
      WHEN kw >= 800 AND kw < 900 THEN '800-899 kW' 
      WHEN kw >= 900 AND kw < 1000 THEN '900-999 kW' 
      WHEN kw >= 1000 AND kw < 3000 THEN '1000-2999 kW' 
      WHEN kw >= 3000 THEN '3000+ kW' END 	KW_Tranche,
nvl(Tenant_Improvements, 0) +  nvl(Landlord_Work, 0) Total_TI_and_LandLordWork,
opportunity_amount_usd - ( nvl(contractual_total_rent * 12 / nullif(term,0),0) ) GAAP_Rent_Opp_Variance

    FROM
        (
            SELECT
                dw.row_wid,
                dw.customer_wid,
                dw.property_wid,
                dw.opportunity_wid,
                dw.lease_activity_wid,
                nvl(adj.lease_reporting_type, dw.lease_reporting_type) lease_reporting_type,
                nvl(adj.signed_period_date_wid, dw.signed_period_date_wid) signed_period_date_wid,
                nvl(adj.reported_period_date_wid, dw.reported_period_date_wid) reported_period_date_wid,
                nvl(adj.commencement_period_date_wid, dw.commencement_period_date_wid) commencement_period_date_wid,
                nvl(adj.contractual_total_rent, dw.contractual_total_rent) contractual_total_rent,
                nvl(adj.contractual_gaap_rent, dw.contractual_gaap_rent) contractual_gaap_rent,
                nvl(adj.total_rent, dw.total_rent) total_rent,
                abs(nvl(adj.monthly_gaap_rent, dw.monthly_gaap_rent)) monthly_gaap_rent,                
                abs(nvl(adj.expiring_last_year, dw.expiring_last_year)) expiring_last_year,
                abs(nvl(adj.term, dw.term)) term,
                abs(nvl(adj.kw, dw.kw)) kw,
                abs(nvl(adj.nrsf, dw.nrsf)) nrsf,
                abs(nvl(adj.contractual_term, dw.contractual_term)) contractual_term,
                abs(nvl(adj.rsf, dw.rsf)) rsf,
                nvl(adj.incremental_gaap_annual_revenue, dw.incremental_gaap_annual_revenue) incremental_gaap_annual_revenue,
                abs(nvl(adj.cash_rent_expiring_last_year, dw.cash_rent_expiring_last_year)) cash_rent_expiring_last_year,
                nvl(adj.avg_rent_escalation, dw.avg_rent_escalation) avg_rent_escalation,
                nvl(adj.landlord_work, dw.landlord_work) landlord_work,
                nvl(adj.installation_fees, dw.installation_fees) installation_fees,
                nvl(adj.tenant_improvements, dw.tenant_improvements) tenant_improvements,
                nvl(adj.prior_gaap_rent, dw.prior_gaap_rent) prior_gaap_rent,
                nvl(adj.prior_last_year_cash_rent, dw.prior_last_year_cash_rent) prior_last_year_cash_rent,
                nvl(adj.contractual_incremental_rent, dw.contractual_incremental_rent) contractual_incremental_rent,
                abs(nvl(adj.expiring_gaap_rent, dw.expiring_gaap_rent)) expiring_gaap_rent,
                nvl(adj.second_year_revenue, dw.second_year_revenue) second_year_revenue,
                nvl(adj.first_year_revenue, dw.first_year_revenue) first_year_revenue,
                nvl(adj.tenant_broker_commission, dw.tenant_broker_commission) tenant_broker_commission,
                nvl(adj.landlord_broker_commission, dw.landlord_broker_commission) landlord_broker_commission,
                nvl(adj.referring_agent_commission, dw.referring_agent_commission) referring_agent_commission,
                nvl(adj.stabilized_first_year_cash_rent, dw.stabilized_first_year_cash_rent) stabilized_first_year_cash_rent,
                nvl(adj.actual_first_year_cash, dw.actual_first_year_cash) actual_first_year_cash,
                nvl(adj.free_rent, dw.free_rent) free_rent,
                nvl(adj.opex_equivalent, dw.opex_equivalent) opex_equivalent,
                nvl(adj.cross_connect_count, dw.cross_connect_count) cross_connect_count,
                nvl(adj.cross_connect_discount, dw.cross_connect_discount) cross_connect_discount,
                nvl(adj.net_effective_yield, dw.net_effective_yield) net_effective_yield,
                nvl(adj.average_yield, dw.average_yield) average_yield,
                nvl(adj.stabilized_yield, dw.stabilized_yield) stabilized_yield,
                nvl(adj.investment_basis, dw.investment_basis) investment_basis,
                nvl(adj.telx_case_number, dw.telx_case_number) telx_case_number,
                nvl(adj.opportunity_amount_native, dw.opportunity_amount_native) opportunity_amount_native,
                nvl(adj.opportunity_amount_usd, dw.opportunity_amount_usd) opportunity_amount_usd,
                nvl(adj.total_contractual_kw_commitment, dw.total_contractual_kw_commitment) total_contractual_kw_commitment,
                nvl(adj.total_internal_commissions, dw.total_internal_commissions) total_internal_commissions,
                nvl(adj.total_external_commissions, dw.total_external_commissions) total_external_commissions,
                nvl(adj.total_lease_cost, dw.total_lease_cost) total_lease_cost,
                nvl(adj.load_factor, dw.load_factor) load_factor,
                nvl(adj.lock_flag, dw.lock_flag) lock_flag,
                nvl(adj.lock_timestamp, dw.lock_timestamp) lock_timestamp,
                dw.created_on_dt,
                dw.changed_on_dt,
                dw.etl_update_dt,
                dw.etl_insert_dt,
                dw.etl_proc_wid,
                dw.datasource,
                nvl(adj.id, dw.id) id,
                dw.snapshot_period,
                dw.legacy_src_key,
                dw.product_wid,
                adj.updated_by,
                adj.adjustment_comment,
                dw.PRODUCT_HIERARCHY_WID PRODUCT_HIERARCHY_WID,
                dw.OPEX_PER_KW ,
                dw.OPEX_LESS_UTILITIES_PER_KW,
				dw.SALES_DIRECTOR_COMMISSION,
				dw.VP_SALES_COMMISSION,
				dw.SVP_SALES_COMMISSION,
				dw.PARTNER_BROKER_COMMISION,
				dw.COLO_MANAGER_COMMISSION
            FROM
                w_lease_activity_f       dw
                LEFT JOIN w_lease_activity_adj_f   adj ON dw.row_wid = adj.row_wid
        ) w_lease_activity_f
        left join vw_lease_activity_d w_lease_activity_d on w_lease_activity_f.lease_activity_wid = w_lease_activity_d.row_wid
         )
;
  GRANT READ ON "DW"."VW_LEASE_ACTIVITY_F" TO "ODS";
  GRANT READ ON "DW"."VW_LEASE_ACTIVITY_F" TO "DW_RO";
