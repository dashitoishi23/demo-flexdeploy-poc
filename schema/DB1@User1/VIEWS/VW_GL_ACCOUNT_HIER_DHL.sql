--------------------------------------------------------
--  DDL for View VW_GL_ACCOUNT_HIER_DHL
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_GL_ACCOUNT_HIER_DHL" ("ROW_WID", "ACCOUNT_WID", "ACCOUNT_TREE_WID", "CREATED_ON_DT", "CHANGED_ON_DT", "ETL_UPDATE_DT", "ETL_INSERT_DT") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
        "ROW_WID",
        "ACCOUNT_WID",
        "ACCOUNT_TREE_WID",
        "CREATED_ON_DT",
        "CHANGED_ON_DT",
        "ETL_UPDATE_DT",
        "ETL_INSERT_DT"
    FROM
        w_gl_account_hier_dhl
;
  GRANT READ ON "DW"."VW_GL_ACCOUNT_HIER_DHL" TO "ODS";
  GRANT READ ON "DW"."VW_GL_ACCOUNT_HIER_DHL" TO "DW_RO";
