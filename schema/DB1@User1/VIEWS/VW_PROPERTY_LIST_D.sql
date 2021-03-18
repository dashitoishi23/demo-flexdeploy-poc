--------------------------------------------------------
--  DDL for View VW_PROPERTY_LIST_D
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_PROPERTY_LIST_D" ("ROW_WID", "PROPERTY_LIST_SRC_KEY", "PROPERTY_LIST_CODE", "PROPERTY_LIST_NAME", "PROPERTY_CODE", "CREATED_ON_DT", "CHANGED_ON_DT", "ETL_UPDATE_DT", "ETL_INSERT_DT", "ETL_PROC_WID", "DATASOURCE", "PROPERTY_SRC_KEY") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
    row_wid,
    property_list_src_key,
    property_list_code,
    property_list_name,
    property_code,
    created_on_dt,
    changed_on_dt,
    etl_update_dt,
    etl_insert_dt,
    etl_proc_wid,
    datasource,
    property_src_key
FROM
    w_property_list_d
;
  GRANT READ ON "DW"."VW_PROPERTY_LIST_D" TO "ODS";
  GRANT READ ON "DW"."VW_PROPERTY_LIST_D" TO "DW_RO";
