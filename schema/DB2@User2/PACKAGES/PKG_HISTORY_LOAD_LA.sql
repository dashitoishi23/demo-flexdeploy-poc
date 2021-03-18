--------------------------------------------------------
--  DDL for Package PKG_HISTORY_LOAD_LA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "DW"."PKG_HISTORY_LOAD_LA" AS
    PROCEDURE customers;
	PROCEDURE property;
    PROCEDURE lease_activity_dim;
    PROCEDURE lease_activity_fact;
	PROCEDURE Load_la_subject_area;
END pkg_history_load_la;

/

  GRANT EXECUTE ON "DW"."PKG_HISTORY_LOAD_LA" TO "SVC_ODI";
  GRANT DEBUG ON "DW"."PKG_HISTORY_LOAD_LA" TO "DW_RO";
