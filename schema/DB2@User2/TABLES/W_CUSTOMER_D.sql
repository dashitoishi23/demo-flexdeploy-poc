--------------------------------------------------------
--  DDL for Table W_CUSTOMER_D
--------------------------------------------------------

  CREATE TABLE "DW"."W_CUSTOMER_D" 
   (	"ROW_WID" NUMBER(*,0), 
	"L4_LEGAL_ENTITY_SRC_KEY" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"L4_LEGAL_ENTITY_CODE" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"L4_LEGAL_ENTITY_NAME" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"L3_CUSTOMER_SRC_KEY" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"L3_CUSTOMER_CODE" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"L3_CUSTOMER_NAME" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"L2_PARENT_CUSTOMER_SRC_KEY" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"L2_PARENT_CUSTOMER_CODE" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"L2_PARENT_CUSTOMER_NAME" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"L1_GLOBAL_ULTIMATE_CUSTOMER_SRC_KEY" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"L1_GLOBAL_ULTIMATE_CUSTOMER_NAME" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"IS_GLOBAL_ULTIMATE" NUMBER(*,0), 
	"MARKET_SEGMENT1" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"MARKET_SEGMENT2" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"MARKET_SEGMENT3" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"DIVERSITY" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"DIVERSITY_CATEGORY" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"DIVERSITY_SUBCATEGORY" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"COMPANY_OWNERSHIP_TYPE_NAME" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"ACCOUNT_OWNER" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"SALES_SECTOR" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"ACTIVE_FLAG" NVARCHAR2(20) COLLATE "USING_NLS_COMP", 
	"ACCOUNT_REFERENCE_NUMBER" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"ACCOUNT_REVENUE_RANGE" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"CUSTOMER_SUCCESS_DIRECTOR" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"CUSTOMER_SUCCESS_MANAGER" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"LEGACY_SRC_KEY" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"EFFECTIVE_START_DATE" DATE, 
	"EFFECTIVE_END_DATE" DATE, 
	"CURRENT_FLAG" VARCHAR2(10 BYTE) COLLATE "USING_NLS_COMP", 
	"CREATED_ON_DT" DATE, 
	"CHANGED_ON_DT" DATE, 
	"ETL_UPDATE_DT" DATE, 
	"ETL_INSERT_DT" DATE, 
	"ETL_PROC_WID" NUMBER(*,0), 
	"DATASOURCE" NVARCHAR2(255) COLLATE "USING_NLS_COMP", 
	"CUSTOMER_TYPE" VARCHAR2(40 BYTE) COLLATE "USING_NLS_COMP", 
	"CUSTOMER_TIER" NVARCHAR2(250) COLLATE "USING_NLS_COMP", 
	"GOLDEN_CUSTOMER_NAME" NVARCHAR2(150) COLLATE "USING_NLS_COMP", 
	"ACTIVE_RECORD_FLAG" VARCHAR2(10 BYTE) COLLATE "USING_NLS_COMP" DEFAULT 'N', 
	"L4_CUSTOMER_TIER" NVARCHAR2(250) COLLATE "USING_NLS_COMP", 
	"L3_CUSTOMER_TIER" NVARCHAR2(250) COLLATE "USING_NLS_COMP", 
	"L2_CUSTOMER_TIER" NVARCHAR2(250) COLLATE "USING_NLS_COMP", 
	"L1_CUSTOMER_TIER" NVARCHAR2(250) COLLATE "USING_NLS_COMP", 
	"L4_SALES_SECTOR" VARCHAR2(128 BYTE) COLLATE "USING_NLS_COMP", 
	"L3_SALES_SECTOR" VARCHAR2(128 BYTE) COLLATE "USING_NLS_COMP", 
	"L2_SALES_SECTOR" VARCHAR2(128 BYTE) COLLATE "USING_NLS_COMP", 
	"L1_SALES_SECTOR" VARCHAR2(128 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 COLUMN STORE COMPRESS FOR QUERY HIGH ROW LEVEL LOCKING LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
  GRANT SELECT ON "DW"."W_CUSTOMER_D" TO "ODS";
  GRANT READ ON "DW"."W_CUSTOMER_D" TO "ODS";
  GRANT SELECT ON "DW"."W_CUSTOMER_D" TO "DW_RO";
  GRANT READ ON "DW"."W_CUSTOMER_D" TO "DW_RO";
