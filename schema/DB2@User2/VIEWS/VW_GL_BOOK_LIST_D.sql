--------------------------------------------------------
--  DDL for View VW_GL_BOOK_LIST_D
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_GL_BOOK_LIST_D" ("ROW_WID", "BOOK_LIST_SRC_KEY", "BOOK_LIST_NAME", "BOOK_LIST_CODE", "TYPE", "CREATED_ON_DT", "CHANGED_ON_DT", "ETL_UPDATE_DT", "ETL_INSERT_DT", "ETL_PROC_WID", "DATASOURCE", "BOOK_WID", "BOOK_LIST_DESCRIPTION") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
        ROW_WID,
        BOOK_LIST_SRC_KEY,
        BOOK_LIST_NAME,
        BOOK_LIST_CODE,
        TYPE,
        CREATED_ON_DT,
        CHANGED_ON_DT,
        ETL_UPDATE_DT,
        ETL_INSERT_DT,
        ETL_PROC_WID,
        DATASOURCE,
        BOOK_WID,
        Book_List_Code || ' ' || '-' || ' ' || Book_List_Name Book_List_Description
    FROM
        w_gl_book_list_d
;
  GRANT READ ON "DW"."VW_GL_BOOK_LIST_D" TO "ODS";
  GRANT READ ON "DW"."VW_GL_BOOK_LIST_D" TO "DW_RO";
