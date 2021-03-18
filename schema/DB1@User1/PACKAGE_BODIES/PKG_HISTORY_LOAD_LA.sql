--------------------------------------------------------
--  DDL for Package Body PKG_HISTORY_LOAD_LA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DW"."PKG_HISTORY_LOAD_LA" AS


    /*
    -------------------------
    Customer Dimension Lookup 
    -------------------------
    */

    PROCEDURE customers IS
    BEGIN
        EXECUTE IMMEDIATE 'alter session force parallel query parallel 8';
        DELETE FROM dwstage.w_customer_tmp;  --- clean up stage table

        COMMIT;

         --- Insert locked data set to the stage table
        INSERT INTO dwstage.w_customer_tmp (
            row_wid,
            market_segment1,
            market_segment2,
            market_segment3,
            l1_global_ultimate_customer_src_key,
            l1_global_ultimate_customer_name,
            l2_parent_customer_src_key,
            l2_parent_customer_code,
            l2_parent_customer_name,
            l3_customer_src_key,
            l3_customer_code,
            l3_customer_name,
            l4_legal_entity_src_key,
            l4_legal_entity_code,
            l4_legal_entity_name,
            diversity,
            diversity_category,
            diversity_subcategory,
            is_global_ultimate,
            company_ownership_type_name,
            account_owner,
            sales_sector,
            customer_success_director,
            customer_success_manager,
            created_on_dt,
            changed_on_dt,
            etl_update_dt,
            etl_insert_dt,
            etl_proc_wid,
            datasource,
            --snapshot_period,
            --snapshot_date,
            legacy_src_key,
            EFFECTIVE_START_DATE,
            EFFECTIVE_END_DATE,
            CURRENT_FLAG,
            CUSTOMER_TYPE,
            CUSTOMER_TIER,
            GOLDEN_CUSTOMER_NAME
        )
            SELECT 
                rownum row_wid,
                dbo_vCubeDimCustomer.marketsegment1         market_segment1,
                dbo_vCubeDimCustomer.marketsegment2         market_segment2,
                dbo_vCubeDimCustomer.marketsegment3         market_segment3,
                dbo_DimCustomer.l1goldencustomerkey    l1_global_ultimate_customer_src_key,
                dbo_vCubeDimCustomer.l1goldencustomername   l1_global_ultimate_customer_name,
                dbo_DimCustomer.l2parentcustomerkey    l2_parent_customer_src_key,
                dbo_vCubeDimCustomer.l2parentcustomercode   l2_parent_customer_code,
                dbo_vCubeDimCustomer.l2parentcustomername   l2_parent_customer_name,
                dbo_vCubeDimCustomer.l2parentcustomercode l3_customer_src_key,
                dbo_vCubeDimCustomer.l2parentcustomercode l3_customer_code,
                dbo_vCubeDimCustomer.l2parentcustomername l3_customer_name,
                dbo_vCubeDimCustomer.l3legalentitycode      l4_legal_entity_src_key,
                dbo_vCubeDimCustomer.l3legalentitycode      l4_legal_entity_code,
                dbo_vCubeDimCustomer.l3legalentityname      l4_legal_entity_name,
                dbo_vCubeDimCustomer.diversity              diversity,
                dbo_vCubeDimCustomer.diversitycategory      diversity_category,
                dbo_vCubeDimCustomer.diversitysubcategory   diversity_subcategory,
                isglobalultimate       is_global_ultimate,
                companyownershiptype   company_ownership_type_name,
                dbo_vCubeDimCustomer.ownername              account_owner,
                dbo_vCubeDimCustomer.salessector            sales_sector,
                null customer_success_director,
                null customer_success_manager,
                sysdate           created_on_dt,
                sysdate           changed_on_dt,
                sysdate                etl_update_dt,
                sysdate                etl_insert_dt,
                - 1 etl_proc_wid,
                'HISTORY LOAD' datasource,
                --to_char(datess, 'yyyymm') snapshot_period,
                --datess                 snapshot_date,
                dbo_vCubeDimCustomer.customersk             legacy_src_key,
                null /*trunc(to_date(code||'01','yyyymmdd'), 'MM')*/ EFFECTIVE_START_DATE,
                null /*trunc( last_day(to_date(code||'01','yyyymmdd')))*/ EFFECTIVE_END_DATE,
                'N' CURRENT_FLAG,
                sfdc_account.type  CUSTOMER_TYPE,
                ACCOUNT_TIER__C CUSTOMER_TIER,
                dbo_vCubeDimCustomer.L1GOLDENCUSTOMERNAME GOLDEN_CUSTOMER_NAME
         FROM
                msdwprd.dbo_vCubeDimCustomer
                left join msdwprd.dbo_DimCustomer on dbo_vCubeDimCustomer.customersk = dbo_DimCustomer.customersk
                left join ods.sfdc_account   on sfdc_account.id = dbo_vCubeDimCustomer.L2PARENTCUSTOMERCODE
                where dbo_vCubeDimCustomer.customersk > 0 and dbo_vCubeDimCustomer.customersk in 
                (
                    select SUPPLEMENTAL_VCUBEFACTLEASEACTIVITY.customersk  from msdwprd.SUPPLEMENTAL_VCUBEFACTLEASEACTIVITY 
                    inner join msdwprd.SUPPLEMENTAL_FACTLEASEACTIVITY 
                       on locked = 1 and SUPPLEMENTAL_FACTLEASEACTIVITY.leaseactivitysk = SUPPLEMENTAL_VCUBEFACTLEASEACTIVITY.leaseactivitysk

                );

        COMMIT;

        --- Clean up any previously loaded history dataset
        delete from dw.w_customer_d where SUBSTR(DATASOURCE,1,12) = 'HISTORY LOAD'
            and nvl(row_wid,-999) in (select nvl(customer_wid,-999) from w_lease_activity_f where SUBSTR(DATASOURCE,1,12) = 'HISTORY LOAD');

        commit;

        delete from dw.w_customer_d where SUBSTR(DATASOURCE,1,12) = 'HISTORY LOAD'
            and nvl(legacy_src_key,-999) in (select nvl(legacy_src_key,-999) from dwstage.w_customer_tmp);

        commit;


        --- Merge stage table data to dw table
        MERGE INTO dw.w_customer_d adw
        USING dwstage.w_customer_tmp msdw 
        ON ( msdw.legacy_src_key = adw.legacy_src_key 
        and msdw.datasource = adw.datasource
        and SUBSTR(adw.DATASOURCE,1,12) = 'HISTORY LOAD' )
        WHEN NOT MATCHED THEN
        /* if they do not exist then insert them  */
        INSERT (
            row_wid,
            market_segment1,
            market_segment2,
            market_segment3,
            l1_global_ultimate_customer_src_key,
            l1_global_ultimate_customer_name,
            l2_parent_customer_src_key,
            l2_parent_customer_code,
            l2_parent_customer_name,
            l3_customer_src_key,
            l3_customer_code,
            l3_customer_name,
            l4_legal_entity_src_key,
            l4_legal_entity_code,
            l4_legal_entity_name,
            diversity,
            diversity_category,
            diversity_subcategory,
            is_global_ultimate,
            company_ownership_type_name,
            account_owner,
            sales_sector,
            customer_success_director,
            customer_success_manager,
            created_on_dt,
            changed_on_dt,
            etl_update_dt,
            etl_insert_dt,
            etl_proc_wid,
            datasource,
            --snapshot_period,
            --snapshot_date,
            legacy_src_key,
            EFFECTIVE_START_DATE,
            EFFECTIVE_END_DATE,
            CURRENT_FLAG,
            CUSTOMER_TYPE,
            CUSTOMER_TIER,
            GOLDEN_CUSTOMER_NAME)
        VALUES
            ( w_customer_d_seq.NEXTVAL,
              msdw.market_segment1,
              msdw.market_segment2,
              msdw.market_segment3,
              msdw.l1_global_ultimate_customer_src_key,
              msdw.l1_global_ultimate_customer_name,
              msdw.l2_parent_customer_src_key,
              msdw.l2_parent_customer_code,
              msdw.l2_parent_customer_name,
              msdw.l3_customer_src_key,
              msdw.l3_customer_code,
              msdw.l3_customer_name,
              msdw.l4_legal_entity_src_key,
              msdw.l4_legal_entity_code,
              msdw.l4_legal_entity_name,
              msdw.diversity,
              msdw.diversity_category,
              msdw.diversity_subcategory,
              msdw.is_global_ultimate,
              msdw.company_ownership_type_name,
              msdw.account_owner,
              msdw.sales_sector,
              msdw.customer_success_director,
              msdw.customer_success_manager,
              msdw.created_on_dt,
              msdw.changed_on_dt,
              msdw.etl_update_dt,
              msdw.etl_insert_dt,
              msdw.etl_proc_wid,
              msdw.datasource,
              --msdw.snapshot_period,
              --msdw.snapshot_date,
              msdw.legacy_src_key,
              msdw.EFFECTIVE_START_DATE,
              msdw.EFFECTIVE_END_DATE,
              msdw.CURRENT_FLAG,
              msdw.CUSTOMER_TYPE,
              msdw.CUSTOMER_TIER,
              msdw.GOLDEN_CUSTOMER_NAME);

        COMMIT;
    END customers;

     /*
    -------------------------
    Property Dimension Lookup -- NOT REQUIRED FOR LEASE ACTIVITY BECAUSE IT CONNECTS TO LIVE RECORDS
    -------------------------
    */



	PROCEDURE property IS
    BEGIN
        EXECUTE IMMEDIATE 'alter session force parallel query parallel 8';
        DELETE FROM dwstage.w_property_tmp; -- clean up the stage table

        commit;


        -- get the locked dataset to the stage table
        INSERT INTO dwstage.w_property_tmp (
            row_wid,
            property_src_key,
            live_flag,
            leaf_level,
            suite,
            suite_type,
            building,
            floor,
            floor_src_key,
            suite_src_key,
            building_src_key,
            property_type,
            property_code,
            property_name,
            address1,
            address2,
            city,
            state,
            country,
            zip_postal_code,
            acquired_date,
            legal_entity,
            longitude,
            latitude,
            same_store,
            domestic_intrl,
            stabilization_date,
            stabilized_current_year,
            stabilized_next_year,
            disposition_date,
            global_market,
            market,
            region,
            ownership_type,
            leased_owned,
            source_currency_property,
            hris_division,
            elt,
            division,
            entity_type,
            country_code,
            ownership_percent,
            portfolio_ownership_percentage,
            line_of_business,
            property_manager,
            data_center_manager,
            externally_reported,
            regional_manager,
            entity_parent,
            campus,
            director,
            real_estate_manager,
            assistant_rem,
            property_assistant,
            site_code,
            formally_known_as_site_code,
            asset_manager,
            sap_warehouse_code,
            geographic_division,
            LEGAL_ENTITY_NAME,
            reported_region,
            reported_market,
            locked,
            locked_timestamp,
            snapshot_date,
            created_on_dt,
            changed_on_dt,
            etl_update_dt,
            etl_insert_dt,
            etl_proc_wid,
            datasource,
            unit_type_src_key,
            unit_src_key,
            unit_type,
            unit,
            unit_desc,
            unit_status,
            master_site_code,
            snapshot_period,
            legacy_src_key
        )
            SELECT
                rownum row_wid,
                BUS_VCUBEDIMPROPERTY.hproperty                   property_src_key,
                BUS_VCUBEDIMPROPERTY.live                        live_flag,
                BUS_VCUBEDIMPROPERTY.leaflevel                   leaf_level,
                BUS_VCUBEDIMPROPERTY.ssuite                      suite,
                NULL suite_type,
                BUS_VCUBEDIMPROPERTY.spod                        building,
                NULL floor,
                NULL floor_src_key,
                d.hsuite                      suite_src_key,
                d.hpod                        building_src_key,
                BUS_VCUBEDIMPROPERTY.propertytype                property_type,
                BUS_VCUBEDIMPROPERTY.sproperty                   property_code,
                BUS_VCUBEDIMPROPERTY.property                    property_name,
                BUS_VCUBEDIMPROPERTY.address                     address1,
                saddr2                      address2,
                BUS_VCUBEDIMPROPERTY.city                        city,
                BUS_VCUBEDIMPROPERTY.state                       state,
                BUS_VCUBEDIMPROPERTY.country                     country,
                d.zippostalcode               zip_postal_code,
                BUS_VCUBEDIMPROPERTY.acquired                    acquired_date,
                trim(ucode)                legal_entity,
                d.longitude                   longitude,
                d.latitude                    latitude,
                BUS_VCUBEDIMPROPERTY.samestore                   same_store,
                BUS_VCUBEDIMPROPERTY.domesticintrl               domestic_intrl,
                BUS_VCUBEDIMPROPERTY.stabilizationdate           stabilization_date,
                BUS_VCUBEDIMPROPERTY.stabilizedcurrentyear       stabilized_current_year,
                BUS_VCUBEDIMPROPERTY.stabilizednextyear          stabilized_next_year,
                BUS_VCUBEDIMPROPERTY.dispositiondate             disposition_date,
                BUS_VCUBEDIMPROPERTY.GLOBALMARKET                global_market,
                BUS_VCUBEDIMPROPERTY.market                    market,
                BUS_VCUBEDIMPROPERTY.region                    region,
                BUS_VCUBEDIMPROPERTY.ownershiptype             ownership_type,
                BUS_VCUBEDIMPROPERTY.leasedowned               leased_owned,
                BUS_VCUBEDIMPROPERTY.sourcecurrencyproperty    source_currency_property,
                BUS_VCUBEDIMPROPERTY.hrisdivision                hris_division,
                BUS_VCUBEDIMPROPERTY.elt                       elt,
                BUS_VCUBEDIMPROPERTY.division                  division,
                BUS_VCUBEDIMPROPERTY.entitytype                  entity_type,
                case when to_char(BUS_VCUBEDIMPROPERTY.country) = 'United States' then 'US' else to_char(BUS_VCUBEDIMPROPERTY.countrycode)   end              country_code,
                BUS_VCUBEDIMPROPERTY.ownershippercent            ownership_percent,
                BUS_VCUBEDIMPROPERTY.ownershippercentportfolio   portfolio_ownership_percentage,
                BUS_VCUBEDIMPROPERTY.businessunit                line_of_business,
                NULL property_manager,
                BUS_VCUBEDIMPROPERTY.datacentermanager           data_center_manager,
                BUS_VCUBEDIMPROPERTY.externallyreported          externally_reported,
                regional_manager      regional_manager,
                BUS_VCUBEDIMPROPERTY.entityparent                entity_parent,
                BUS_VCUBEDIMPROPERTY.campus                    campus,
                BUS_VCUBEDIMPROPERTY.director                director,
                BUS_VCUBEDIMPROPERTY.realestatemanager                         real_estate_manager,
                BUS_VCUBEDIMPROPERTY.assistantrem                assistant_rem,
                BUS_VCUBEDIMPROPERTY.propertyassistant           property_assistant,
                BUS_VCUBEDIMPROPERTY.sitecode                    site_code,
                BUS_VCUBEDIMPROPERTY.formallyknownassitecode     formally_known_as_site_code,
                BUS_VCUBEDIMPROPERTY.assetmanager                asset_manager,
                BUS_VCUBEDIMPROPERTY.sapwarehousecode            sap_warehouse_code,
                BUS_VCUBEDIMPROPERTY.geographicdivision          geographic_division,
                trim(o.ulastname)               LEGAL_ENTITY_NAME,
                BUS_VCUBEDIMPROPERTY.externalreportingregion     reported_region,
                BUS_VCUBEDIMPROPERTY.externalreportingmarket     reported_market,
                1                      locked,
                NULL locked_timestamp,
                to_date('210001'||'01','yyyymmdd')                    snapshot_date,
                d.datecreatedw                created_on_dt,
                d.datemodifydw                changed_on_dt,
                sysdate                     etl_update_dt,
                sysdate                     etl_insert_dt,
                - 1 etl_proc_wid,
                'HISTORY LOAD' datasource,
                NULL unit_type_src_key,
                d.hunit                       unit_src_key,
                BUS_VCUBEDIMPROPERTY.unittype                    unit_type,
                BUS_VCUBEDIMPROPERTY.sunit                       unit,
                (SELECT MAX(TRIM(sdesc)) FROM ods.yardi_unittype WHERE lower(TRIM(scode)) = lower(TRIM(BUS_VCUBEDIMPROPERTY.unittype)) ) unit_desc,
                BUS_VCUBEDIMPROPERTY.unitstatus                  unit_status,
                BUS_VCUBEDIMPROPERTY.mastersitecode            master_site_code,
                '210001' snapshot_period,
                d.propertysk                  legacy_src_key
            FROM
                msdwprd.bus_dimproperty d
                inner join msdwprd.BUS_VCUBEDIMPROPERTY on d.PROPERTYSK = BUS_VCUBEDIMPROPERTY.PROPERTYSK and d.PROPERTYSK > 0 
                LEFT JOIN ods.vw_property_lookup    pl ON d.hproperty = pl.hmy
                left join ods.yardi_owner o on o.HMYPERSON = d.hLegalEntity
                where BUS_VCUBEDIMPROPERTY.PROPERTYSK in 
                (
                    select SUPPLEMENTAL_VCUBEFACTLEASEACTIVITY.PROPERTYid  from msdwprd.SUPPLEMENTAL_VCUBEFACTLEASEACTIVITY 
                    inner join msdwprd.SUPPLEMENTAL_FACTLEASEACTIVITY 
                       on locked = 1 and SUPPLEMENTAL_FACTLEASEACTIVITY.leaseactivitysk = SUPPLEMENTAL_VCUBEFACTLEASEACTIVITY.leaseactivitysk

                );

            commit;


            -- clean up previous history
            delete from dw.w_property_d where SUBSTR(DATASOURCE,1,12) = 'HISTORY LOAD'
                 and nvl(row_wid,-999) in (select nvl(property_wid,-999) from w_lease_activity_f where SUBSTR(DATASOURCE,1,12) = 'HISTORY LOAD');


            commit;

            delete from dw.w_property_d where SUBSTR(DATASOURCE,1,12) = 'HISTORY LOAD'
                and nvl(legacy_src_key,-999) in (select nvl(legacy_src_key,-999) from dwstage.w_property_tmp);


            commit;

            -- merge the stage table data to dw table
            MERGE INTO dw.w_property_d adw
            USING dwstage.w_property_tmp msdw 
            ON ( msdw.legacy_src_key = adw.legacy_src_key 
            and msdw.datasource = adw.datasource
            and SUBSTR(adw.DATASOURCE,1,12) = 'HISTORY LOAD' )
            WHEN NOT MATCHED THEN
            /* if they do not exist then insert them  */
            INSERT 
            (
                row_wid,
                property_src_key,
                live_flag,
                leaf_level,
                suite,
                suite_type,
                building,
                floor,
                floor_src_key,
                suite_src_key,
                building_src_key,
                property_type,
                property_code,
                property_name,
                address1,
                address2,
                city,
                state,
                country,
                zip_postal_code,
                acquired_date,
                legal_entity,
                longitude,
                latitude,
                same_store,
                domestic_intrl,
                stabilization_date,
                stabilized_current_year,
                stabilized_next_year,
                disposition_date,
                global_market,
                market,
                region,
                ownership_type,
                leased_owned,
                source_currency_property,
                hris_division,
                elt,
                division,
                entity_type,
                country_code,
                ownership_percent,
                portfolio_ownership_percentage,
                line_of_business,
                property_manager,
                data_center_manager,
                externally_reported,
                regional_manager,
                entity_parent,
                campus,
                director,
                real_estate_manager,
                assistant_rem,
                property_assistant,
                site_code,
                formally_known_as_site_code,
                asset_manager,
                sap_warehouse_code,
                geographic_division,
                LEGAL_ENTITY_NAME,
                reported_region,
                reported_market,
                locked,
                locked_timestamp,
                snapshot_date,
                created_on_dt,
                changed_on_dt,
                etl_update_dt,
                etl_insert_dt,
                etl_proc_wid,
                datasource,
                unit_type_src_key,
                unit_src_key,
                unit_type,
                unit,
                unit_desc,
                unit_status,
                master_site_code,
                snapshot_period,
                legacy_src_key
            )
            values
            (
                w_property_d_seq.NEXTVAL,
                msdw.property_src_key,
                msdw.live_flag,
                msdw.leaf_level,
                msdw.suite,
                msdw.suite_type,
                msdw.building,
                msdw.floor,
                msdw.floor_src_key,
                msdw.suite_src_key,
                msdw.building_src_key,
                msdw.property_type,
                msdw.property_code,
                msdw.property_name,
                msdw.address1,
                msdw.address2,
                msdw.city,
                msdw.state,
                msdw.country,
                msdw.zip_postal_code,
                msdw.acquired_date,
                msdw.legal_entity,
                msdw.longitude,
                msdw.latitude,
                msdw.same_store,
                msdw.domestic_intrl,
                msdw.stabilization_date,
                msdw.stabilized_current_year,
                msdw.stabilized_next_year,
                msdw.disposition_date,
                msdw.global_market,
                msdw.market,
                msdw.region,
                msdw.ownership_type,
                msdw.leased_owned,
                msdw.source_currency_property,
                msdw.hris_division,
                msdw.elt,
                msdw.division,
                msdw.entity_type,
                msdw.country_code,
                msdw.ownership_percent,
                msdw.portfolio_ownership_percentage,
                msdw.line_of_business,
                msdw.property_manager,
                msdw.data_center_manager,
                msdw.externally_reported,
                msdw.regional_manager,
                msdw.entity_parent,
                msdw.campus,
                msdw.director,
                msdw.real_estate_manager,
                msdw.assistant_rem,
                msdw.property_assistant,
                msdw.site_code,
                msdw.formally_known_as_site_code,
                msdw.asset_manager,
                msdw.sap_warehouse_code,
                msdw.geographic_division,
                msdw.LEGAL_ENTITY_NAME,
                msdw.reported_region,
                msdw.reported_market,
                msdw.locked,
                msdw.locked_timestamp,
                msdw.snapshot_date,
                msdw.created_on_dt,
                msdw.changed_on_dt,
                msdw.etl_update_dt,
                msdw.etl_insert_dt,
                msdw.etl_proc_wid,
                msdw.datasource,
                msdw.unit_type_src_key,
                msdw.unit_src_key,
                msdw.unit_type,
                msdw.unit,
                msdw.unit_desc,
                msdw.unit_status,
                msdw.master_site_code,
                msdw.snapshot_period,
                msdw.legacy_src_key
            );

            commit;


	END property;


    PROCEDURE lease_activity_dim IS
    BEGIN
        EXECUTE IMMEDIATE 'alter session force parallel query parallel 8';
        DELETE FROM dwstage.w_lease_activity_d_tmp;

        COMMIT;

        INSERT INTO DWSTAGE.W_LEASE_ACTIVITY_D_TMP
        (
            ROW_WID,
            LEASE_ACTIVITY_SRC_KEY,
            SNAPSHOT_PERIOD,
            SNAPSHOT_DATE,
            CONTRACT_NUMBER,
            LEASE_REPORTING_TYPE,
            TRANSACTION_TYPE,
            LEASE_TYPE,
            ACTIVITY_STATUS,
            LEASE_DESCRIPTION,
            LEASE_COMMENTS,
            REPORT_DATE,
            START_DATE,
            END_DATE,
            SIGN_DATE,
            START_DATE_WID,
            END_DATE_WID,
            SIGN_DATE_WID,
            LEASE_COMMENCEMENT_DATE,
            ORIGINAL_TERM_EXPIRATION_DATE,
            EXPIRATION_DATE,
            CONTRACTUAL_START_DATE,
            SUITES,
            RENEWAL_TYPE,
            CONTRACTUAL_RENT_START_DATE,
            RENT_START_DATE,
            ORIGINAL_TERM_END_DATE,
            REPORTED_FLAG,
            RENT_TREND_EXCLUDED_FLAG,
            NON_LEASE_DEAL,
            COMMENCEMENT_DATE_STATUS,
            RETENTION_TYPE,
            GENERATION,
            CASH__RENT__STABILIZES,
            RELEASE_FLAG,
            PUBLISHED_FLAG,
            PRODUCT_TYPE,
            CROSS_CONNECT_TYPE,
            BUSINESS_UNIT,
            TELX_CASE_NUMBER,
            LEASE_CURRENCY_CODE,
            LEASE_EXCHANGE_RATE,
            SIGN_PERIOD,
            REPORT_PERIOD,
            COMMENCEMENT_PERIOD,
            SIGN_YEAR,
            REPORT_YEAR,
            COMMENCEMENT_YEAR,
            REDUNDANCY,
            CREATED_ON_DT,
            CHANGED_ON_DT,
            ETL_UPDATE_DT,
            ETL_INSERT_DT,
            ETL_PROC_WID,
            DATASOURCE,
            SOURCE,
            ORDER_LINE_NUMBER,
            PUBLISHED_LEASE_IDENTIFIER,
            CUSTOMER_TYPE,
            YARDI_TCODE,
            UNIT_TYPE,
            LEGACY_SRC_KEY,
            UNIT_TYPE_SRC_KEY
        )
        SELECT 
            rownum row_wid,
            supplemental_vcubedimleaseactivity.LEASEACTIVITYKEY          lease_activity_src_key,
            to_char(to_date(supplemental_vcubedimleaseactivity.signdate,'mm/dd/yyyy'), 'YYYYMM')       snapshot_period,
            trunc(to_date(supplemental_vcubedimleaseactivity.signdate,'mm/dd/yyyy'),'mm')              snapshot_date,
            supplemental_vcubedimleaseactivity.CONTRACTNUMBER           contract_number,
            supplemental_vcubedimleaseactivity.leasereportingtype       lease_reporting_type,
            initcap(supplemental_vcubedimleaseactivity.transactiontype)          transaction_type,
            supplemental_vcubedimleaseactivity.leasetype                lease_type,
            supplemental_vcubedimleaseactivity.activitystatus           activity_status,
            supplemental_vcubedimleaseactivity.description              lease_description,
            supplemental_vcubedimleaseactivity.comments                 lease_comments,
            case when length(supplemental_dimleaseactivity.reportdatekey) = 8 then to_date(supplemental_dimleaseactivity.reportdatekey,'yyyymmdd') else null end           report_date,
            to_date(supplemental_vcubedimleaseactivity.startdate,'mm/dd/yyyy')               start_date,
            to_date(supplemental_vcubedimleaseactivity.enddate,'mm/dd/yyyy')                  end_date,
            to_date(supplemental_vcubedimleaseactivity.signdate,'mm/dd/yyyy')                  sign_date,
            to_char(to_date(supplemental_vcubedimleaseactivity.startdate,'mm/dd/yyyy'),'yyyymmdd')                  start_date_wid,
            to_char(to_date(supplemental_vcubedimleaseactivity.enddate,'mm/dd/yyyy'),'yyyymmdd')                  end_date_wid,
            to_char(to_date(supplemental_vcubedimleaseactivity.signdate,'mm/dd/yyyy'),'yyyymmdd')                 sign_date_wid,
            to_date(supplemental_vcubedimleaseactivity.startdate,'mm/dd/yyyy')                 lease_commencement_date,
            supplemental_vcubedimleaseactivity.originaltermend          original_term_expiration_date,
            to_date(supplemental_vcubedimleaseactivity.enddate,'mm/dd/yyyy')                   expiration_date,
            CASE WHEN supplemental_vcubedimleaseactivity.contractualstartdate <> '(Unknown)' and instr(supplemental_vcubedimleaseactivity.contractualstartdate,'-') > 0 then to_date(supplemental_vcubedimleaseactivity.contractualstartdate,'yyyy-mm-dd') 
              WHEN supplemental_vcubedimleaseactivity.contractualstartdate <> '(Unknown)' and instr(supplemental_vcubedimleaseactivity.contractualstartdate,'/') > 0 then to_date(supplemental_vcubedimleaseactivity.contractualstartdate,'mm/dd/yyyy')
              else null end contractual_start_date,
            supplemental_vcubedimleaseactivity.suites                   suites,
            supplemental_vcubedimleaseactivity.renewaltype              renewal_type,
            supplemental_vcubedimleaseactivity.contractualrentstart     contractual_rent_start_date,
            supplemental_vcubedimleaseactivity.rentstart                rent_start_date,
            supplemental_vcubedimleaseactivity.originaltermend          original_term_end_date,
            supplemental_vcubedimleaseactivity.reported                 reported_flag,
            supplemental_vcubedimleaseactivity.renttrendexcluded        rent_trend_excluded_flag,
            supplemental_vcubedimleaseactivity.nonleasedeal             non_lease_deal,
            supplemental_vcubedimleaseactivity.commencementdatestatus   commencement_date_status,
            supplemental_vcubedimleaseactivity.retentiontype            retention_type,
            supplemental_vcubedimleaseactivity.generation               generation,
            supplemental_vcubedimleaseactivity.cash_rent_stabilizes     cash__rent__stabilizes,
            supplemental_vcubedimleaseactivity.release                  release_flag,
            published                published_flag,
            supplemental_vcubedimleaseactivity.producttype              product_type,
            supplemental_vcubedimleaseactivity.crossconnecttype         cross_connect_type,
            supplemental_vcubedimleaseactivity.businessunit             business_unit,
            supplemental_vcubedimleaseactivity.telxcasenumber           telx_case_number,
            currencycode             lease_currency_code,
            exchangerate             lease_exchange_rate,
            supplemental_vcubedimleaseactivity.signdatekey              sign_period,
            supplemental_dimleaseactivity.reportdatekey            report_period,
            CASE WHEN supplemental_vcubedimleaseactivity.startdate <> '(Unknown)' 
                 THEN to_char(to_date(supplemental_vcubedimleaseactivity.startdate, 'mm/DD/yyyy'), 'YYYYMM') ELSE NULL END commencement_period,
            supplemental_vcubedimleaseactivity.signdatekey              sign_year,
            supplemental_dimleaseactivity.reportdatekey            report_year,
            CASE WHEN supplemental_vcubedimleaseactivity.startdate <> '(Unknown)' 
                 THEN to_char(to_date(supplemental_vcubedimleaseactivity.startdate, 'MM/DD/yyyy'), 'YYYY') ELSE NULL END commencement_year,
            supplemental_vcubedimleaseactivity.redundancy redundancy,
            supplemental_dimleaseactivity.datecreatedw             created_on_dt,
            supplemental_dimleaseactivity.datemodifydw             changed_on_dt,
            sysdate                  etl_update_dt,
            sysdate                  etl_insert_dt,
            - 1 etl_proc_wid,
            'HISTORY LOAD' datasource,
            supplemental_vcubedimleaseactivity.source                   source,
            supplemental_vcubedimleaseactivity.orderlinenumber          order_line_number,
            NULL published_lease_identifier,
            supplemental_vcubedimleaseactivity.customertype             customer_type,
            supplemental_vcubedimleaseactivity.yarditcode               yardi_tcode,
            supplemental_vcubedimleaseactivity.unittype                 unit_type,
            supplemental_vcubedimleaseactivity.leaseactivitysk          legacy_src_key,
            NVL(to_char(id),'-1') unit_type_src_key
        FROM
            msdwprd.supplemental_vcubedimleaseactivity
            inner join msdwprd.supplemental_dimleaseactivity on supplemental_dimleaseactivity.leaseactivitysk = supplemental_vcubedimleaseactivity.leaseactivitysk
                and supplemental_vcubedimleaseactivity.leaseactivitysk > 0
            left join ods.sfdc_unittype on trim(name)=  supplemental_vcubedimleaseactivity.unittype
            where supplemental_vcubedimleaseactivity.leaseactivitysk in 
            (
            select SUPPLEMENTAL_VCUBEFACTLEASEACTIVITY.leaseactivitysk  from msdwprd.SUPPLEMENTAL_VCUBEFACTLEASEACTIVITY 
                    inner join msdwprd.SUPPLEMENTAL_FACTLEASEACTIVITY 
                       on locked = 1 and SUPPLEMENTAL_FACTLEASEACTIVITY.leaseactivitysk = SUPPLEMENTAL_VCUBEFACTLEASEACTIVITY.leaseactivitysk
            );

            commit;



            -- clean up previous history
            delete from dw.w_lease_activity_d where SUBSTR(DATASOURCE,1,12) = 'HISTORY LOAD' ;


            commit;

            -- merge the stage table data to dw table
            MERGE INTO dw.w_lease_activity_d adw
            USING dwstage.w_lease_activity_d_tmp msdw 
            ON ( msdw.legacy_src_key = adw.legacy_src_key 
            and msdw.datasource = adw.datasource
            and SUBSTR(adw.DATASOURCE,1,12) = 'HISTORY LOAD' )
            WHEN NOT MATCHED THEN
            /* if they do not exist then insert them  */
            INSERT 
            (
                ROW_WID,
                LEASE_ACTIVITY_SRC_KEY,
                SNAPSHOT_PERIOD,
                SNAPSHOT_DATE,
                CONTRACT_NUMBER,
                LEASE_REPORTING_TYPE,
                TRANSACTION_TYPE,
                LEASE_TYPE,
                ACTIVITY_STATUS,
                LEASE_DESCRIPTION,
                LEASE_COMMENTS,
                REPORT_DATE,
                START_DATE,
                END_DATE,
                SIGN_DATE,
                START_DATE_WID,
                END_DATE_WID,
                SIGN_DATE_WID,
                LEASE_COMMENCEMENT_DATE,
                ORIGINAL_TERM_EXPIRATION_DATE,
                EXPIRATION_DATE,
                CONTRACTUAL_START_DATE,
                SUITES,
                RENEWAL_TYPE,
                CONTRACTUAL_RENT_START_DATE,
                RENT_START_DATE,
                ORIGINAL_TERM_END_DATE,
                REPORTED_FLAG,
                RENT_TREND_EXCLUDED_FLAG,
                NON_LEASE_DEAL,
                COMMENCEMENT_DATE_STATUS,
                RETENTION_TYPE,
                GENERATION,
                CASH__RENT__STABILIZES,
                RELEASE_FLAG,
                PUBLISHED_FLAG,
                PRODUCT_TYPE,
                CROSS_CONNECT_TYPE,
                BUSINESS_UNIT,
                TELX_CASE_NUMBER,
                LEASE_CURRENCY_CODE,
                LEASE_EXCHANGE_RATE,
                SIGN_PERIOD,
                REPORT_PERIOD,
                COMMENCEMENT_PERIOD,
                SIGN_YEAR,
                REPORT_YEAR,
                COMMENCEMENT_YEAR,
                REDUNDANCY,
                CREATED_ON_DT,
                CHANGED_ON_DT,
                ETL_UPDATE_DT,
                ETL_INSERT_DT,
                ETL_PROC_WID,
                DATASOURCE,
                SOURCE,
                ORDER_LINE_NUMBER,
                PUBLISHED_LEASE_IDENTIFIER,
                CUSTOMER_TYPE,
                YARDI_TCODE,
                UNIT_TYPE,
                LEGACY_SRC_KEY,
                UNIT_TYPE_SRC_KEY
            )
            values 
            (
                W_LEASE_ACTIVITY_D_SEQ.NEXTVAL,
                msdw.LEASE_ACTIVITY_SRC_KEY,
                msdw.SNAPSHOT_PERIOD,
                msdw.SNAPSHOT_DATE,
                msdw.CONTRACT_NUMBER,
                msdw.LEASE_REPORTING_TYPE,
                msdw.TRANSACTION_TYPE,
                msdw.LEASE_TYPE,
                msdw.ACTIVITY_STATUS,
                msdw.LEASE_DESCRIPTION,
                msdw.LEASE_COMMENTS,
                msdw.REPORT_DATE,
                msdw.START_DATE,
                msdw.END_DATE,
                msdw.SIGN_DATE,
                msdw.START_DATE_WID,
                msdw.END_DATE_WID,
                msdw.SIGN_DATE_WID,
                msdw.LEASE_COMMENCEMENT_DATE,
                msdw.ORIGINAL_TERM_EXPIRATION_DATE,
                msdw.EXPIRATION_DATE,
                msdw.CONTRACTUAL_START_DATE,
                msdw.SUITES,
                msdw.RENEWAL_TYPE,
                msdw.CONTRACTUAL_RENT_START_DATE,
                msdw.RENT_START_DATE,
                msdw.ORIGINAL_TERM_END_DATE,
                msdw.REPORTED_FLAG,
                msdw.RENT_TREND_EXCLUDED_FLAG,
                msdw.NON_LEASE_DEAL,
                msdw.COMMENCEMENT_DATE_STATUS,
                msdw.RETENTION_TYPE,
                msdw.GENERATION,
                msdw.CASH__RENT__STABILIZES,
                msdw.RELEASE_FLAG,
                msdw.PUBLISHED_FLAG,
                msdw.PRODUCT_TYPE,
                msdw.CROSS_CONNECT_TYPE,
                msdw.BUSINESS_UNIT,
                msdw.TELX_CASE_NUMBER,
                msdw.LEASE_CURRENCY_CODE,
                msdw.LEASE_EXCHANGE_RATE,
                msdw.SIGN_PERIOD,
                msdw.REPORT_PERIOD,
                msdw.COMMENCEMENT_PERIOD,
                msdw.SIGN_YEAR,
                msdw.REPORT_YEAR,
                msdw.COMMENCEMENT_YEAR,
                msdw.REDUNDANCY,
                msdw.CREATED_ON_DT,
                msdw.CHANGED_ON_DT,
                msdw.ETL_UPDATE_DT,
                msdw.ETL_INSERT_DT,
                msdw.ETL_PROC_WID,
                msdw.DATASOURCE,
                msdw.SOURCE,
                msdw.ORDER_LINE_NUMBER,
                msdw.PUBLISHED_LEASE_IDENTIFIER,
                msdw.CUSTOMER_TYPE,
                msdw.YARDI_TCODE,
                msdw.UNIT_TYPE,
                msdw.LEGACY_SRC_KEY,
                msdw.UNIT_TYPE_SRC_KEY
            );

            commit;

            update dw.w_lease_activity_d
            set LOCK_FLAG = 1 
            where datasource = 'HISTORY LOAD';

            commit;

	END lease_activity_dim;

    /*
    -------------------------
    Load Lease Activity Fact 
    -------------------------
    */

    PROCEDURE lease_activity_fact IS
    BEGIN
        EXECUTE IMMEDIATE 'alter session force parallel query parallel 8';
        DELETE FROM dwstage.w_lease_activity_f_tmp;

        COMMIT;

        INSERT INTO dwstage.w_lease_activity_f_tmp 
        (
                customer_wid,
                property_wid,
                opportunity_wid,
                lease_activity_wid,
                lease_reporting_type,
                signed_period_date_wid,
                reported_period_date_wid,
                commencement_period_date_wid,
                contractual_total_rent,
                contractual_gaap_rent,
                total_rent,
                monthly_gaap_rent,
                expiring_last_year,
                TERM,
                kw,
                nrsf,
                contractual_term,
                rsf,
                incremental_gaap_annual_revenue,
                cash_rent_expiring_last_year,
                avg_rent_escalation,
                landlord_work,
                installation_fees,
                tenant_improvements,
                prior_gaap_rent,
                prior_last_year_cash_rent,
                contractual_incremental_rent,
                expiring_gaap_rent,
                second_year_revenue,
                first_year_revenue,
                tenant_broker_commission,
                landlord_broker_commission,
                referring_agent_commission,
                stabilized_first_year_cash_rent,
                actual_first_year_cash,
                free_rent,
                opex_equivalent,
                cross_connect_count,
                cross_connect_discount,
                net_effective_yield,
                average_yield,
                stabilized_yield,
                investment_basis,
                telx_case_number,
                opportunity_amount_native,
                opportunity_amount_usd,
                total_contractual_kw_commitment,
                total_internal_commissions,
                total_external_commissions,
                total_lease_cost,
                load_factor,
                lock_flag,
                lock_timestamp,
                created_on_dt,
                changed_on_dt,
                etl_update_dt,
                etl_insert_dt,
                etl_proc_wid,
                datasource,
                ID,
                snapshot_period,
                legacy_src_key
            )
            SELECT
                nvl(w_customer_d.row_wid,-1) customer_wid ,
                -1 /*nvl(w_property_d.row_wid,-1) */ property_wid ,
                -1 opportunity_wid ,
                nvl(w_lease_activity_d.row_wid,-1)  lease_activity_wid ,
                lf.leasereportingtype lease_reporting_type ,
                lf.signdatekey signed_period_date_wid ,
                lf.reportdatekey reported_period_date_wid ,
                lf.STARTDATEKEY commencement_period_date_wid ,
                nvl(lf.contractualtotalrent,0) contractual_total_rent ,
                nvl(lf.contractualgaaprent,0) contractual_gaap_rent ,
                nvl(lf.totalrent,0) total_rent ,
                nvl(lf.gaaprent,0)/ 12 monthly_gaap_rent ,
                --nvl(nvl(lf.contractualtotalrent,0)/nullif(lf.TERM,0),0) monthly_gaap_rent,
                lf.expiringlastyear expiring_last_year ,
                lf.TERM TERM ,
                nvl(lf.kw,0) kw ,
                nvl(lf.nrsf,0) nrsf ,
                lf.contractualterm contractual_term ,
                lf.rsf rsf ,
                nvl(lf.incrementalgaapannualrevenue,0) incremental_gaap_annual_revenue ,
                lf.cashrentexpiringlastyear cash_rent_expiring_last_year ,
                lf.avgrentescalation avg_rent_escalation ,
                lf.landlordwork landlord_work ,
                nvl(lf.installationfees,0) installation_fees ,
                lf.tenantimprovements tenant_improvements ,
                nvl(lf.priorgaaprent,0) prior_gaap_rent ,
                lf.priorlastyearcashrent prior_last_year_cash_rent ,
                lf.contractualincrementalrent contractual_incremental_rent ,
                nvl(lf.expiringgaaprent,0) expiring_gaap_rent ,
                nvl(lf.secondyearrevenue,0) second_year_revenue ,
                nvl(lf.firstyearrevenue,0) first_year_revenue ,
                nvl(lf.tenantbrokercommission,0) tenant_broker_commission ,
                nvl(lf.landlordbrokercommission,0) landlord_broker_commission ,
                nvl(lf.referringagentcommission,0) referring_agent_commission ,
                nvl(lf.stabilizedfirstyearcashrent,0) stabilized_first_year_cash_rent ,
                nvl(lf.actualfirstyearcash,0) actual_first_year_cash ,
                nvl(lf.freerent,0) free_rent ,
                lf.opexequivalent opex_equivalent ,
                nvl(lf_t.numberofcrossconnects,0) cross_connect_count ,
                nvl(lf_t.crossconnectdiscount,0) cross_connect_discount ,
                nvl(lf.neteffectiveyield,0) net_effective_yield ,
                nvl(lf.averageyield,0) average_yield ,
                nvl(lf.stabilizedyield,0) stabilized_yield ,
                lf.investmentbasis investment_basis ,
                lf_t.telxcasenumber telx_case_number ,
                nvl(lf.opportunityamount,0) opportunity_amount_native ,
                nvl(lf.opportunityamountusd,0) opportunity_amount_usd ,
                nvl(lf.totalcontractualkwcommitment,0) total_contractual_kw_commitment ,
                lf.TOTALINTERNALCOMMISSION total_internal_commissions ,
                lf.TOTALEXTERNALCOMMISSION total_external_commissions ,
                lf.TOTALLEASECOST total_lease_cost ,
                lf.loadfactor load_factor ,
                locked lock_flag ,
                NULL lock_timestamp ,
                lf_t.datecreatedw  created_on_dt ,
                lf_t.datemodifydw changed_on_dt ,
                sysdate etl_update_dt ,
                sysdate etl_insert_dt ,
                -1 etl_proc_wid ,
                'HISTORY LOAD' || '~' || lf.SOURCE datasource ,
                lf_t.leaseactivitykey ID ,
                null snapshot_period ,
                lf.leaseactivitysk legacy_src_key  
            FROM
                msdwprd.supplemental_vCubefactleaseactivity lf
                inner join msdwprd.supplemental_factleaseactivity lf_t
                  on lf_t.leaseactivitysk = lf.leaseactivitysk
                  AND lf.leaseactivitysk > 0 and locked = 1 
                LEFT JOIN w_customer_d ON SUBSTR(w_customer_d.DATASOURCE,1,12) = 'HISTORY LOAD' AND lf.customersk = w_customer_d.legacy_src_key
                -- LEFT JOIN w_property_d ON SUBSTR(w_property_d.DATASOURCE,1,12) = 'HISTORY LOAD' AND lf_t.propertysk = w_property_d.legacy_src_key
                -- and w_property_d.snapshot_period = code
                LEFT JOIN w_lease_activity_d ON SUBSTR(w_lease_activity_d.DATASOURCE,1,12) = 'HISTORY LOAD' 
                            AND lf.leaseactivitysk = w_lease_activity_d.legacy_src_key ;


        commit;

         -- clean up previous history
            delete from dw.w_lease_activity_f where SUBSTR(DATASOURCE,1,12) = 'HISTORY LOAD' ;


            commit;

            -- merge the stage table data to dw table
            MERGE INTO dw.w_lease_activity_f adw
            USING dwstage.w_lease_activity_f_tmp msdw 
            ON ( msdw.legacy_src_key = adw.legacy_src_key 
            and msdw.datasource = adw.datasource
            and SUBSTR(adw.DATASOURCE,1,12) = 'HISTORY LOAD' )
            WHEN NOT MATCHED THEN
            /* if they do not exist then insert them  */
            INSERT 
            (
                customer_wid,
                property_wid,
                opportunity_wid,
                lease_activity_wid,
                lease_reporting_type,
                signed_period_date_wid,
                reported_period_date_wid,
                commencement_period_date_wid,
                contractual_total_rent,
                contractual_gaap_rent,
                total_rent,
                monthly_gaap_rent,
                expiring_last_year,
                TERM,
                kw,
                nrsf,
                contractual_term,
                rsf,
                incremental_gaap_annual_revenue,
                cash_rent_expiring_last_year,
                avg_rent_escalation,
                landlord_work,
                installation_fees,
                tenant_improvements,
                prior_gaap_rent,
                prior_last_year_cash_rent,
                contractual_incremental_rent,
                expiring_gaap_rent,
                second_year_revenue,
                first_year_revenue,
                tenant_broker_commission,
                landlord_broker_commission,
                referring_agent_commission,
                stabilized_first_year_cash_rent,
                actual_first_year_cash,
                free_rent,
                opex_equivalent,
                cross_connect_count,
                cross_connect_discount,
                net_effective_yield,
                average_yield,
                stabilized_yield,
                investment_basis,
                telx_case_number,
                opportunity_amount_native,
                opportunity_amount_usd,
                total_contractual_kw_commitment,
                total_internal_commissions,
                total_external_commissions,
                total_lease_cost,
                load_factor,
                lock_flag,
                lock_timestamp,
                created_on_dt,
                changed_on_dt,
                etl_update_dt,
                etl_insert_dt,
                etl_proc_wid,
                datasource,
                ID,
                snapshot_period,
                legacy_src_key,
                row_wid
            )
            values
            (
                msdw.customer_wid,
                msdw.property_wid,
                msdw.opportunity_wid,
                msdw.lease_activity_wid,
                msdw.lease_reporting_type,
                msdw.signed_period_date_wid,
                msdw.reported_period_date_wid,
                msdw.commencement_period_date_wid,
                msdw.contractual_total_rent,
                msdw.contractual_gaap_rent,
                msdw.total_rent,
                msdw.monthly_gaap_rent,
                msdw.expiring_last_year,
                msdw.TERM,
                msdw.kw,
                msdw.nrsf,
                msdw.contractual_term,
                msdw.rsf,
                msdw.incremental_gaap_annual_revenue,
                msdw.cash_rent_expiring_last_year,
                msdw.avg_rent_escalation,
                msdw.landlord_work,
                msdw.installation_fees,
                msdw.tenant_improvements,
                msdw.prior_gaap_rent,
                msdw.prior_last_year_cash_rent,
                msdw.contractual_incremental_rent,
                msdw.expiring_gaap_rent,
                msdw.second_year_revenue,
                msdw.first_year_revenue,
                msdw.tenant_broker_commission,
                msdw.landlord_broker_commission,
                msdw.referring_agent_commission,
                msdw.stabilized_first_year_cash_rent,
                msdw.actual_first_year_cash,
                msdw.free_rent,
                msdw.opex_equivalent,
                msdw.cross_connect_count,
                msdw.cross_connect_discount,
                msdw.net_effective_yield,
                msdw.average_yield,
                msdw.stabilized_yield,
                msdw.investment_basis,
                msdw.telx_case_number,
                msdw.opportunity_amount_native,
                msdw.opportunity_amount_usd,
                msdw.total_contractual_kw_commitment,
                msdw.total_internal_commissions,
                msdw.total_external_commissions,
                msdw.total_lease_cost,
                msdw.load_factor,
                msdw.lock_flag,
                msdw.lock_timestamp,
                msdw.created_on_dt,
                msdw.changed_on_dt,
                msdw.etl_update_dt,
                msdw.etl_insert_dt,
                msdw.etl_proc_wid,
                msdw.datasource,
                msdw.ID,
                msdw.snapshot_period,
                msdw.legacy_src_key,
                W_LEASE_ACTIVITY_F_SEQ.nextval
            );

            commit;

            update w_lease_activity_f 
            set product_wid = (select w_product_d.row_wid from w_product_d
            join w_lease_activity_d on unit_type = ITEM_NUMBER and INTEGRATION_ID = unit_type_src_key 
            and w_lease_activity_f.lease_activity_wid = w_lease_activity_d.row_wid
            and w_lease_activity_d.datasource = 'HISTORY LOAD' and w_product_d.datasource = 'SFDC' )
            where substr(w_lease_activity_f.datasource,1,12) = 'HISTORY LOAD';

            commit;

            merge into w_lease_activity_f 
            using (
            SELECT distinct property_code, row_wid, LEASEACTIVITYSK FROM W_property_D join msdwprd.supplemental_vcubefactleaseactivity on SPROPERTY = property_code
            and leaf_level = 'Property' and live_flag = 1 
            ) p
            on ( p.LEASEACTIVITYSK =  w_lease_activity_f.LEGACY_SRC_KEY and  w_lease_activity_f.datasource like 'HISTORY LOAD%') 
            when matched then update
            SET property_wid  = p.row_wid ;

            commit;


            merge into DW.w_lease_activity_f
            using (select OPEXPERKW, OPEXLESSUTILITIESPERKW, LEASEACTIVITYSK from MSDWPRD.supplemental_vcubefactleaseactivity) msdw
            on ( SUBSTR(w_lease_activity_f.DATASOURCE,1,12)= 'HISTORY LOAD' and msdw.LEASEACTIVITYSK = w_lease_activity_f.LEGACY_SRC_KEY ) 
            WHEN MATCHED THEN UPDATE set 
            OPEX_PER_KW = OPEXPERKW,
            OPEX_LESS_UTILITIES_PER_KW = OPEXLESSUTILITIESPERKW
            ;

            commit ;

            UPDATE 
            DW.W_LEASE_ACTIVITY_F
            SET SIGNED_PERIOD_DATE_WID = -1 WHERE SIGNED_PERIOD_DATE_WID = 0 ;

            COMMIT;



            UPDATE 
            DW.W_LEASE_ACTIVITY_F
            SET COMMENCEMENT_PERIOD_DATE_WID = -1 WHERE COMMENCEMENT_PERIOD_DATE_WID =  0;


            COMMIT;



     END lease_activity_fact;   

    /*
    -------------------------
    Load LA Subject area 
    -------------------------
    */

	 PROCEDURE Load_la_subject_area IS
     BEGIN
			pkg_history_load_la.customers;
			--pkg_history_load_la.property;
			pkg_history_load_la.lease_activity_dim;
			pkg_history_load_la.lease_activity_fact;

	 end Load_la_subject_area;


END pkg_history_load_la;

/

  GRANT EXECUTE ON "DW"."PKG_HISTORY_LOAD_LA" TO "SVC_ODI";
  GRANT DEBUG ON "DW"."PKG_HISTORY_LOAD_LA" TO "DW_RO";
