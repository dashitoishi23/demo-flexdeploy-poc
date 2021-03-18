--------------------------------------------------------
--  DDL for Package PKG_HISTORY_LOAD_AR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "DW"."PKG_HISTORY_LOAD_AR" AS
    PROCEDURE ar_fact_summary;
	PROCEDURE ar_fact_detail;
	PROCEDURE Load_ar_subject_area;
END pkg_history_load_ar;

/

  GRANT EXECUTE ON "DW"."PKG_HISTORY_LOAD_AR" TO "SVC_ODI";
  GRANT DEBUG ON "DW"."PKG_HISTORY_LOAD_AR" TO "DW_RO";
