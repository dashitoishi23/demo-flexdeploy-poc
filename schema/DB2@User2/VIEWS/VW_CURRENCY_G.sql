--------------------------------------------------------
--  DDL for View VW_CURRENCY_G
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_CURRENCY_G" ("CURRENCY_WID", "ISO_CODE", "CURRENCY_NAME", "CURRENCY_SRC_KEY", "CURRENCY_SYMBOL", "EXCHANGE_RATE_TYPE", "RATE_TO_USD", "RATE_FROM_USD", "DATE_WID", "CREATED_ON_DT", "CHANGED_ON_DT", "ETL_UPDATE_DT", "ETL_INSERT_DT", "ETL_PROC_WID", "DATASOURCE", "MTD_AVG_RATE_TO_USD", "QTD_AVG_RATE_TO_USD") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
        w_currency_g.currency_wid,
        w_currency_g.iso_code,
        w_currency_g.currency_name,
        w_currency_g.currency_src_key,
        w_currency_g.currency_symbol,
        w_currency_g.exchange_rate_type,
        w_currency_g.rate_to_usd,
        w_currency_g.rate_from_usd,
        w_currency_g.date_wid,
        w_currency_g.created_on_dt,
        w_currency_g.changed_on_dt,
        w_currency_g.etl_update_dt,
        w_currency_g.etl_insert_dt,
        w_currency_g.etl_proc_wid,
        w_currency_g.datasource,
        AVG(w_currency_g.rate_to_usd) OVER(PARTITION BY w_currency_g.iso_code, w_date_d.month ORDER BY date_wid ASC) mtd_avg_rate_to_usd,
        AVG(w_currency_g.rate_to_usd) OVER(PARTITION BY w_currency_g.iso_code, w_date_d.quarter ORDER BY date_wid ASC) qtd_avg_rate_to_usd
    FROM
        dw.w_currency_g,
        dw.w_date_d
    WHERE
        w_currency_g.date_wid = w_date_d.row_wid
;
  GRANT READ ON "DW"."VW_CURRENCY_G" TO "ODS";
  GRANT READ ON "DW"."VW_CURRENCY_G" TO "DW_RO";
  GRANT SELECT ON "DW"."VW_CURRENCY_G" TO "ODS";
