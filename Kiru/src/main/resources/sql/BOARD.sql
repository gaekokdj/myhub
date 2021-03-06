--------------------------------------------------------
--  파일이 생성됨 - 수요일-10월-09-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "HR"."BOARD" 
   (	"BOARD_NUM" NUMBER, 
	"USER_ID" VARCHAR2(30 BYTE), 
	"BOARD_NAME" VARCHAR2(20 BYTE), 
	"BOARD_CONTENT" VARCHAR2(2000 BYTE), 
	"BOARD_DATE" DATE DEFAULT sysdate, 
	"VIEW_COUNT" NUMBER DEFAULT 0, 
	"LIKE_COUNT" NUMBER DEFAULT 0, 
	"TOP_NUM" VARCHAR2(20 BYTE), 
	"BOTTOM_NUM" VARCHAR2(20 BYTE), 
	"OUTER_NUM" VARCHAR2(20 BYTE), 
	"SHOES_NUM" VARCHAR2(20 BYTE), 
	"BOARD_HIT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.BOARD
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index SYS_C007219
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007219" ON "HR"."BOARD" ("BOARD_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "HR"."BOARD" MODIFY ("BOARD_HIT" NOT NULL ENABLE);
  ALTER TABLE "HR"."BOARD" ADD PRIMARY KEY ("BOARD_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."BOARD" MODIFY ("SHOES_NUM" NOT NULL ENABLE);
  ALTER TABLE "HR"."BOARD" MODIFY ("OUTER_NUM" NOT NULL ENABLE);
  ALTER TABLE "HR"."BOARD" MODIFY ("BOTTOM_NUM" NOT NULL ENABLE);
  ALTER TABLE "HR"."BOARD" MODIFY ("TOP_NUM" NOT NULL ENABLE);
  ALTER TABLE "HR"."BOARD" MODIFY ("LIKE_COUNT" NOT NULL ENABLE);
  ALTER TABLE "HR"."BOARD" MODIFY ("VIEW_COUNT" NOT NULL ENABLE);
  ALTER TABLE "HR"."BOARD" MODIFY ("BOARD_DATE" NOT NULL ENABLE);
  ALTER TABLE "HR"."BOARD" MODIFY ("BOARD_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "HR"."BOARD" MODIFY ("BOARD_NAME" NOT NULL ENABLE);
