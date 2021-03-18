--------------------------------------------------------
--  DDL for View VW_SUITE_METRICS_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_SUITE_METRICS_F" ("PROPERTY_WID", "SUITE", "SUITE_SRC_KEY", "SUITE_SQ_FT", "SUITE_KW", "LOAD_FACTOR", "SNAPSHOT_DATE", "CREATED_ON_DT", "CHANGED_ON_DT", "ETL_UPDATE_DT", "ETL_INSERT_DT", "ETL_PROC_WID", "DATASOURCE", "SNAPSHOT_PERIOD") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
        "PROPERTY_WID",
        "SUITE",
        "SUITE_SRC_KEY",
        "SUITE_SQ_FT",
        "SUITE_KW",
        "LOAD_FACTOR",
        "SNAPSHOT_DATE",
        "CREATED_ON_DT",
        "CHANGED_ON_DT",
        "ETL_UPDATE_DT",
        "ETL_INSERT_DT",
        "ETL_PROC_WID",
        "DATASOURCE",
        "SNAPSHOT_PERIOD"
    FROM
        w_suite_metrics_f
;
  GRANT READ ON "DW"."VW_SUITE_METRICS_F" TO "ODS";
  GRANT READ ON "DW"."VW_SUITE_METRICS_F" TO "DW_RO";
  GRANT SELECT ON "DW"."VW_SUITE_METRICS_F" TO "ODS";
