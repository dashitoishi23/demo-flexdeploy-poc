--------------------------------------------------------
--  DDL for View VW_ORDER_HEADERS_D
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DW"."VW_ORDER_HEADERS_D" ("CUSTOMER_WID", "ORDER_NUMBER", "ONHOLD", "OPEN_FLAG", "CANCELED_FLAG", "ORDER_TYPE_CODE", "ORDERED_DATE", "SOLD_TO_PARTY_ID", "CHANGE_VERSION_NUMBER", "CREATED_BY", "CREATION_DATE", "CUSTOMER_PO_NUMBER", "HEADER_ID", "HEADER_ORDERED_DATE_TIMESTAMP", "HEADER_SALES_CHANNEL_CODE", "HEADER_SUBMITTED_BY", "HEADER_SUBMITTED_DATE", "ORIG_SYS_DOCUMENT_REF", "SOURCE_DOCUMENT_TYPE_CODE", "SOURCE_ORDER_NUMBER", "SOURCE_ORDER_SYSTEM", "SUBMITTED_FLAG", "EFF_LINE_ID", "CONTEXT_CODE", "PROGRAM_NAME", "PROGRAM_APP_NAME", "OBJECT_VERSION_NUMBER", "IMPLEMENTATION_MANAGER", "SALES_ENGINEER", "CUSTOMER_SUCCESS_MANAGER", "INTERNAL_COMMENTS", "DATA_CENTER_DESIGN_ENGINEER", "IP_ENGINEER", "SERVICE_ASSURANCE_PROVISIONER", "CIRCUIT_DESIGN_PROVISIONER", "SERVICE_ORDER_NUMBER", "DEPLOYMENT_ID", "SUPPLY_CHAIN_BUYER", "CPQ_QUOTE_NUMBER", "ACCOUNT_OWNER", "SITE_OPS", "AGREEMENT_NUMBER") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
        nvl(w_customer_d.row_wid, -1)                       customer_wid,
        fusion_doo_headers_all.ordernumber                  order_number,
        fusion_doo_headers_all.onhold                       onhold,
        fusion_doo_headers_all.openflag                     open_flag,
        fusion_doo_headers_all.canceledflag                 canceled_flag,
        fusion_doo_headers_all.ordertypecode                order_type_code,
        fusion_doo_headers_all.ordereddate                  ordered_date,
        fusion_doo_headers_all.soldtopartyid                sold_to_party_id,
        fusion_doo_headers_all.changeversionnumber          change_version_number,
        fusion_doo_headers_all.createdby                    created_by,
        fusion_doo_headers_all.creationdate                 creation_date,
        fusion_doo_headers_all.customerponumber             customer_po_number,
        fusion_doo_headers_all.headerid                     header_id,
        fusion_doo_headers_all.headerordereddatetimestamp   header_ordered_date_timestamp,
        fusion_doo_headers_all.headersaleschannelcode       header_sales_channel_code,
        fusion_doo_headers_all.headersubmittedby            header_submitted_by,
        fusion_doo_headers_all.headersubmitteddate          header_submitted_date,
        fusion_doo_headers_all.origsysdocumentref           orig_sys_document_ref,
        fusion_doo_headers_all.sourcedocumenttypecode       source_document_type_code,
        fusion_doo_headers_all.sourceordernumber            source_order_number,
        fusion_doo_headers_all.sourceordersystem            source_order_system,
        fusion_doo_headers_all.submittedflag                submitted_flag,
        fusion_doo_headers_eff_b.eff_line_id                eff_line_id,
        fusion_doo_headers_eff_b.context_code               context_code,
        fusion_doo_headers_eff_b.program_name               program_name,
        fusion_doo_headers_eff_b.program_app_name           program_app_name,
        fusion_doo_headers_eff_b.object_version_number      object_version_number,
        fusion_doo_headers_eff_b.attribute_char1            Implementation_Manager,
        fusion_doo_headers_eff_b.attribute_char2            Sales_Engineer,
        fusion_doo_headers_eff_b.attribute_char3            Customer_Success_Manager,
        fusion_doo_headers_eff_b.attribute_char4            Internal_Comments,
        fusion_doo_headers_eff_b.attribute_char5            Data_Center_Design_Engineer,
        fusion_doo_headers_eff_b.attribute_char6            IP_Engineer,
        fusion_doo_headers_eff_b.attribute_char7            Service_Assurance_Provisioner,
        fusion_doo_headers_eff_b.attribute_char8            Circuit_Design_Provisioner,
        fusion_doo_headers_eff_b.attribute_char9            Service_Order_Number,
        fusion_doo_headers_eff_b.attribute_char11           Deployment_ID,
        fusion_doo_headers_eff_b.attribute_char12           Supply_Chain_Buyer,
        fusion_doo_headers_eff_b.attribute_char13           CPQ_Quote_Number,
        fusion_doo_headers_eff_b.attribute_char14           Account_Owner,
        fusion_doo_headers_eff_b.attribute_char15           Site_Ops,
        fusion_doo_headers_eff_b.attribute_char16           Agreement_Number

    FROM
        ods.fusion_doo_headers_all left
        JOIN ods.fusion_doo_headers_eff_b ON fusion_doo_headers_all.headerid = fusion_doo_headers_eff_b.header_id
        LEFT JOIN w_customer_d ON to_char(fusion_doo_headers_all.soldtopartyid) = w_customer_d.l4_legal_entity_src_key and w_customer_d.current_flag = 'Y'
;
  GRANT SELECT ON "DW"."VW_ORDER_HEADERS_D" TO "DW_RO";
  GRANT READ ON "DW"."VW_ORDER_HEADERS_D" TO "DW_RO";
