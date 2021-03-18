--------------------------------------------------------
--  DDL for View VW_MTM_BACKLOG_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_MTM_BACKLOG_F" ("CUSTOMER_WID", "PROPERTY_WID", "SUBSCRIPTION_NUMBER", "CONTRACT_NUMBER", "CONTRACT_START_DATE", "CONTRACT_END_DATE", "BILL_TO_ACCOUNT_NUMBER", "CONTRACT_TYPE_NAME", "CHARGE_STATUS", "CHARGE_TYPE", "OPPORTUNITY_STATUS", "OPPORTUNITY_OWNER", "OPPORTUNITY_TYPE", "AUTO_RENEW_DURATION", "AUTO_RENEW", "NUM_OF_AUTO_RENEWALS", "PRICE_INCR_PCT_LIMIT", "RENEWAL_OPPORTUNITY", "LINES_AMOUNT") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  (
select distinct
nvl(c.row_wid,-1) customer_wid,nvl( p.row_wid,-1) property_wid,
vw_subscription_d.SUBSCRIPTION_NUMBER,CONTRACT_HEADER_BASE_PEO_CONTRACT_NUMBER AS CONTRACT_NUMBER,
vw_clm_d.CONTRACT_HEADER_BASE_PEO_START_DATE AS CONTRACT_START_DATE, vw_clm_d.CONTRACT_HEADER_BASE_PEO_END_DATE CONTRACT_END_DATE,ACCOUNT_NUMBER AS BILL_TO_ACCOUNT_NUMBER,
vw_clm_d.CONTRACT_TYPE_PEO_NAME AS CONTRACT_TYPE_NAME,CONTRACT_HEADER_BASE_PEO_ST_SCODE as CHARGE_STATUS,BILLLINESPEOCHARGENAME CHARGE_TYPE,OPPORTUNITY_STATUS,OPPORTUNITY_OWNER,OPPORTUNITY_TYPE,
(case  when vw_clm_d.CONTRACT_TYPE_PEO_NAME = 'GTC' then vw_clm_d.AUTO_RENEW_DURATION_GTC when vw_clm_d.CONTRACT_TYPE_PEO_NAME = 'NA - MSA'
  then vw_clm_d.AUTO_RENEW_DURATION_MSA when vw_clm_d.CONTRACT_TYPE_PEO_NAME = 'NA - Other' then vw_clm_d.AUTO_RENEW_DURATION_OTHER end)  as AUTO_RENEW_DURATION,
  (case  when vw_clm_d.CONTRACT_TYPE_PEO_NAME = 'GTC' then vw_clm_d.AUTO_RENEW_GTC when vw_clm_d.CONTRACT_TYPE_PEO_NAME = 'NA - MSA' then vw_clm_d.AUTO_RENEW_MSA
   when vw_clm_d.CONTRACT_TYPE_PEO_NAME = 'NA - Other' then vw_clm_d.AUTO_RENEW_OTHER end)  as AUTO_RENEW,
    (case  when vw_clm_d.CONTRACT_TYPE_PEO_NAME = 'GTC' then vw_clm_d.NUM_OF_AUTO_RENEWALS_GTC when vw_clm_d.CONTRACT_TYPE_PEO_NAME = 'NA - MSA'
    then vw_clm_d.NUM_OF_AUTO_RENEWALS_MSA when vw_clm_d.CONTRACT_TYPE_PEO_NAME = 'NA - Other' then vw_clm_d.NUM_OF_AUTO_RENEWALS_OTHER end) as NUM_OF_AUTO_RENEWALS,
    ( case  when vw_clm_d.CONTRACT_TYPE_PEO_NAME = 'GTC' then vw_clm_d.PRICE_INCR_PCT_LIMIT_GTC when vw_clm_d.CONTRACT_TYPE_PEO_NAME = 'NA - MSA'
     then vw_clm_d.PRICE_INCR_PCT_LIMIT_MSA when vw_clm_d.CONTRACT_TYPE_PEO_NAME = 'NA - Other' then vw_clm_d.PRICE_INCR_PCT_LIMIT_OTHER end)  as PRICE_INCR_PCT_LIMIT,
    (CASE WHEN CONTRACT_HEADER_BASE_PEO_CONTRACT_NUMBER IS NOT NULL AND OPPORTUNITY_SRC_KEY IS NOT NULL THEN 'Y' ELSE 'N' END) RENEWAL_OPPORTUNITY,
     AMOUNT LINES_AMOUNT
from dw.vw_clm_d vw_clm_d
left join dw.vw_subscription_d vw_subscription_d
    on CONTRACT_HEADER_BASE_PEO_CONTRACT_NUMBER = msa_contract_number
left join  dw.vw_cpq_f vw_cpq_f
    on SUBSCRIPTION_NUMBER = TRANSACTION_SUBSCRIPTION_NUMBER
left join ods.fusion_oss_bill_lines fusion_oss_bill_lines on vw_subscription_d.SUBSCRIPTION_ID = fusion_oss_bill_lines.SUBSCRIPTION_ID
left join dw.vw_opportunity_d
    on vw_opportunity_d.row_wid = OPPORTUNITY_WID
LEFT JOIN dw.w_customer_d                        c ON to_char(vw_subscription_d.primary_party_id) = c.l4_legal_entity_src_key
        and c.current_flag = 'Y'
LEFT JOIN dw.w_property_d                        p ON vw_subscription_d.location = p.master_site_code
                                    AND p.live_flag = 1
                                    AND p.leaf_level = 'Location'
where vw_clm_d.CONTRACT_HEADER_BASE_PEO_END_DATE <= add_months(sysdate ,6)
and nvl(opportunity_status,'NA') <> 'Closed Won'
and CONTRACT_HEADER_BASE_PEO_ST_SCODE = 'ACTIVE'
and nvl(LINES_DEPLOYMENT_ID,'NA') not in (
 select  LINES_DEPLOYMENT_ID from  dw.vw_cpq_f vw_cpq_f
 left join dw.vw_opportunity_d
    on vw_opportunity_d.OPPORTUNITY_SRC_KEY = TRANSACTION_OPPORTUNITY_ID
    where LINES_CONTRACT_END_DATE  <= add_months(sysdate ,6)
    and   TRANSACTION_TYPE = 'Renewal' and OPPORTUNITY_STATUS = 'Closed Won'
))
;
