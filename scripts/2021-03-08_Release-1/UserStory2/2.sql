ALTER TABLE "DW"."W_LEASE_ACTIVITY_PRE_D_FUSION" 
ADD DATASOURCEHASH NVARCHAR(225)

UPDATE "DW"."W_LEASE_ACTIVITY_PRE_D_FUSION" 
SET GENERATION = 'FooBarGeneration'
WHERE SUITES LIKE 'FOOBARSUITES'
