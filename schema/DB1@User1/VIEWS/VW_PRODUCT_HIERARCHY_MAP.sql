--------------------------------------------------------
--  DDL for View VW_PRODUCT_HIERARCHY_MAP
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_PRODUCT_HIERARCHY_MAP" ("DATASOURCE", "PRODUCT_SRC_KEY", "PRODUCT_SRC_CODE", "PRODUCT_SRC_DESC", "PRODUCT_TYPE_GROUP", "L4_PRODUCT_TYPE", "PRODUCT_HIER_WID", "CREATED_ON_DT", "CHANGED_ON_DT", "CREATED_BY", "CHANGED_BY", "ETL_UPDATE_DT", "ETL_INSERT_DT", "PRODUCT_HIER2_WID", "PRODUCT_HIER3_WID", "ROW_WID", "CURRENT_FLG", "EFF_FROM_DT", "EFF_TO_DT") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
        "DATASOURCE",
        "PRODUCT_SRC_KEY",
        "PRODUCT_SRC_CODE",
        "PRODUCT_SRC_DESC",
        "PRODUCT_TYPE_GROUP",
        "L4_PRODUCT_TYPE",
        "PRODUCT_HIER_WID",
        "CREATED_ON_DT",
        "CHANGED_ON_DT",
        "CREATED_BY",
        "CHANGED_BY",
        "ETL_UPDATE_DT",
        "ETL_INSERT_DT",
        "PRODUCT_HIER2_WID",
        "PRODUCT_HIER3_WID",
        "ROW_WID",
        "CURRENT_FLG",
        "EFF_FROM_DT",
        "EFF_TO_DT"
    FROM
        w_product_hierarchy_map
;
