--------------------------------------------------------
--  DDL for Table W_DOMAIN_MEMBER_MAP
--------------------------------------------------------

  CREATE TABLE "DW"."W_DOMAIN_MEMBER_MAP" 
   (	"SOURCE_CODE" VARCHAR2(16 BYTE) COLLATE "USING_NLS_COMP", 
	"SOURCE_DESC" VARCHAR2(100 BYTE) COLLATE "USING_NLS_COMP", 
	"TRGT_CODE" VARCHAR2(80 BYTE) COLLATE "USING_NLS_COMP", 
	"TRGT_NAME" VARCHAR2(150 BYTE) COLLATE "USING_NLS_COMP", 
	"ACTIVE_FLG" VARCHAR2(1 BYTE) COLLATE "USING_NLS_COMP", 
	"CHANGED_ON_DT" DATE, 
	"CHANGED_BY" VARCHAR2(250 BYTE) COLLATE "USING_NLS_COMP", 
	"SOURCE_KEY" VARCHAR2(80 BYTE) COLLATE "USING_NLS_COMP", 
	"SOURCE_TABLE" VARCHAR2(30 BYTE) COLLATE "USING_NLS_COMP", 
	"DATASOURCE" VARCHAR2(30 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 COLUMN STORE COMPRESS FOR QUERY HIGH ROW LEVEL LOCKING LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
  GRANT SELECT ON "DW"."W_DOMAIN_MEMBER_MAP" TO "ODS" WITH GRANT OPTION;
  GRANT READ ON "DW"."W_DOMAIN_MEMBER_MAP" TO "ODS";
  GRANT SELECT ON "DW"."W_DOMAIN_MEMBER_MAP" TO "DW_RO";
  GRANT READ ON "DW"."W_DOMAIN_MEMBER_MAP" TO "DW_RO";
