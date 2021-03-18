--------------------------------------------------------
--  DDL for View VW_ACCOUNT_RECEIVABLE_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_ACCOUNT_RECEIVABLE_F" ("CUSTOMER_WID", "PROPERTY_WID", "SUBSCRIPTION_WID", "INVOICE_NUMBER", "LINE_ID", "LOCATION", "ADDRESS", "CASE_NUMBER", "ACCOUNT_NUMBER", "ACCOUNT_NAME", "ACCOUNT_CLASS", "TRANSACTION_CLASS", "REASON_CODE", "BILL_TO_SITE_NO", "RULE_START_DATE", "INVOICE_DISTR_ACCOUNT", "GL_CODE_DESC", "POST_DATE", "POST_MONTH", "GL_ID", "ITEM_CODE", "ITEM_DESC", "QUANTITY", "UNIT_SELLING_PRICE", "REVENUE_TYPE", "NET_RECEVIABLE", "INVOIVCED_AMOUNT", "INVOICED_TAX") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  (
SELECT DISTINCT
nvl(CD.ROW_WID,-1) as CUSTOMER_WID,
nvl(PD.ROW_WID,-1) as PROPERTY_WID,
OS.subscription_id as SUBSCRIPTION_WID,
HDR.TRX_NUMBER INVOICE_NUMBER,
LN.RA_CUSTOMER_TRX_LINE_LINE_NUMBER LINE_ID,
HDR.RA_CUSTOMER_TRX_ATTRIBUTE1 LOCATION,
PD.ADDRESS1 ADDRESS,
LN.RA_CUSTOMER_TRX_LINE_INTERFACE_LINE_ATTRIBUTE1 CASE_NUMBER,
CUST.ACCOUNTNUMBER ACCOUNT_NUMBER,
CUST.ACCOUNTNAME ACCOUNT_NAME,
PSCH.TRANSACTION_DISTRIBUTION_ACCOUNT_CLASS ACCOUNT_CLASS,
CASE WHEN TYP.TRANSACTION_TYPE = 'INV' THEN 'Invoice' WHEN TYP.TRANSACTION_TYPE = 'CM' THEN 'Credit Memo'
     WHEN TYP.TRANSACTION_TYPE = 'DM' THEN 'Debit Memo' END TRANSACTION_CLASS,
CASE WHEN TRANSACTION_TYPE='CM' THEN 'Credit Memo' 
    WHEN QUOTE_TYPE LIKE '%New Customer Logo%' AND  TO_CHAR(to_timestamp_tz(os.start_date , 'YYYY-MM-DD"T"HH24:MI:SS.ff3 TZH:TZM'),'MM') = TO_CHAR(LN.RA_CUSTOMER_TRX_LINE_RULE_START_DATE,'MM') THEN 'New customer logo'
    WHEN QUOTE_TYPE  = 'Existing Customer New Location' AND  TO_CHAR(to_timestamp_tz(os.start_date , 'YYYY-MM-DD"T"HH24:MI:SS.ff3 TZH:TZM'),'MM') = TO_CHAR(LN.RA_CUSTOMER_TRX_LINE_RULE_START_DATE,'MM') THEN 'Existing Customer New Install Diff Loc.'
    WHEN QUOTE_TYPE  in ('Existing Customer Add-on service','Existing Customer: Existing Location','Existing Customer - Service Change / Add-on','Existing Customer: Service Change Upgrade/Downgrade')
        AND  TO_CHAR(to_timestamp_tz(os.start_date , 'YYYY-MM-DD"T"HH24:MI:SS.ff3 TZH:TZM'),'MM') = TO_CHAR(LN.RA_CUSTOMER_TRX_LINE_RULE_START_DATE,'MM') THEN 'Addl Services for existing Cust'
    WHEN QUOTE_TYPE  = 'Renewal' AND  TO_CHAR(to_timestamp_tz(os.start_date DEFAULT NULL ON CONVERSION ERROR, 'YYYY-MM-DD"T"HH24:MI:SS.ff3 TZH:TZM'),'MM') = TO_CHAR(LN.RA_CUSTOMER_TRX_LINE_RULE_START_DATE,'MM') THEN 'Renewal'
    WHEN QUOTE_TYPE  in ('Termination (Partial)','Termination Full','Termination Partial','Expiration','Reduction') AND  TO_CHAR(to_timestamp_tz(start_date DEFAULT NULL ON CONVERSION ERROR, 'YYYY-MM-DD"T"HH24:MI:SS.ff3 TZH:TZM'),'MM') = TO_CHAR(LN.RA_CUSTOMER_TRX_LINE_RULE_START_DATE,'MM') THEN 'Reduced Services'
    END REASON_CODE,
CSA.location BILL_TO_SITE_NO,
LN.RA_CUSTOMER_TRX_LINE_RULE_START_DATE RULE_START_DATE,
GLCC.CODECOMBINATIONSEGMENT5 INVOICE_DISTR_ACCOUNT,
CODECOMBINATIONSEGMENT1 ||'-'|| CODECOMBINATIONSEGMENT2 GL_CODE_DESC,
HDR.TRX_DATE POST_DATE,
TO_CHAR(HDR.TRX_DATE,'yyyy-mm') POST_MONTH,
PSCH.TRANSACTION_DISTRIBUTION_CUST_TRX_LINE_GL_DIST_ID GL_ID,
EGP.INVENTORY_ITEM_BASE_ITEM_NUMBER ITEM_CODE,
LN.RA_CUSTOMER_TRX_LINE_ATTRIBUTE5 ||' '||RA_CUSTOMER_TRX_LINE_ATTRIBUTE7 || 
    (CASE WHEN RA_CUSTOMER_TRX_LINE_ATTRIBUTE2 IS NULL THEN NULL ELSE ', CASE#'||RA_CUSTOMER_TRX_LINE_ATTRIBUTE2 END)||
    (CASE WHEN RA_CUSTOMER_TRX_LINE_ATTRIBUTE6 IS NULL THEN NULL ELSE ', PO#'||RA_CUSTOMER_TRX_LINE_ATTRIBUTE6 END)||
    (CASE WHEN OS.SOURCE_KEY IS NULL THEN NULL WHEN OS.SOURCE_KEY='NA' THEN NULL ELSE ', SO#'||OS.SOURCE_KEY END) ITEM_DESC,/* Updated on 02Sep2020 */
--RA_CUSTOMER_TRX_LINE_DESCRIPTION ITEM_DESC,
--RA_CUSTOMER_TRX_LINE_INTERFACE_LINE_ATTRIBUTE1 item_desc2,
LN.RA_CUSTOMER_TRX_LINE_QUANTITY_INVOICED QUANTITY,
LN.RA_CUSTOMER_TRX_LINE_RA_CUSTOMER_TRX_LINE_UNIT_SELLING_PRICE UNIT_SELLING_PRICE,
LN.RA_CUSTOMER_TRX_LINE_ATTRIBUTE5 REVENUE_TYPE,
(case when PSCH.PAYMENT_SCHEDULE_AMOUNT_APPLIED is not null
then ROUND(((LN.RA_CUSTOMER_TRX_LINE_LINE_RECOVERABLE+NVL(LN.RA_CUSTOMER_TRX_LINE_TAX_RECOVERABLE,0))-(((LN.RA_CUSTOMER_TRX_LINE_LINE_RECOVERABLE+NVL(LN.RA_CUSTOMER_TRX_LINE_TAX_RECOVERABLE,0))/PSCH.PAYMENT_SCHEDULE_AMOUNT_DUE_ORIGINAL)* NVL(PSCH.PAYMENT_SCHEDULE_AMOUNT_APPLIED,1))),2)
else (LN.RA_CUSTOMER_TRX_LINE_LINE_RECOVERABLE+NVL(LN.RA_CUSTOMER_TRX_LINE_TAX_RECOVERABLE,0))
end) NET_RECEVIABLE,
--LN.RA_CUSTOMER_TRX_LINE_LINE_RECOVERABLE+NVL(LN.RA_CUSTOMER_TRX_LINE_TAX_RECOVERABLE,0)AS TOTAL_AR,
LN.RA_CUSTOMER_TRX_LINE_LINE_RECOVERABLE INVOIVCED_AMOUNT,
LN.RA_CUSTOMER_TRX_LINE_TAX_RECOVERABLE INVOICED_TAX
from ODS.FUSION_AR_CUST_TRX_ALL HDR
inner join ODS.FUSION_AR_CUST_TRX_LINES_ALL LN on  LN.RA_CUSTOMER_TRX_LINE_CUSTOMER_TRX_ID = HDR.CUSTOMER_TRX_ID
left join (select distinct INVENTORY_ITEM_BASE_ITEM_NUMBER,INVENTORY_ITEM_ID from ODS.FUSION_EGP_SYSTEM_ITEMS) EGP
			on 	EGP.INVENTORY_ITEM_ID=LN.RA_CUSTOMER_TRX_LINE_INVENTORY_ITEM_ID
left join ODS.FUSION_RA_CUST_TRX_TYPES_ALL TYP on TYP.CUST_TRX_TYPE_SEQ_ID = HDR.RA_CUSTOMER_TRX_CUST_TRX_TYPE_SEQ_ID
left join ODS.FUSION_OSS_BILL_LINES OB on LN.CUSTOMER_TRX_LINE_ID=OB.BILLLINESPEOTRXLINEID
left join  ODS.FUSION_AR_PAYMENT_SCHEDULES_AL PSCH on LN.RA_CUSTOMER_TRX_LINE_CUSTOMER_TRX_ID = PSCH.TRANSACTION_HEADER_CUSTOMER_TRX_ID
left join  ODS.FUSION_HZ_CUST_ACCOUNTS CUST on HDR.RA_CUSTOMER_TRX_BILL_TO_CUSTOMER_ID = CUST.CUSTACCOUNTID
left join  ODS.FUSION_HZ_CUST_ACCOUNT_SITES_ALL CSA on CSA.SITE_USE_ID=HDR.RA_CUSTOMER_TRX_BILL_TO_SITE_USE_ID
left join ODS.FUSION_OSS_SUBSCRIPTIONS OS on LN.RA_CUSTOMER_TRX_LINE_SALES_ORDER=OS.SUBSCRIPTION_NUMBER
left join  ODS.VW_FUSION_CPQ_TRANSACTION CPQTR on CPQTR.subscription_number = LN.RA_CUSTOMER_TRX_LINE_SALES_ORDER
left join  DW.W_CUSTOMER_D CD on CD.L4_LEGAL_ENTITY_SRC_KEY = TO_CHAR(CUST.PARTYID) AND CD.CURRENT_FLAG='Y' AND DATASOURCE='FUSION'
left join ODS.FUSION_RA_CUST_TRX_GL_DIST_ALL GLDA ON GLDA.RACUSTTRXLINEGLDISTCUSTOMERTRXLINEID=LN.CUSTOMER_TRX_LINE_ID
left join ODS.FUSION_GL_CODE_COMBINATIONS GLCC ON GLCC.CODECOMBINATIONCODECOMBINATIONID=GLDA.RACUSTTRXLINEGLDISTCODECOMBINATIONID
left join  (select * from DW.W_PROPERTY_D where LEAF_LEVEL='Location' and LIVE_FLAG=1) PD
			on PD.MASTER_SITE_CODE=HDR.RA_CUSTOMER_TRX_ATTRIBUTE1
where LN.RA_CUSTOMER_TRX_LINE_LINE_TYPE='LINE'
		--and PSCH.TRANSACTION_DISTRIBUTION_ACCOUNT_CLASS='REC'
		and PSCH.TRANSACTION_DISTRIBUTION_LATEST_REC_FLAG='Y'
--		AND HDR.TRX_NUMBER= '73022'
--        AND GLDA.RACUSTTRXLINEGLDISTACCOUNTCLASS='REV' 
)
;
  GRANT SELECT ON "DW"."VW_ACCOUNT_RECEIVABLE_F" TO "DW_RO";
  GRANT READ ON "DW"."VW_ACCOUNT_RECEIVABLE_F" TO "DW_RO";
