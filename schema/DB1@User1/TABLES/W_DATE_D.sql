--------------------------------------------------------
--  DDL for Table W_DATE_D
--------------------------------------------------------

  CREATE TABLE "DW"."W_DATE_D" 
   (	"ROW_WID" NUMBER(20,0), 
	"DATE_VALUE" DATE, 
	"YEAR" NUMBER(*,0), 
	"QUARTER" NVARCHAR2(50) COLLATE "USING_NLS_COMP", 
	"MONTH" NVARCHAR2(50) COLLATE "USING_NLS_COMP", 
	"QUARTER_NAME" NVARCHAR2(20) COLLATE "USING_NLS_COMP", 
	"MONTH_NAME" NVARCHAR2(50) COLLATE "USING_NLS_COMP", 
	"MONTH_ORDER" NUMBER(*,0), 
	"DAY_OF_WEEK" VARCHAR2(1 BYTE) COLLATE "USING_NLS_COMP", 
	"DAY_NAME" VARCHAR2(36 BYTE) COLLATE "USING_NLS_COMP", 
	"DAY_AGO_DATE" DATE, 
	"DAY_AGO_WID" NUMBER, 
	"YEAR_AGO_DATE" DATE, 
	"YEAR_AGO_WID" NUMBER, 
	"QUARTER_AGO_DATE" DATE, 
	"QUARTER_AGO_WID" NUMBER, 
	"MONTH_AGO_DATE" DATE, 
	"MONTH_AGO_WID" NUMBER, 
	"WEEK_AGO_DATE" DATE, 
	"WEEK_AGO_WID" NUMBER, 
	"HOLIDAY_FLAG" CHAR(1 BYTE) COLLATE "USING_NLS_COMP", 
	"FIRST_DAY_MONTH_FLAG" CHAR(1 BYTE) COLLATE "USING_NLS_COMP", 
	"LAST_DAY_MONTH_FLAG" CHAR(1 BYTE) COLLATE "USING_NLS_COMP", 
	"FIRST_DAY_QUARTER_FLAG" CHAR(1 BYTE) COLLATE "USING_NLS_COMP", 
	"LAST_DAY_QUARTER_FLAG" CHAR(1 BYTE) COLLATE "USING_NLS_COMP", 
	"FIRST_DAY_YEAR_FLAG" CHAR(1 BYTE) COLLATE "USING_NLS_COMP", 
	"LAST_DAY_YEAR_FLAG" CHAR(1 BYTE) COLLATE "USING_NLS_COMP", 
	"ETL_UPDATE_DT" DATE, 
	"ETL_INSERT_DT" DATE
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 COLUMN STORE COMPRESS FOR QUERY HIGH ROW LEVEL LOCKING LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
  GRANT SELECT ON "DW"."W_DATE_D" TO "ODS";
  GRANT READ ON "DW"."W_DATE_D" TO "ODS";
  GRANT SELECT ON "DW"."W_DATE_D" TO "DW_RO";
  GRANT READ ON "DW"."W_DATE_D" TO "DW_RO";
