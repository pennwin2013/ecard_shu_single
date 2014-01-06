
CREATE TABLE URP_CUSTOMER
 (STUEMP_NO    VARCHAR(30)     NOT NULL,
  STUEMP_NAME  VARCHAR(120),
  SEX          VARCHAR(1),
  CUT_TYPE     VARCHAR(60),
  DEPT_CODE    VARCHAR(10),
  DEPT_NAME    VARCHAR(120),
  S_CODE       VARCHAR(20),
  S_NAME       VARCHAR(90),
  GARDE        VARCHAR(10),
  CLASS_NO     VARCHAR(10),
  IN_DATE      DATE,
  OUT_DATE     DATE,
  IS_INSCHOOL  INTEGER,
  STATUS       VARCHAR(10),
  NATION       VARCHAR(2),
  ID_TYPE      INTEGER,
  ID_TYPENAME  VARCHAR(30),
  ID_NO        VARCHAR(30),
  TEL          VARCHAR(60),
  MOBILE       VARCHAR(80),
  EMAIL        VARCHAR(60),
  AREA         VARCHAR(2),
  AREA_NAME    VARCHAR(30),
  ADDRESS      VARCHAR(150),
  BUILDING_NO  VARCHAR(10),
  FLOOR_NO     VARCHAR(10),
  ROOM_NO      VARCHAR(10),
  MED_FEETYPE  VARCHAR(5),
  FEE_TYPE     VARCHAR(5),
  UPD_DATE     DATE,
  UPD_TIME     TIMESTAMP,
  UPD_STATUS   VARCHAR(1)    NOT NULL,
  RESERVE_1    VARCHAR(10),
  RESERVE_2    VARCHAR(10),
  RESERVE_3    VARCHAR(10),
  RESERVE_4    VARCHAR(10),
  PRIMARY KEY (STUEMP_NO)
 );


COMMENT ON TABLE URP_CUSTOMER
  IS 'URP�ͻ���Ϣ��';

COMMENT ON COLUMN URP_CUSTOMER.STUEMP_NO IS 'ѧ/����';
COMMENT ON COLUMN URP_CUSTOMER.STUEMP_NAME IS '����';
COMMENT ON COLUMN URP_CUSTOMER.SEX IS '�Ա�';
COMMENT ON COLUMN URP_CUSTOMER.CUT_TYPE IS '��Ա�������';
COMMENT ON COLUMN URP_CUSTOMER.DEPT_CODE IS '��λ����';
COMMENT ON COLUMN URP_CUSTOMER.DEPT_NAME IS '��λ����';
COMMENT ON COLUMN URP_CUSTOMER.S_CODE IS 'רҵ����';
COMMENT ON COLUMN URP_CUSTOMER.S_NAME IS 'רҵ����';
COMMENT ON COLUMN URP_CUSTOMER.GARDE IS '�꼶';
COMMENT ON COLUMN URP_CUSTOMER.CLASS_NO IS '�༶';
COMMENT ON COLUMN URP_CUSTOMER.IN_DATE IS '��Уʱ��';
COMMENT ON COLUMN URP_CUSTOMER.OUT_DATE IS 'Ԥ����Уʱ��';
COMMENT ON COLUMN URP_CUSTOMER.IS_INSCHOOL IS '��У״̬';
COMMENT ON COLUMN URP_CUSTOMER.STATUS IS '״̬';
COMMENT ON COLUMN URP_CUSTOMER.NATION IS '�������';
COMMENT ON COLUMN URP_CUSTOMER.ID_TYPE IS '֤������';
COMMENT ON COLUMN URP_CUSTOMER.ID_TYPENAME IS '֤���������';
COMMENT ON COLUMN URP_CUSTOMER.ID_NO IS '֤������';
COMMENT ON COLUMN URP_CUSTOMER.TEL IS '�绰';
COMMENT ON COLUMN URP_CUSTOMER.MOBILE IS '�ֻ�';
COMMENT ON COLUMN URP_CUSTOMER.EMAIL IS 'EMAIL';
COMMENT ON COLUMN URP_CUSTOMER.AREA IS 'У������';
COMMENT ON COLUMN URP_CUSTOMER.AREA_NAME IS 'У������';
COMMENT ON COLUMN URP_CUSTOMER.ADDRESS IS '��ַ';
COMMENT ON COLUMN URP_CUSTOMER.BUILDING_NO IS '��������¥��';
COMMENT ON COLUMN URP_CUSTOMER.FLOOR_NO IS '����¥���';
COMMENT ON COLUMN URP_CUSTOMER.ROOM_NO IS '���ڷ����';
COMMENT ON COLUMN URP_CUSTOMER.MED_FEETYPE IS 'ҽԺ�շ����';
COMMENT ON COLUMN URP_CUSTOMER.FEE_TYPE IS '�շ����';
COMMENT ON COLUMN URP_CUSTOMER.UPD_DATE IS '��������';
COMMENT ON COLUMN URP_CUSTOMER.UPD_TIME IS '����ʱ��';
COMMENT ON COLUMN URP_CUSTOMER.UPD_STATUS IS '����״̬';
COMMENT ON COLUMN URP_CUSTOMER.RESERVE_1 IS '�����ֶ�1';
COMMENT ON COLUMN URP_CUSTOMER.RESERVE_2 IS '�����ֶ�2';
COMMENT ON COLUMN URP_CUSTOMER.RESERVE_3 IS '�����ֶ�3';
COMMENT ON COLUMN URP_CUSTOMER.RESERVE_4 IS '�����ֶ�4';

create snapshot log on URP_CUSTOMER;