--------------------------------------------------------
--  DDL for Procedure HISTORY_LOAD_PROPERTY_BULK_UPDATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "DW"."HISTORY_LOAD_PROPERTY_BULK_UPDATE" 
as
begin

EXECUTE IMMEDIATE 'alter session force parallel query parallel 8';


EXECUTE IMMEDIATE 'ANALYZE TABLE dw.w_property_d COMPUTE STATISTICS';

merge into w_property_d  p
using (
SELECT
    address1,
    address2,
    city,
    state,
    country,country_code,
    zip_postal_code,
    acquired_date,
    disposition_date,
    market,
    region,
    ownership_type,
    leased_owned,
    division,
    portfolio_ownership_percentage,
    data_center_manager,
    externally_reported,
    campus,
    real_estate_manager,
    property_assistant,
    formally_known_as_site_code,
    internal_location_code,
    site_code_operational
FROM
    w_location_d
WHERE
    snapshot_period = '210001'
    and SITE_CODE_OPERATIONAL <> 'NA' -- one time baselining with live data
    and SITE_CODE_OPERATIONAL <> '(Not Assigned)'
) l
on (p.datasource = 'HISTORY LOAD' and p.site_code = l.site_code_operational ) -- bulk update only for history load with operational site code
 WHEN MATCHED THEN UPDATE SET 
        p.ADDRESS1 = l.ADDRESS1 ,
        p.ADDRESS2 = l.ADDRESS2 ,
        p.CITY = l.CITY ,
        p.STATE = l.STATE ,
        p.COUNTRY = l.COUNTRY ,
        p.COUNTRY_CODE = l.COUNTRY_CODE ,
        p.ZIP_POSTAL_CODE = l.ZIP_POSTAL_CODE ,
        /* p.ACQUIRED_DATE = l.ACQUIRED_DATE ,
        p.DISPOSITION_DATE = l.DISPOSITION_DATE ,
        p.MARKET = l.MARKET ,
        p.REGION = l.REGION ,
        p.OWNERSHIP_TYPE = l.OWNERSHIP_TYPE ,
        p.LEASED_OWNED = l.LEASED_OWNED ,
        p.DIVISION = l.DIVISION ,
        p.PORTFOLIO_OWNERSHIP_PERCENTAGE = l.PORTFOLIO_OWNERSHIP_PERCENTAGE ,
        p.DATA_CENTER_MANAGER = l.DATA_CENTER_MANAGER ,
        p.EXTERNALLY_REPORTED = l.EXTERNALLY_REPORTED , */
        p.CAMPUS = l.CAMPUS ,
        -- p.REAL_ESTATE_MANAGER = l.REAL_ESTATE_MANAGER ,
        -- p.PROPERTY_ASSISTANT = l.PROPERTY_ASSISTANT ,
        p.FORMALLY_KNOWN_AS_SITE_CODE = l.FORMALLY_KNOWN_AS_SITE_CODE ,
        p.MASTER_SITE_CODE = l.INTERNAL_LOCATION_CODE 
  ;

 commit ;


merge into w_property_d  p
using (
SELECT
    address1,
    address2,
    city,
    state,
    country,country_code,
    zip_postal_code,
    acquired_date,
    disposition_date,
    market,
    region,
    ownership_type,
    leased_owned,
    division,
    portfolio_ownership_percentage,
    data_center_manager,
    externally_reported,
    campus,
    real_estate_manager,
    property_assistant,
    formally_known_as_site_code,
    internal_location_code,
    site_code_operational
FROM
    w_location_d
WHERE
    snapshot_period = '210001'
) l
on (p.datasource = 'HISTORY LOAD' and p.MASTER_SITE_CODE = l.INTERNAL_LOCATION_CODE ) -- bulk update only for history load with operational site code
 WHEN MATCHED THEN UPDATE SET 
        p.ADDRESS1 = l.ADDRESS1 ,
        p.ADDRESS2 = l.ADDRESS2 ,
        p.CITY = l.CITY ,
        p.STATE = l.STATE ,
        p.COUNTRY = l.COUNTRY ,
        p.COUNTRY_CODE = l.COUNTRY_CODE ,
        p.ZIP_POSTAL_CODE = l.ZIP_POSTAL_CODE ,
        /* p.ACQUIRED_DATE = l.ACQUIRED_DATE ,
        p.DISPOSITION_DATE = l.DISPOSITION_DATE ,
        p.MARKET = l.MARKET ,
        p.REGION = l.REGION ,
        p.OWNERSHIP_TYPE = l.OWNERSHIP_TYPE ,
        p.LEASED_OWNED = l.LEASED_OWNED ,
        p.DIVISION = l.DIVISION ,
        p.PORTFOLIO_OWNERSHIP_PERCENTAGE = l.PORTFOLIO_OWNERSHIP_PERCENTAGE ,
        p.DATA_CENTER_MANAGER = l.DATA_CENTER_MANAGER ,
        p.EXTERNALLY_REPORTED = l.EXTERNALLY_REPORTED , */
        p.CAMPUS = l.CAMPUS ,
        -- p.REAL_ESTATE_MANAGER = l.REAL_ESTATE_MANAGER ,
        -- p.PROPERTY_ASSISTANT = l.PROPERTY_ASSISTANT ,
        p.FORMALLY_KNOWN_AS_SITE_CODE = l.FORMALLY_KNOWN_AS_SITE_CODE ,
        p.site_code = l.site_code_operational 
  ;


commit ;  

 update w_property_d set country = 'Netherlands' where country = 'The Netherlands' and datasource = 'HISTORY LOAD';

commit ;

update w_property_d set COUNTRY_CODE = 'BR' where COUNTRY_CODE = 'Not Assigned' and datasource = 'HISTORY LOAD' and COUNTRY = 'Brazil';

commit ;

UPDATE w_property_d 
SET country_code = (SELECT MAX(COUNTRY_CODE) FROM W_LOCATION_D WHERE UPPER(W_LOCATION_D.COUNTRY) = UPPER(w_property_d.COUNTRY))
WHERE country_code IS NULL and datasource = 'HISTORY LOAD';

commit ;


UPDATE w_property_d 
SET ASSISTANT_REM  = (select    (sfirstname || ' '|| ulastname) FROM  ods.Yardi_Person where upper(trim(ucode)) = UPPER(w_property_d.ASSISTANT_REM ))
WHERE datasource = 'HISTORY LOAD' and 
exists (select 1 from ods.Yardi_Person where upper(trim(ucode)) = UPPER(w_property_d.ASSISTANT_REM ) ) ;

commit;

UPDATE w_property_d 
SET REGIONAL_MANAGER  = (select    (sfirstname || ' '|| ulastname) FROM  ods.Yardi_Person where upper(trim(ucode)) = UPPER(w_property_d.REGIONAL_MANAGER ))
WHERE datasource = 'HISTORY LOAD' and 
exists (select 1 from ods.Yardi_Person where upper(trim(ucode)) = UPPER(w_property_d.REGIONAL_MANAGER ) ) ;

commit;

UPDATE w_property_d 
SET ASSET_MANAGER  = (select    (sfirstname || ' '|| ulastname) FROM  ods.Yardi_Person where upper(trim(ucode)) = UPPER(w_property_d.ASSET_MANAGER ))
WHERE datasource = 'HISTORY LOAD' and 
exists (select 1 from ods.Yardi_Person where upper(trim(ucode)) = UPPER(w_property_d.ASSET_MANAGER ) ) ;

commit;

UPDATE w_property_d 
SET DIRECTOR  = (select    (sfirstname || ' '|| ulastname) FROM  ods.Yardi_Person where upper(trim(ucode)) = UPPER(w_property_d.DIRECTOR ))
WHERE datasource = 'HISTORY LOAD' and 
exists (select 1 from ods.Yardi_Person where upper(trim(ucode)) = UPPER(w_property_d.DIRECTOR ) ) ;

commit;

UPDATE w_property_d 
SET REAL_ESTATE_MANAGER  = (select    (sfirstname || ' '|| ulastname) FROM  ods.Yardi_Person where upper(trim(ucode)) = UPPER(w_property_d.REAL_ESTATE_MANAGER ))
WHERE datasource = 'HISTORY LOAD' and 
exists (select 1 from ods.Yardi_Person where upper(trim(ucode)) = UPPER(w_property_d.REAL_ESTATE_MANAGER ) ) ;

commit;

update w_property_d set HRIS_DIVISION = '(Not Assigned)'
where HRIS_DIVISION = 'not applicable'
and datasource = 'HISTORY LOAD' ;

commit ;

update w_property_d set ELT = '(Not Assigned)'
where ELT = 'not applicable'
and datasource = 'HISTORY LOAD' ;

commit ;

UPDATE w_property_d 
SET country_code = (SELECT MAX(TERRITORYCODE) FROM ODS.fusion_territories WHERE UPPER(TERRITORYSHORTNAME) = UPPER(w_property_d.COUNTRY))
WHERE country_code IS NULL and datasource = 'HISTORY LOAD';

commit ;




merge into w_property_d
using ( select   site_code_operational, max(internal_location_code) internal_location_code from w_location_d l
group by site_code_operational having  count(distinct internal_location_code) = 1 ) w_location_d 
on (w_property_d.master_site_code = w_location_d.internal_location_code and w_property_d.datasource = 'HISTORY LOAD' 
 )
when matched then update
 set site_code = site_code_operational
where   w_property_d.site_code is null;

commit;



UPDATE w_property_d
SET
 entity_type = CASE WHEN entity_type = 'NA' OR entity_type IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( entity_type) END,
 division = CASE WHEN division = 'NA' OR division IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( division) END,
 elt = CASE WHEN elt = 'NA' OR elt IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( elt) END,
 hris_division = CASE WHEN hris_division = 'NA' OR hris_division IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( hris_division) END,
 stabilized_current_year = CASE WHEN stabilized_current_year = 'NA' OR stabilized_current_year IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( stabilized_current_year) END,
 stabilized_next_year = CASE WHEN stabilized_next_year = 'NA' OR stabilized_next_year IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( stabilized_next_year) END,
 master_site_code = CASE WHEN master_site_code = 'NA' OR master_site_code IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( master_site_code) END,
 building = CASE WHEN building = 'NA' OR building IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( building) END,
 assistant_rem = CASE WHEN assistant_rem = 'NA' OR assistant_rem IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( assistant_rem) END,
 floor = CASE WHEN floor = 'NA' OR floor IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( floor) END,
 real_estate_manager = CASE WHEN real_estate_manager = 'NA' OR real_estate_manager IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( real_estate_manager) END,
 director = CASE WHEN director = 'NA' OR director IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( director) END,
 property_assistant = CASE WHEN property_assistant = 'NA' OR property_assistant IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( property_assistant) END,
 geographic_division = CASE WHEN geographic_division = 'NA' OR geographic_division IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( geographic_division) END,
 entity_parent = CASE WHEN entity_parent = 'NA' OR entity_parent IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( entity_parent) END,
 regional_manager = CASE WHEN regional_manager = 'NA' OR regional_manager IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( regional_manager) END,
 site_code = CASE WHEN site_code = 'NA' OR site_code IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( site_code) END,
 campus = CASE WHEN campus = 'NA' OR campus IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( campus) END,
 reported_market = CASE WHEN reported_market = 'NA' OR reported_market IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( reported_market) END,

 reported_region = CASE WHEN reported_region = 'NA' OR reported_region IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( reported_region) END,
 legal_entity_name = CASE WHEN legal_entity_name = 'NA' OR legal_entity_name IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( legal_entity_name) END,
 asset_manager = CASE WHEN asset_manager = 'NA' OR asset_manager IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( asset_manager) END,
 formally_known_as_site_code = CASE WHEN formally_known_as_site_code = 'NA' OR formally_known_as_site_code IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( formally_known_as_site_code) END,
 externally_reported = CASE WHEN externally_reported = 'NA' OR externally_reported IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( externally_reported) END,
 data_center_manager = CASE WHEN data_center_manager = 'NA' OR data_center_manager IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( data_center_manager) END,
 property_manager = CASE WHEN property_manager = 'NA' OR property_manager IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( property_manager) END,
 line_of_business = CASE WHEN line_of_business = 'NA' OR line_of_business IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( line_of_business) END,
 property_name = CASE WHEN property_name = 'NA' OR property_name IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( property_name) END,
 ownership_percent = CASE WHEN ownership_percent = 'NA' OR ownership_percent IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( ownership_percent) END,

 unit_type = CASE WHEN unit_type = 'NA' OR unit_type IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( unit_type) END,
 country_code = CASE WHEN country_code = 'NA' OR country_code IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( country_code) END,
 legal_entity = CASE WHEN legal_entity = 'NA' OR legal_entity IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( legal_entity) END,
 address1 = CASE WHEN address1 = 'NA' OR address1 IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( address1) END,
 suite = CASE WHEN suite = 'NA' OR suite IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( suite) END,
 unit_desc = CASE WHEN unit_desc = 'NA' OR unit_desc IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( unit_desc) END,
 suite_type = CASE WHEN suite_type = 'NA' OR suite_type IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( suite_type) END,
 property_type = CASE WHEN property_type = 'NA' OR property_type IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( property_type) END,
 city = CASE WHEN city = 'NA' OR city IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( city) END,
 state = CASE WHEN state = 'NA' OR state IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( state) END,
 country = CASE WHEN country = 'NA' OR country IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( country) END,
 same_store = CASE WHEN same_store = 'NA' OR same_store IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( same_store) END,
 domestic_intrl = CASE WHEN domestic_intrl = 'NA' OR domestic_intrl IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( domestic_intrl) END,
 market = CASE WHEN market = 'NA' OR market IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( market) END,
 region = CASE WHEN region = 'NA' OR region IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( region) END,
 ownership_type = CASE WHEN ownership_type = 'NA' OR ownership_type IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( ownership_type) END,
 leased_owned = CASE WHEN leased_owned = 'NA' OR leased_owned IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( leased_owned) END,
 source_currency_property = CASE WHEN source_currency_property = 'NA' OR source_currency_property IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( source_currency_property) END,
 sap_warehouse_code = CASE WHEN sap_warehouse_code = 'NA' OR sap_warehouse_code IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( sap_warehouse_code) END,
 address2 = CASE WHEN address2 = 'NA' OR address2 IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( address2) END,
 unit = CASE WHEN unit = 'NA' OR unit IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( unit) END,
 unit_status = CASE WHEN unit_status = 'NA' OR unit_status IS NULL THEN '(Not Assigned)' ELSE TO_CHAR( unit_status) END
WHERE DATASOURCE = 'HISTORY LOAD';

commit;

/*
update w_property_d
set EXTERNALLY_REPORTED = NVL((select max(EXTERNALLY_REPORTED) from w_location_d where internal_location_code = w_property_d.master_site_code 
and live_flag =  1 and EXTERNALLY_REPORTED is not null and EXTERNALLY_REPORTED <> 'NA' ), '(Not Assigned)') 
where datasource = 'HISTORY LOAD'  and EXTERNALLY_REPORTED is null
and exists (select 1 from w_location_d where live_flag = 1 and  internal_location_code =  w_property_d.master_site_code);

commit;
*/
/*
update w_property_d set EXTERNALLY_REPORTED = 'Y' where datasource = 'HISTORY LOAD' and EXTERNALLY_REPORTED = '1';
commit;

update w_property_d set EXTERNALLY_REPORTED = 'N' where datasource = 'HISTORY LOAD' and EXTERNALLY_REPORTED = '0';
commit;

update w_property_d set EXTERNALLY_REPORTED = 'N' where datasource = 'HISTORY LOAD' and EXTERNALLY_REPORTED = '(Inactive)';
commit;
*/

 update dw.w_property_d set
  EXTERNALLY_REPORTED = (select case when reported = 'Reported' then 'Y' 
   when  reported = 'Not Reported' then 'N' 
  else '(Not Assigned)' end reported from MSDWPRD.bus_vcubedimproperty where propertysk = legacy_src_key
)
where datasource = 'HISTORY LOAD' ;

commit;



end
;

/

  GRANT EXECUTE ON "DW"."HISTORY_LOAD_PROPERTY_BULK_UPDATE" TO "SVC_ODI";
  GRANT DEBUG ON "DW"."HISTORY_LOAD_PROPERTY_BULK_UPDATE" TO "DW_RO";
