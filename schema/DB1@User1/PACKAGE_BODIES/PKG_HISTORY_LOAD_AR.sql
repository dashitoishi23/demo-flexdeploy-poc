--------------------------------------------------------
--  DDL for Package Body PKG_HISTORY_LOAD_AR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DW"."PKG_HISTORY_LOAD_AR" AS


    /*
    ------------------------- 
    AR fact detail 
    -------------------------
    */

    PROCEDURE ar_fact_detail IS
    BEGIN

    EXECUTE IMMEDIATE 'truncate table W_ACCOUNT_RECEIVABLE_DETAILS_F';
    EXECUTE IMMEDIATE 'ALTER SESSION FORCE PARALLEL QUERY PARALLEL 8';

    --delete from w_account_receivable_details_f where etl_proc_wid = -1;

    commit;

    INSERT INTO w_account_receivable_details_f (
    property_wid,
    customer_wid,
    currency_wid,
    invoice_no,
    trans_number,
    charge_code,
    charge_code_desc,
    charge_code_type,
    charge_notes,
    charge_unit,
    charge_reference,
    currency_code,
    exchange_rate,
    invoice_date_wid,
    due_date_wid,
    post_month_wid,
    net_receivable,
    total_ar,
    ages_0_to_30_owed,
    ages_31_to_60_owed,
    ages_61_to_90_owed,
    ages_91_to_120_owed,
    over_120_owed,
    pre_payments,
    unapplied_receipts,
    date_occurred_wid,
    i_type,
    status,
    pull_date_wid,
    created_on_dt,
    changed_on_dt,
    etl_update_dt,
    etl_insert_dt,
    etl_proc_wid,
    datasource,
    legacy_src_key
)
    SELECT
        nvl(W_PROPERTY_D.row_wid, -1) property_wid,
        nvl(w_customer_d.row_wid,nvl(w_customer_d1.row_wid,-1))  customer_wid,
        nvl(w_currency_d.row_wid, -1) currency_wid,
        invoiceno           invoice_no,
        transnumber         trans_number,
        chargecode          charge_code,
        chargecodedesc      charge_code_desc,
        chargecodetype      charge_code_type,
        chargenotes         charge_notes,
        chargeunit          charge_unit,
        chargereference     charge_reference,
        upper(currencycode)        currency_code,
        fxrate              exchange_rate,
        to_number(to_char(invoicedate, 'YYYYMMDD'))         invoice_date_wid,
        to_number(to_char(duedate, 'YYYYMMDD'))             due_date_wid,
        to_number(to_char(postmonth, 'YYYYMMDD'))           post_month_wid,
        netreceivable       net_receivable,
        totalar             total_ar,
        ages0to30owed       ages_0_to_30_owed,
        ages31to60owed      ages_31_to_60_owed,
        ages61to90owed      ages_61_to_90_owed,
        ages91to120owed     ages_91_to_120_owed,
        over120owed         over_120_owed,
        prepayments         pre_payments,
        unappliedreceipts   unapplied_receipts,
        to_number(to_char(dateoccurred, 'YYYYMMDD'))         date_occurred_wid,
        itype               i_type,
        status              status,
        to_number(to_char(pull_date, 'YYYYMMDD')) pull_date_wid,
        pull_date           created_on_dt,
        pull_date           changed_on_dt,
        sysdate             etl_update_dt,
        sysdate             etl_insert_dt,
        - 1 etl_proc_wid,
        'YARDI' datasource,
        propertyhmy || '|' || customerhmy || '|' || personhmy || '|' || transhmy || '|' || currencycode || '|' || invoiceno || '|' || transnumber || '|'
        || to_char(pull_date, 'yyyymmdd') || '|' || trim(TENANTCODE) legacy_src_key
    FROM
        msdwprd.dbo_aragingdetail
        LEFT JOIN W_PROPERTY_D ON TRIM(PROPERTYCODE) = W_PROPERTY_D.PROPERTY_CODE AND LIVE_FLAG = 1 AND LEAF_LEVEL = 'Property'
        left join w_currency_d on lower(w_currency_d.iso_code) = lower(currencycode)
        left join w_customer_d on L4_LEGAL_ENTITY_CODE = trim(TENANTCODE) and CURRENT_FLAG = 'Y'  and w_customer_d.datasource = 'YARDI'
        left join w_customer_d w_customer_d1 on w_customer_d1.L4_LEGAL_ENTITY_CODE = trim(TENANTCODE) 
            and w_customer_d1.CURRENT_FLAG = 'Y'  and w_customer_d1.datasource = 'FUSION';



    COMMIT;

    END ar_fact_detail;

    PROCEDURE ar_fact_summary IS
    BEGIN

    EXECUTE IMMEDIATE 'truncate table w_account_receivable_summary_f';
    EXECUTE IMMEDIATE 'ALTER SESSION FORCE PARALLEL QUERY PARALLEL 8';

    --delete from w_account_receivable_summary_f where etl_proc_wid = -1;

    commit;

    INSERT INTO w_account_receivable_summary_f (
        property_wid,
        customer_wid,
        currency_wid,
        currency_code,
        exchange_rate,
        net_receivable,
        total_ar,
        ages_0_to_30_owed,
        ages_0_to_30_status,
        ages_0_to_30_comment,
        ages_31_to_60_owed,
        ages_31_to_60_status,
        ages_31_to_60_comment,
        ages_61_to_90_owed,
        ages_61_to_90_status,
        ages_61_to_90_comment,
        ages_91_to_120_owed,
        ages_91_to_120_status,
        ages_91_to_120_comment,
        over_120_owed,
        over_120_status,
        over_120_comment,
        pre_payments,
        unapplied_receipts,
        unapplied_receipts_status,
        unapplied_receipts_comment,
        general_comment,
        general_comment_date_created,
        general_comment_created_by,
        period,
        pull_date_wid,
        created_on_dt,
        changed_on_dt,
        etl_update_dt,
        etl_insert_dt,
        etl_proc_wid,
        datasource,
        legacy_src_key
    )
    SELECT
        NVL(W_PROPERTY_D.ROW_WID,-1) property_wid,
        nvl(w_customer_d.row_wid,nvl(w_customer_d1.row_wid,-1))  customer_wid,
        NVL(w_currency_d.ROW_WID,-1) currency_wid,
        upper(currencycode)                currency_code,
        fxrate                      exchange_rate,
        netreceivable               net_receivable,
        totalar                     total_ar,
        ages0to30owed               ages_0_to_30_owed,
        ages0to30status             ages_0_to_30_status,
        ages0to30comment            ages_0_to_30_comment,
        ages31to60owed              ages_31_to_60_owed,
        ages31to60status            ages_31_to_60_status,
        ages31to60comment           ages_31_to_60_comment,
        ages61to90owed              ages_61_to_90_owed,
        ages61to90status            ages_61_to_90_status,
        ages61to90comment           ages_61_to_90_comment,
        ages91to120owed             ages_91_to_120_owed,
        ages91to120status           ages_91_to_120_status,
        ages91to120comment          ages_91_to_120_comment,
        over120owed                 over_120_owed,
        over120status               over_120_status,
        over120comment              over_120_comment,
        prepayments                 pre_payments,
        unappliedreceipts           unapplied_receipts,
        unappliedreceiptsstatus     unapplied_receipts_status,
        unappliedreceiptscomment    unapplied_receipts_comment,
        generalcomment              general_comment,
        generalcommentdatecreated   general_comment_date_created,
        generalcommentcreatedby     general_comment_created_by,
        period                      period,
        to_number(to_char(pulldate, 'YYYYMMDD')) pull_date_wid,
        pulldate                    created_on_dt,
        pulldate                    changed_on_dt,
        sysdate                     etl_update_dt,
        sysdate                     etl_insert_dt,
        - 1 etl_proc_wid,
        'YARDI' datasource,
        propertycode || '|' || propertyhmy || '|' || customerhmy || '|' || tenanthmy || '|' || currencycode || '|' || to_char(pulldate, 'YYYYMMDD') || '|' || trim(TENANTCODE) legacy_src_key
    FROM
        msdwprd.dbo_aragingsummary
        LEFT JOIN W_PROPERTY_D ON TRIM(PROPERTYCODE) = W_PROPERTY_D.PROPERTY_CODE AND LIVE_FLAG = 1 AND LEAF_LEVEL = 'Property'
        left join w_currency_d on lower(w_currency_d.iso_code) = lower(currencycode)
        left join w_customer_d on L4_LEGAL_ENTITY_CODE = trim(TENANTCODE) and CURRENT_FLAG = 'Y' and w_customer_d.datasource = 'YARDI'
        left join w_customer_d w_customer_d1 on w_customer_d1.L4_LEGAL_ENTITY_CODE = trim(TENANTCODE) 
            and w_customer_d1.CURRENT_FLAG = 'Y'  and w_customer_d1.datasource = 'FUSION';

        commit;

    END ar_fact_summary;


    PROCEDURE Load_ar_subject_area IS
    BEGIN
        ar_fact_detail;
        ar_fact_summary;

    END Load_ar_subject_area;
end pkg_history_load_ar;

/

  GRANT EXECUTE ON "DW"."PKG_HISTORY_LOAD_AR" TO "SVC_ODI";
  GRANT DEBUG ON "DW"."PKG_HISTORY_LOAD_AR" TO "DW_RO";
