ALTER TABLE "DW"."W_CUSTOMER_ADJ_D" 
ADD DBVERSION NVARCHAR(225)

UPDATE "DW"."W_CUSTOMER_ADJ_D"
SET DATASOURCE
='MYSQL'
WHERE L4_LEGAL_ENTITY_SRC_KEY LIKE 'FOOLEGALENTITY'
