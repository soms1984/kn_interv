
  CREATE TABLE "TEST"."SHIPMENT" 
   (	"SHIPMENT_ID" NUMBER, 
	"KN_COM_REF" VARCHAR2(15) NOT NULL ENABLE, 
	"IS_DANG_GOOD" CHAR(1) DEFAULT 'Y' NOT NULL ENABLE, 
	"PACKAGES" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"GROSS_WEIGHT" NUMBER(8,2), 
	"VOLUME" NUMBER(8,3), 
	"FROM_LOCATION" VARCHAR2(5) NOT NULL ENABLE, 
	"TO_LOCATION" VARCHAR2(5) NOT NULL ENABLE, 
	"SHIPMENT_TYPE_CODE" CHAR(1) DEFAULT 'X' NOT NULL ENABLE, 
	"SHIPMENT_TYPE_NAME" VARCHAR2(50) NOT NULL ENABLE, 
	"TRANSPORT_TYPE" CHAR(1) DEFAULT 'S' NOT NULL ENABLE, 
	"LAST_UPDATE" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"IS_ACTIVE" CHAR(1) DEFAULT 'N' NOT NULL ENABLE, 
	 CONSTRAINT "SHIP_PK" PRIMARY KEY ("SHIPMENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "SHIP_DG_GD_CHK" CHECK (IS_DANG_GOOD in ('Y','N')) ENABLE, 
	 CONSTRAINT "SHIP_IS_ACTIVE_CHK" CHECK (IS_ACTIVE in ('Y','N')) ENABLE, 
	 CONSTRAINT "SHIP_TRNS_TYP_CHK" CHECK (TRANSPORT_TYPE in ('S','A')) ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 