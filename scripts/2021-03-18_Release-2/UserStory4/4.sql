ALTER TABLE "DW"."W_MONTH_D" 
ADD MONTHHASH NVARCHAR(225)

UPDATE "DW"."W_MONTH_D" 
SET QUARTER_NAME = 'FooQuarter'
