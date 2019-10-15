--------------------------------------------------------
--  파일이 생성됨 - 수요일-10월-09-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table RECOMMEDDRESS
--------------------------------------------------------

  CREATE TABLE "HR"."RECOMMEDDRESS" 
   (	"RECOMMED_NUM" VARCHAR2(20 BYTE), 
	"GENRE_NAME" VARCHAR2(20 BYTE), 
	"RECOMMED_PHOTO_NAME" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.RECOMMEDDRESS
SET DEFINE OFF;
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('4','classic','/sesoc/resources/img/fashion/classic/01.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('5','classic','/sesoc/resources/img/fashion/classic/02.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('6','classic','/sesoc/resources/img/fashion/classic/03.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('7','classic','/sesoc/resources/img/fashion/classic/04.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('8','classic','/sesoc/resources/img/fashion/classic/05.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('9','classiccasual','/sesoc/resources/img/fashion/classiccasual/01.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('10','classiccasual','/sesoc/resources/img/fashion/classiccasual/02.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('11','classiccasual','/sesoc/resources/img/fashion/classiccasual/03.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('12','classiccasual','/sesoc/resources/img/fashion/classiccasual/04.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('13','classiccasual','/sesoc/resources/img/fashion/classiccasual/05.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('14','minimal','/sesoc/resources/img/fashion/minimal/01.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('15','minimal','/sesoc/resources/img/fashion/minimal/02.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('16','minimal','/sesoc/resources/img/fashion/minimal/03.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('17','minimal','/sesoc/resources/img/fashion/minimal/04.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('18','minimal','/sesoc/resources/img/fashion/minimal/05.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('19','street','/sesoc/resources/img/fashion/street/01.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('20','street','/sesoc/resources/img/fashion/street/02.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('21','street','/sesoc/resources/img/fashion/street/03.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('22','street','/sesoc/resources/img/fashion/street/04.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('23','street','/sesoc/resources/img/fashion/street/05.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('24','amecaji','/sesoc/resources/img/fashion/amecaji/01.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('25','amecaji','/sesoc/resources/img/fashion/amecaji/02.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('26','amecaji','/sesoc/resources/img/fashion/amecaji/03.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('27','amecaji','/sesoc/resources/img/fashion/amecaji/04.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('28','amecaji','/sesoc/resources/img/fashion/amecaji/05.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('29','workwear','/sesoc/resources/img/fashion/workwear/01.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('30','workwear','/sesoc/resources/img/fashion/workwear/02.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('31','workwear','/sesoc/resources/img/fashion/workwear/03.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('32','workwear','/sesoc/resources/img/fashion/workwear/04.jpg');
Insert into HR.RECOMMEDDRESS (RECOMMED_NUM,GENRE_NAME,RECOMMED_PHOTO_NAME) values ('33','workwear','/sesoc/resources/img/fashion/workwear/05.jpg');
--------------------------------------------------------
--  DDL for Index SYS_C007090
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007090" ON "HR"."RECOMMEDDRESS" ("RECOMMED_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table RECOMMEDDRESS
--------------------------------------------------------

  ALTER TABLE "HR"."RECOMMEDDRESS" ADD PRIMARY KEY ("RECOMMED_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."RECOMMEDDRESS" MODIFY ("RECOMMED_PHOTO_NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."RECOMMEDDRESS" MODIFY ("GENRE_NAME" NOT NULL ENABLE);
