--------------------------------------------------------
--  DDL for Index SYS_AI_9yh5fga77t5zx
--------------------------------------------------------

  CREATE INDEX "DW"."SYS_AI_9yh5fga77t5zx" ON "DW"."W_PROPERTY_D" ("PROPERTY_CODE", "UNIT", "LEAF_LEVEL") AUTO 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 INVISIBLE COMPUTE STATISTICS COMPRESS ADVANCED LOW 
  TABLESPACE "DATA"  ;
  ALTER INDEX "DW"."SYS_AI_9yh5fga77t5zx"  UNUSABLE;
