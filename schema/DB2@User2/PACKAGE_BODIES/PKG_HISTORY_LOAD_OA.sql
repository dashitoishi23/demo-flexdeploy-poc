--------------------------------------------------------
--  DDL for Package Body PKG_HISTORY_LOAD_OA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DW"."PKG_HISTORY_LOAD_OA" AS


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
                trunc(to_date(CODE||'01','yyyymmdd'), 'MM') EFFECTIVE_START_DATE,
                trunc( last_day(to_date(CODE||'01','yyyymmdd'))) EFFECTIVE_END_DATE,
                'N' CURRENT_FLAG,
                sfdc_account.type  CUSTOMER_TYPE,
                ACCOUNT_TIER__C CUSTOMER_TIER,
                dbo_vCubeDimCustomer.L1GOLDENCUSTOMERNAME GOLDEN_CUSTOMER_NAME
    FROM
                msdwprd.dbo_vCubeDimCustomer
                left join msdwprd.dbo_DimCustomer on dbo_vCubeDimCustomer.customersk = dbo_DimCustomer.customersk
                inner join msdwprd.oa_vCubeFactOccupancy on dbo_vCubeDimCustomer.customersk = oa_vCubeFactOccupancy.customersk 
                    and dbo_vCubeDimCustomer.customersk > 0 and LEAFLEVEL = 'Unit'
                inner join msdwprd.SHAREPOINT_LOCKEDLEASES  on LOCKEDASSIGNMENT = 'Locked / No changes will occur'
                    and ( substr(DATESK,1,6) = CODE )  
                left join ods.sfdc_account   on sfdc_account.id = dbo_vCubeDimCustomer.L2PARENTCUSTOMERCODE;

        COMMIT;

        --- Clean up any previously loaded history dataset
        delete from dw.w_customer_d where SUBSTR(DATASOURCE,1,12) = 'HISTORY LOAD'
            and nvl(row_wid,-999) in (select nvl(customer_wid,-999) from w_OCCUPANCY_f where SUBSTR(DATASOURCE,1,12) = 'HISTORY LOAD');

        COMMIT; 

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
            GOLDEN_CUSTOMER_NAME )
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
              msdw.legacy_src_key ,
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
    Property Dimension Lookup 
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
                distinct 
                null  row_wid,
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
                to_date(CODE||'01','yyyymmdd')                    snapshot_date,
                d.datecreatedw                created_on_dt,
                d.datemodifydw                changed_on_dt,
                sysdate                     etl_update_dt,
                sysdate                     etl_insert_dt,
                - 1 etl_proc_wid,
                'HISTORY LOAD' datasource,
                NVL(to_char(yardi_unittype.hmy),'(Not Assigned)') unit_type_src_key,
                d.hunit                       unit_src_key,
                BUS_VCUBEDIMPROPERTY.unittype                    unit_type,
                BUS_VCUBEDIMPROPERTY.sunit                       unit,
                (SELECT MAX(TRIM(sdesc)) FROM ods.yardi_unittype WHERE lower(TRIM(scode)) = lower(TRIM(BUS_VCUBEDIMPROPERTY.unittype)) ) unit_desc,
                BUS_VCUBEDIMPROPERTY.unitstatus                  unit_status,
                BUS_VCUBEDIMPROPERTY.mastersitecode            master_site_code,
                CODE snapshot_period,
                d.propertysk                  legacy_src_key
            FROM
                msdwprd.bus_dimproperty d
                inner join msdwprd.BUS_VCUBEDIMPROPERTY on d.PROPERTYSK = BUS_VCUBEDIMPROPERTY.PROPERTYSK and d.PROPERTYSK > 0 
                inner join msdwprd.oa_vCubeFactOccupancy on BUS_VCUBEDIMPROPERTY.PROPERTYSK = oa_vCubeFactOccupancy.PROPERTYSK  and oa_vCubeFactOccupancy.LEAFLEVEL = 'Unit'
                inner join msdwprd.SHAREPOINT_LOCKEDLEASES  on LOCKEDASSIGNMENT = 'Locked / No changes will occur'
                    and ( substr(DATESK,1,6) = CODE )  
                LEFT JOIN ods.vw_property_lookup    pl ON d.hproperty = pl.hmy
                left join ods.yardi_owner o on o.HMYPERSON = d.hLegalEntity
                left join ods.yardi_unittype on trim(sCode)= BUS_VCUBEDIMPROPERTY.unittype;

            commit;


            -- clean up previous history
            delete from dw.w_property_d where SUBSTR(DATASOURCE,1,12) = 'HISTORY LOAD' 
                and nvl(row_wid,-999) in (select nvl(property_wid,-999) from w_OCCUPANCY_f where SUBSTR(DATASOURCE,1,12) = 'HISTORY LOAD');

           COMMIT;  

           delete from dw.w_property_d where SUBSTR(DATASOURCE,1,12) = 'HISTORY LOAD'
                and nvl(legacy_src_key,-999) in (select nvl(legacy_src_key,-999) from dwstage.w_property_tmp);


            commit;


            EXECUTE IMMEDIATE 'ANALYZE TABLE dw.w_property_d COMPUTE STATISTICS';


            -- merge the stage table data to dw table
            --MERGE INTO dw.w_property_d adw
            --USING dwstage.w_property_tmp msdw 
            --ON ( msdw.legacy_src_key = adw.legacy_src_key 
            --and msdw.datasource = adw.datasource
            --and SUBSTR(adw.DATASOURCE,1,12) = 'HISTORY LOAD' )
            --WHEN NOT MATCHED THEN
            /* if they do not exist then insert them  */
            INSERT INTO dw.w_property_d adw
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
            select 
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
            from dwstage.w_property_tmp msdw
            ;

            commit;


	END property;




    PROCEDURE lease_terms_dim IS
    BEGIN
        EXECUTE IMMEDIATE 'alter session force parallel query parallel 8';


        DELETE FROM dwstage.w_lease_terms_d_tmp; -- clean up the stage table

        commit; 

        INSERT INTO dwstage.w_lease_terms_d_tmp 
        (
            row_wid,
            reported_date,
            lease_type,
            lease_sign_date,
            lease_start_date,
            lease_end_date,
            amendment_type,
            amendment_sign_date,
            amendment_start_date,
            amendment_end_date,
            amendment_expire_date,
            amendment_expire_reported_date,
            mtm_flag,
            early_termination_option_date,
            amendment_original_start_date,
            locked_flag,
            lease_number,
            created_on_dt,
            changed_on_dt,
            etl_update_dt,
            etl_insert_dt,
            etl_proc_wid,
            datasource,
            unit,
            lease_remaining_term,
            date_expiration_year,
            legacy_src_key
        )
            SELECT
                rownum row_wid,
                dtdate                        reported_date,
                leasetype                     lease_type,
                dateleasesign                 lease_sign_date,
                dateleasestart                lease_start_date,
                dateleaseend                  lease_end_date,
                amendmenttype                 amendment_type,
                dateamendmentsign             amendment_sign_date,
                dateamendmentstart            amendment_start_date,
                dateamendmentend              amendment_end_date,
                dateamendmentexpire           amendment_expire_date,
                dateamendmentexpirereported   amendment_expire_reported_date,
                mtm                           mtm_flag,
                oa_vCubedimleaseterms.earlyterminationoptiondate    early_termination_option_date,
                dateamendmentoriginalstart    amendment_original_start_date,
                locked                        locked_flag,
                NULL lease_number,
                datecreatedw                  created_on_dt,
                datemodifydw                  changed_on_dt,
                sysdate                       etl_update_dt,
                sysdate                       etl_insert_dt,
                -1 etl_proc_wid,
                'HISTORY LOAD' datasource,
                oa_vCubedimleaseterms.sunit                         unit,
                LeaseRemainingTerm lease_remaining_term,
                to_char(DateAmendmentExpire,'yyyy') date_expiration_year,
                oa_vCubedimleaseterms.leasetermssk                  legacy_src_key
            FROM
                msdwprd.oa_vCubedimleaseterms  
                inner join msdwprd.oa_vCubeFactOccupancy on oa_vCubedimleaseterms.LEASETERMSSK = oa_vCubeFactOccupancy.LEASETERMSSK 
                   and oa_vCubedimleaseterms.LEASETERMSSK > 0  and oa_vCubeFactOccupancy.LEAFLEVEL = 'Unit'
                inner join msdwprd.SHAREPOINT_LOCKEDLEASES  on LOCKEDASSIGNMENT = 'Locked / No changes will occur'
                    and ( substr(oa_vCubeFactOccupancy.DATESK,1,6) = CODE );

            commit;

             -- clean up previous history
            delete from dw.w_lease_terms_d where SUBSTR(DATASOURCE,1,12) = 'HISTORY LOAD' ;


            COMMIT;

            -- merge the stage table data to dw table
            MERGE INTO dw.w_lease_terms_d adw
            USING dwstage.w_lease_terms_d_tmp msdw 
            ON ( msdw.legacy_src_key = adw.legacy_src_key 
            and msdw.datasource = adw.datasource
            and SUBSTR(adw.DATASOURCE,1,12) = 'HISTORY LOAD' )
            WHEN NOT MATCHED THEN
            /* if they do not exist then insert them  */
            INSERT 
            (
                row_wid,
                reported_date,
                lease_type,
                lease_sign_date,
                lease_start_date,
                lease_end_date,
                amendment_type,
                amendment_sign_date,
                amendment_start_date,
                amendment_end_date,
                amendment_expire_date,
                amendment_expire_reported_date,
                mtm_flag,
                early_termination_option_date,
                amendment_original_start_date,
                locked_flag,
                lease_number,
                created_on_dt,
                changed_on_dt,
                etl_update_dt,
                etl_insert_dt,
                etl_proc_wid,
                datasource,
                unit,
                lease_remaining_term,
                date_expiration_year,
                legacy_src_key
            )
            values
            (
                w_lease_terms_d_seq.nextval,
                msdw.reported_date,
                msdw.lease_type,
                msdw.lease_sign_date,
                msdw.lease_start_date,
                msdw.lease_end_date,
                msdw.amendment_type,
                msdw.amendment_sign_date,
                msdw.amendment_start_date,
                msdw.amendment_end_date,
                msdw.amendment_expire_date,
                msdw.amendment_expire_reported_date,
                msdw.mtm_flag,
                msdw.early_termination_option_date,
                msdw.amendment_original_start_date,
                msdw.locked_flag,
                msdw.lease_number,
                msdw.created_on_dt,
                msdw.changed_on_dt,
                msdw.etl_update_dt,
                msdw.etl_insert_dt,
                msdw.etl_proc_wid,
                msdw.datasource,
                msdw.unit,
                msdw.lease_remaining_term,
                msdw.date_expiration_year,
                msdw.legacy_src_key
            );

        commit;

	END lease_terms_dim;

    /*
    -------------------------
    Load Occupancy Fact 
    -------------------------
    */

    PROCEDURE occupancy_fact IS
    BEGIN
        EXECUTE IMMEDIATE 'alter session force parallel query parallel 8';

        delete from dwstage.w_occupancy_f_tmp ;

        commit;

        INSERT INTO dwstage.w_occupancy_f_tmp (
            property_wid,
            customer_wid,
            lease_terms_wid,
            reported_date_wid,
            rentable_sq_ft,
            rentable_sq_m,
            boma_sq_ft,
            raised_floor_sq_ft,
            kw,
            monthly_gaap_rent_native,
            monthly_rent_native,
            monthly_termed_connectivity_native,
            rent_at_expiration_native,
            current_expiring_lease_term_in_months,
            full_lease_term_in_months,
            lease_remaining_term_in_months,
            currency_code,
            exchange_rate_usd,
            early_termination_term_in_months,
            early_termination_rent_at_expiration,
            load_factor,
            locked_flag,
            created_on_dt,
            changed_on_dt,
            etl_update_dt,
            etl_insert_dt,
            etl_proc_wid,
            datasource,
            monthly_non_termed_connectivity_revenue_native,
            snapshot_period,
            snapshot_date,
            legacy_src_key
        )
        SELECT
            nvl(w_property_d.row_wid, - 1) property_wid,
            nvl(w_customer_d.row_wid, - 1) customer_wid,
            nvl(w_lease_terms_d.row_wid, - 1) lease_terms_wid,
            fo.datesk                                 reported_date_wid,
            nvl(fo.rentablesqft,0)                           rentable_sq_ft,
            nvl(fo.rentablesqm ,0)                           rentable_sq_m,
            nvl(fo.bomasqft,0)                               boma_sq_ft,
            nvl(fo.raisedfloorsqft,0)                        raised_floor_sq_ft,
            nvl(fo.kw,0)                                     kw,
            nvl(fo.monthlygaaprentnative,0)                  monthly_gaap_rent_native,
            nvl(fo.monthlyrentnative ,0)                     monthly_rent_native,
            nvl(fo.monthlytermedconnectivitynative,0)       monthly_termed_connectivity_native,
            nvl(fo.rentatexpirationnative,0)                 rent_at_expiration_native,
            nvl(fo.currexpleaseunitterminmonths,0)           current_expiring_lease_term_in_months,
            nvl(fo.fullleaseunitterminmonths,0)              full_lease_term_in_months,
            nvl(fo.leaseremainingterm,0)                     lease_remaining_term_in_months,
            NULL currency_code,
            nvl(fo.exchangerate,0)                           exchange_rate_usd,
            nvl(fo.earlyterminationweightedterminmonths,0)   early_termination_term_in_months,
            nvl(fo.earlyterminationrentatexpiration,0)       early_termination_rent_at_expiration,
            nvl(fo.loadfactor,0)                             load_factor,
            1                                 locked_flag,
            ft.datecreatedw                           created_on_dt,
            ft.datemodifydw                           changed_on_dt,
            sysdate                                   etl_update_dt,
            sysdate                                   etl_insert_dt,
            - 1 etl_proc_wid,
            'HISTORY LOAD' || '~' || fo.SOURCESYSTEM datasource,
            nvl(fo.MONTHLYNONTERMEDPRODUCTSNATIVE,0) monthly_non_termed_connectivity_revenue_native,
            substr(fo.datesk, 1, 6) snapshot_period,
            to_date(fo.datesk, 'yyyymmdd') snapshot_date,
            fo.factid  || '~' || fo.leaflevel                                  legacy_src_key
        FROM
            msdwprd.oa_vCubeFactOccupancy fo
            left join msdwprd.oa_FactOccupancy ft on fo.factid = ft.factid
            inner join msdwprd.SHAREPOINT_LOCKEDLEASES  on LOCKEDASSIGNMENT = 'Locked / No changes will occur'
                    and ( substr(FO.DATESK,1,6) = CODE )
            LEFT JOIN w_customer_d ON SUBSTR(w_customer_d.DATASOURCE,1,12) = 'HISTORY LOAD' AND fo.customersk = w_customer_d.legacy_src_key
            LEFT JOIN w_property_d ON SUBSTR(w_property_d.DATASOURCE,1,12) = 'HISTORY LOAD' AND fo.propertysk = w_property_d.legacy_src_key
              and CODE = w_property_d.snapshot_period and leaf_level = fo.LEAFLEVEL
            LEFT JOIN w_lease_terms_d ON SUBSTR(w_lease_terms_d.DATASOURCE,1,12) = 'HISTORY LOAD' AND fo.leasetermssk = w_lease_terms_d.legacy_src_key  
            where   fo.LEAFLEVEL = 'Unit';

        commit;


         -- clean up previous history
            delete from dw.w_occupancy_f where SUBSTR(DATASOURCE,1,12) = 'HISTORY LOAD' ;

            COMMIT;         


            -- merge the stage table data to dw table
            MERGE INTO dw.w_occupancy_f adw
            USING dwstage.w_occupancy_f_tmp msdw 
            ON ( msdw.legacy_src_key = adw.legacy_src_key 
            and msdw.datasource = adw.datasource
            and SUBSTR(adw.DATASOURCE,1,12) = 'HISTORY LOAD' )
            WHEN NOT MATCHED THEN
            /* if they do not exist then insert them  */
            INSERT 
            (
                property_wid,
                customer_wid,
                lease_terms_wid,
                reported_date_wid,
                rentable_sq_ft,
                rentable_sq_m,
                boma_sq_ft,
                raised_floor_sq_ft,
                kw,
                monthly_gaap_rent_native,
                monthly_rent_native,
                monthly_termed_connectivity_native,
                rent_at_expiration_native,
                current_expiring_lease_term_in_months,
                full_lease_term_in_months,
                lease_remaining_term_in_months,
                currency_code,
                exchange_rate_usd,
                early_termination_term_in_months,
                early_termination_rent_at_expiration,
                load_factor,
                locked_flag,
                created_on_dt,
                changed_on_dt,
                etl_update_dt,
                etl_insert_dt,
                etl_proc_wid,
                datasource,
                monthly_non_termed_connectivity_revenue_native,
                snapshot_period,
                snapshot_date,
                legacy_src_key,
                row_wid
            )
            values
            (
                msdw.property_wid,
                msdw.customer_wid,
                msdw.lease_terms_wid,
                msdw.reported_date_wid,
                msdw.rentable_sq_ft,
                msdw.rentable_sq_m,
                msdw.boma_sq_ft,
                msdw.raised_floor_sq_ft,
                msdw.kw,
                msdw.monthly_gaap_rent_native,
                msdw.monthly_rent_native,
                msdw.monthly_termed_connectivity_native,
                msdw.rent_at_expiration_native,
                msdw.current_expiring_lease_term_in_months,
                msdw.full_lease_term_in_months,
                msdw.lease_remaining_term_in_months,
                msdw.currency_code,
                msdw.exchange_rate_usd,
                msdw.early_termination_term_in_months,
                msdw.early_termination_rent_at_expiration,
                msdw.load_factor,
                msdw.locked_flag,
                msdw.created_on_dt,
                msdw.changed_on_dt,
                msdw.etl_update_dt,
                msdw.etl_insert_dt,
                msdw.etl_proc_wid,
                msdw.datasource,
                msdw.monthly_non_termed_connectivity_revenue_native,
                msdw.snapshot_period,
                msdw.snapshot_date,
                msdw.legacy_src_key,
                W_OCCUPANCY_F_SEQ.nextval
            );

            commit;




            merge into W_LEASE_terms_D d
            using
            (
            select 
            case 
             when to_char(datasource) = 'HISTORY LOAD~Apttus' 
                then 'EMEA Colo'
             when to_char(datasource) = 'HISTORY LOAD~Apttus Adjustments' 
                then 'EMEA Colo'
             when to_char(datasource) = 'HISTORY LOAD~Apttus Detail Adjustments' 
                then 'EMEA Colo'
             when to_char(datasource) = 'HISTORY LOAD~DLR Adjustments' then 
                'Scale'
             when to_char(datasource) = 'HISTORY LOAD~DLR Detail Adjustments' 
                then 'Scale'
             when to_char(datasource) = 'HISTORY LOAD~Interxion' 
                then 'Interxion'
             when to_char(datasource) = 'HISTORY LOAD~Telx Detail' 
                then 'NA Colo'
             when to_char(datasource) = 'HISTORY LOAD~Yardi7' 
                then 'Scale'
             else to_char(datasource)
            end business_unit, LEASE_TERMS_WID 
            from 
            w_occupancy_f where datasource like 'HISTORY LOAD%'
            ) f on ( d.row_wid = f.LEASE_TERMS_WID)
            when matched then update
            SET business_unit  = f.business_unit ;  

            commit;




            update w_occupancy_f 
            set product_wid = (select w_product_d.row_wid from w_product_d
            join w_property_d on unit_type = ITEM_NUMBER and INTEGRATION_ID = unit_type_src_key 
            and w_occupancy_f.property_wid = w_property_d.row_wid
            and w_property_d.datasource = 'HISTORY LOAD' and w_product_d.datasource = 'YARDI' )
            where substr(w_occupancy_f.datasource,1,12) = 'HISTORY LOAD';

            commit;

            update dw.w_occupancy_f 
            set product_wid = -1
            where product_wid is null and substr(w_occupancy_f.datasource,1,12) = 'HISTORY LOAD';

            commit;

            update dw.w_customer_d
            set customer_type = (select customertype from   msdwprd.dbo_vCubeDimCustomer where customersk = LEGACY_SRC_KEY)
            where w_customer_d.datasource = 'HISTORY LOAD';


            commit;

            MERGE
            INTO   dw.w_occupancy_f f
            USING   msdwprd.oa_vcubefactoccupancy m
            ON      ( f.datasource = 'HISTORY LOAD~Apttus' and m.sourcesystem = 'Apttus' and m.FACTID || '~' || m.leaflevel = f.LEGACY_SRC_KEY )
            WHEN MATCHED THEN UPDATE
                SET MONTHLY_TERMED_CONNECTIVITY_NATIVE = MONTHLYCONNECTIVITYNATIVE;


            commit;


     END occupancy_fact;   

    /*
    -------------------------
    Load LA Subject area 
    -------------------------
    */

	 PROCEDURE Load_oa_subject_area IS
     BEGIN
			pkg_history_load_oa.customers;
			pkg_history_load_oa.property;
			pkg_history_load_oa.lease_terms_dim;
			pkg_history_load_oa.occupancy_fact;

	 end Load_oa_subject_area;


END pkg_history_load_oa;

/
