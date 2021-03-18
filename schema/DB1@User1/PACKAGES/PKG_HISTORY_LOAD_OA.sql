--------------------------------------------------------
--  DDL for Package PKG_HISTORY_LOAD_OA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "DW"."PKG_HISTORY_LOAD_OA" AS
    PROCEDURE customers;
    PROCEDURE property;
    PROCEDURE lease_terms_dim;
    PROCEDURE occupancy_fact;
    PROCEDURE Load_oa_subject_area;
END pkg_history_load_oa;

/
