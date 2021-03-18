--------------------------------------------------------
--  DDL for View VW_GL_BOOK_D
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_GL_BOOK_D" ("ROW_WID", "BOOK_SRC_KEY", "BOOK_NAME", "CREATED_ON_DT", "CHANGED_ON_DT", "ETL_UPDATE_DT", "ETL_INSERT_DT", "ETL_PROC_WID", "DATASOURCE") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
        "ROW_WID",
        "BOOK_SRC_KEY",
        "BOOK_NAME",
        "CREATED_ON_DT",
        "CHANGED_ON_DT",
        "ETL_UPDATE_DT",
        "ETL_INSERT_DT",
        "ETL_PROC_WID",
        "DATASOURCE"
    FROM
        w_gl_book_d
;
  GRANT READ ON "DW"."VW_GL_BOOK_D" TO "ODS";
  GRANT READ ON "DW"."VW_GL_BOOK_D" TO "DW_RO";
