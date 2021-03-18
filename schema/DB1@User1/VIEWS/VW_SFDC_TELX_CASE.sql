--------------------------------------------------------
--  DDL for View VW_SFDC_TELX_CASE
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_SFDC_TELX_CASE" ("PARENTCASENUMBER", "PARENTCASESTATUS", "PARENTFOCDATE", "PARENTCASERECORDTYPE", "CHILDCASENUMBER", "CHILDCASESTATUS", "CHILDFOCDATE", "CHILDCASERECORDTYPE") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  select
p.casenumber ParentCaseNumber,
p.Status ParentCaseStatus,
p.FOC_DATE__C ParentFOCDate,
prt.Name ParentCaseRecordType,
ch.CASENUMBER ChildCaseNumber,
ch.status ChildCaseStatus,
Ch.FOC_DATE__C ChildFOCDate,
rt.Name ChildCaseRecordType
from
ods.SFDC_TELX_RECORDTYPE RT,
ods.SFDC_TELX_CASE CH,
ods.SFDC_TELX_CASE P,
ods.SFDC_TELX_RECORDTYPE PRT
where
ch.PARENTID = p.ID(+) and
rt.id = ch.RECORDTYPEID
and p.RECORDTYPEID = prt.id(+)
;
  GRANT READ ON "DW"."VW_SFDC_TELX_CASE" TO "DW_RO";
