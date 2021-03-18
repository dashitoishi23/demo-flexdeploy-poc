--------------------------------------------------------
--  DDL for View VW_PRODUCT_HIERARCHY_D
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_PRODUCT_HIERARCHY_D" ("PRODUCT_SRC_KEY", "PRODUCT_SRC_CODE", "PRODUCT_SRC_DESC", "PRODUCT_TYPE_GROUP", "L4_PRODUCT_TYPE", "L3_PRODUCT_FAMILY", "L2_PRODUCT_SUBCATEGORY", "L1_PRODUCT_CATEGORY", "PRODUCT_HIER_WID", "ROW_WID", "INVENTORY_ITEM_ID", "ORGANIZATION_ID", "INTEGRATION_ID", "ITEM_NUMBER", "ITEM_DESCRIPTION", "ORGANIZATION_CODE", "PRODUCT_CATALOG_CATEGORY", "TAX_CATALOG_CATEGORY", "IL_TAX_CATEGORY", "ITEM_TYPE", "ITEM_CLASS", "LIST_PRICE_PER_UNIT", "BOM_ITEM_TYPE", "PRIMARY_UOM_CODE", "INVOICEABLE_ITEM_FLAG", "INVENTORY_ASSET_FLAG", "PURCHASING_ITEM_FLAG", "CREATED_ON_DT", "CHANGED_ON_DT", "ETL_UPDATE_DT", "ETL_INSERT_DT", "ETL_PROC_WID", "DATASOURCE", "LINE_OF_BUSINESS", "SFDC_PRODUCT_TYPE", "INCLUDE_EXCLUDE", "INCLUDE_IN_LA", "INCLUDE_IN_OA", "ASSET_TYPE", "SQFT", "QUANTITY_IS_SQFT") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
        g.product_src_key,
        g.product_src_code,
        g.product_src_desc,
        g.product_type_group,
        h.level4_name   l4_product_type,
        h.level3_name   l3_product_family,
        h.level2_name   l2_product_subcategory,
        h.level1_name   l1_product_category,
        g.product_hier_wid,
        pr."ROW_WID",
        pr."INVENTORY_ITEM_ID",
        pr."ORGANIZATION_ID",
        pr."INTEGRATION_ID",
        pr."ITEM_NUMBER",
        pr."ITEM_DESCRIPTION",
        pr."ORGANIZATION_CODE",
        pr."PRODUCT_CATALOG_CATEGORY",
        pr."TAX_CATALOG_CATEGORY",
        pr."IL_TAX_CATEGORY",
        pr."ITEM_TYPE",
        pr."ITEM_CLASS",
        pr."LIST_PRICE_PER_UNIT",
        pr."BOM_ITEM_TYPE",
        pr."PRIMARY_UOM_CODE",
        pr."INVOICEABLE_ITEM_FLAG",
        pr."INVENTORY_ASSET_FLAG",
        pr."PURCHASING_ITEM_FLAG",
        pr."CREATED_ON_DT",
        pr."CHANGED_ON_DT",
        pr."ETL_UPDATE_DT",
        pr."ETL_INSERT_DT",
        pr."ETL_PROC_WID",
        pr."DATASOURCE",
        pr."LINE_OF_BUSINESS",
        g.sfdc_product_type,
        g.include_exclude,
		       g.include_in_la, g.include_in_oa,g.asset_type,
        g.sqft,
        g.quantity_is_sqft
    FROM
        dw.vw_product_d           pr
        LEFT OUTER JOIN w_product_hierarchy_map   g ON g.product_src_key = integration_id
                                                     AND pr.datasource = g.datasource
                                                     AND current_flg = 'Y'
        LEFT OUTER JOIN w_product_hierarchy_g     h ON g.product_hier_wid = h.row_wid
;
  GRANT SELECT ON "DW"."VW_PRODUCT_HIERARCHY_D" TO "ODS";
  GRANT READ ON "DW"."VW_PRODUCT_HIERARCHY_D" TO "ODS";
  GRANT SELECT ON "DW"."VW_PRODUCT_HIERARCHY_D" TO "DW_RO";
  GRANT READ ON "DW"."VW_PRODUCT_HIERARCHY_D" TO "DW_RO";
