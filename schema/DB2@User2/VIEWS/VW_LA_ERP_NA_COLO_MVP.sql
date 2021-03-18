--------------------------------------------------------
--  DDL for View VW_LA_ERP_NA_COLO_MVP
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_LA_ERP_NA_COLO_MVP" ("DATE_ID", "ID", "UNIT_TYPE__C", "PRODUCT_TYPE", "TELX_CASE_NUMBER", "BUSINESS_UNIT__C", "TRANSACTION_TYPE__C", "ACCOUNT_ID", "CO_NAME_ON_LEASE__C", "CUSTOMER_TYPE__C", "PROPERTY__C", "SUITES__C", "SIGN_DATE__C", "LEASE_COMMENCEMENT_DATE__C", "CONTRACTUAL_LEASE_COMMENCEMENT_DATE__C", "RENT_COMMENCEMENT__C", "CONTRACTUAL_RENT_COMMENCEMENT__C", "COMMENCEMENT_DATE_STATUS", "EXPIRATION_DATE__C", "TERM__C", "CONTRACTUAL_TERM__C", "NRSF__C", "RAISED_SF__C", "TOTAL_RENT__C", "CONTRACTUAL_TOTAL_RENT__C", "STABILIZED_FIRST_YEAR_S_CASH_RENT__C", "ACTUAL_FIRST_YEAR_S_CASH__C", "EXPIRING_LAST_YEAR_S_CASH_RENT__C", "EXPIRING_ANNUALIZED_GAAP_RENT__C", "KW_PER_LEASE__C", "RETENTION_INCLUDE_EXCLUDE_C", "CASH_RENT_STABILIZES__C", "LEASE_TYPE__C", "IST_GENERATION_VS_2ND_GENERATION__C", "OPEX_EQUIVALENT__C", "SALES_DIRECTOR_COMMISSION__C", "TENANT_BROKER_COMMISSION__C", "LANDLORD_BROKER_COMMISSION_C", "SOURCETYPE", "SUBSCRIPTION_NUMBER", "ORDER_LINE_NUMBER", "CURRENCY_OF_LEASE__C", "CONVERSION_RATE__C", "FREE_RENT", "SFDC_OPPORTUNITY", "CAM", "UNIT", "CREATEDATE") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  (select TO_CHAR(la.SIGN_DATE__C,'YYYYMMDD') as DATE_ID, la."ID",la."UNIT_TYPE__C",la."PRODUCT_TYPE",la."TELX_CASE_NUMBER",la."BUSINESS_UNIT__C",la."TRANSACTION_TYPE__C",
  la."ACCOUNT_ID",la."CO_NAME_ON_LEASE__C",la."CUSTOMER_TYPE__C",
la."PROPERTY__C",la."SUITES__C",
CASE WHEN TO_CHAR(la.SIGN_DATE__C,'MM/DD/YYYY')= '01/01/1900' THEN NULL ELSE to_char(la.SIGN_DATE__C,'MM/DD/YYYY') END as "SIGN_DATE__C",
CASE WHEN TO_CHAR(la.LEASE_COMMENCEMENT_DATE_C,'MM/DD/YYYY')= '01/01/1900' THEN NULL ELSE TO_CHAR(la.LEASE_COMMENCEMENT_DATE_C,'MM/DD/YYYY') END as "LEASE_COMMENCEMENT_DATE__C",
CASE WHEN TO_CHAR(la.CONTRACTUAL_LEASE_COMMENCEMENT_DATE__C,'MM/DD/YYYY')= '01/01/1900' THEN NULL ELSE TO_CHAR(la.CONTRACTUAL_LEASE_COMMENCEMENT_DATE__C,'MM/DD/YYYY') END as "CONTRACTUAL_LEASE_COMMENCEMENT_DATE__C",
CASE WHEN TO_CHAR(la.RENT_COMMENCEMENT__C,'MM/DD/YYYY') = '01/01/1900' THEN NULL ELSE TO_CHAR(la.RENT_COMMENCEMENT__C,'MM/DD/YYYY') END as "RENT_COMMENCEMENT__C",
CASE WHEN TO_CHAR(la.CONTRACTUAL_RENT_COMMENCEMENT__C,'MM/DD/YYYY') = '01/01/1900' THEN NULL ELSE TO_CHAR(la.CONTRACTUAL_RENT_COMMENCEMENT__C,'MM/DD/YYYY') END as  "CONTRACTUAL_RENT_COMMENCEMENT__C",
la.COMMENCEMENT_DATE_STATUS,
CASE WHEN TO_CHAR(la.EXPIRATION_DATE__C,'MM/DD/YYYY') = '01/01/1900' THEN NULL ELSE TO_CHAR(la.EXPIRATION_DATE__C,'MM/DD/YYYY') END as "EXPIRATION_DATE__C",
la."TERM__C",la."CONTRACTUAL_TERM__C",la."NRSF__C",
la."RAISED_SF__C",la."TOTAL_RENT__C",la."CONTRACTUAL_TOTAL_RENT__C",la."STABILIZED_FIRST_YEAR_S_CASH_RENT__C",
la."ACTUAL_FIRST_YEAR_S_CASH_RENT__C" as ACTUAL_FIRST_YEAR_S_CASH__C,la."EXPIRING_LAST_YEAR_S_CASH_RENT__C",la."EXPIRING_ANNUALIZED_GAAP_RENT__C",
la."KW_PER_LEASE__C",la."RETENTION_INCLUDE_EXCLUDE_C",la."CASH_RENT_STABILIZES__C",la."LEASE_TYPE__C",
la."FIRST_GENERATION_VS_2ND_GENERATION__C" as IST_GENERATION_VS_2ND_GENERATION__C,la."OPEX_EQUIVALENT__C",la."SALES_DIRECTOR_COMMISSION__C",
la."TENANT_BROKER_COMMISSION__C",la."LANDLORD_BROKER_COMMISSION" as LANDLORD_BROKER_COMMISSION_C
,la."SOURCETYPE",la."SUBSCRIPTION_NUMBER",la."ORDER_LINE_NUMBER",
la."LEASE_CURRENCY_CODE" as CURRENCY_OF_LEASE__C,la."LEASE_EXCHANGE_RATE" as CONVERSION_RATE__C ,
FREE_RENT,
SFDC_OPPORTUNITY,
CAM,
UNIT,CREATEDATE
 from ods.W_LA_ERP_EXTRACT_STG la)
;
  GRANT SELECT ON "DW"."VW_LA_ERP_NA_COLO_MVP" TO "DW_RO";
  GRANT READ ON "DW"."VW_LA_ERP_NA_COLO_MVP" TO "DW_RO";
