--V4.1.13 2013-12-13�����ű�
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('1023', '�����˻�', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102310', '�����˻���������', 3, 'F7101');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102311', '�����˻���������', 3, 'F7102');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102312', '�����˻��������', 3, 'F7103');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102313', '�����˻����׳���', 3, 'F7107');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102314', '�����˻��ֹ����', 3, 'F7108');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102315', '�����˻���Ϣ��ѯ', 3, 'F7105');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102316', '�����˻���ϸ��ѯ', 3, 'F7106');
commit;
delete from T_DICTIONARY where dicttype=3;
insert into T_DICTIONARY (DICTTYPE, DICTTYPENAME, DICTVAL, DICTCAPTION)
values (3, '��ˮ״̬', '1', 'δ����');
insert into T_DICTIONARY (DICTTYPE, DICTTYPENAME, DICTVAL, DICTCAPTION)
values (3, '��ˮ״̬', '2', 'ʧ��');
insert into T_DICTIONARY (DICTTYPE, DICTTYPENAME, DICTVAL, DICTCAPTION)
values (3, '��ˮ״̬', '3', '�ɹ�');
insert into T_DICTIONARY (DICTTYPE, DICTTYPENAME, DICTVAL, DICTCAPTION)
values (3, '��ˮ״̬', '4', '�ѳ���');
insert into T_DICTIONARY (DICTTYPE, DICTTYPENAME, DICTVAL, DICTCAPTION)
values (3, '��ˮ״̬', '5', '��Ч��ˮ');
commit;
insert into T_DICTIONARY (DICTTYPE, DICTTYPENA
--V4.1.12 2013-11-11�����ű�
delete from T_MODULE where MODULECODE='10121413';
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121413', '�̻�Ӫҵ�����', 3, 'F6027');
commit;
--V4.1.18 2013-11-28�����ű�
delete from t_transcode where transcode between 6000 and 6090;
insert into T_TRANSCODE (TRANSCODE, TRANSNAME, LOGFLAG, LIMITFLAG, FEEFLAG, TRANSFLAG, DISABLEFLAG)
values (6010, '�����˻���ֵ', 1, 1, 0, 1, 0);
insert into T_TRANSCODE (TRANSCODE, TRANSNAME, LOGFLAG, LIMITFLAG, FEEFLAG, TRANSFLAG, DISABLEFLAG)
values (6020, '�����˻�����', 1, 1, 0, 1, 0);
insert into T_TRANSCODE (TRANSCODE, TRANSNAME, LOGFLAG, LIMITFLAG, FEEFLAG, TRANSFLAG, DISABLEFLAG)
values (6050, '�����˻�תһ��ͨ', 1, 1, 0, 1, 0);
insert into T_TRANSCODE (TRANSCODE, TRANSNAME, LOGFLAG, LIMITFLAG, FEEFLAG, TRANSFLAG, DISABLEFLAG)
values (6060, '�����˻�֧��', 1, 1, 0, 1, 0);
insert into T_TRANSCODE (TRANSCODE, TRANSNAME, LOGFLAG, LIMITFLAG, FEEFLAG, TRANSFLAG, DISABLEFLAG)
values (6080, '�����˻����׳���', 1, 1, 0, 1, 0);
insert into T_TRANSCODE (TRANSCODE, TRANSNAME, LOGFLAG, LIMITFLAG, FEEFLAG, TRANSFLAG, DISABLEFLAG)
values (6090, '�����˻�����', 1, 1, 0, 1, 0);

delete from T_TRANSTYPE where transtype between 241 and 255;
insert into T_TRANSTYPE (TRANSTYPE, TRANSNAME, DISPLAYFLAG, USEFLAG)
values (241, '�����˻���ֵ', '0', '1');
insert into T_TRANSTYPE (TRANSTYPE, TRANSNAME, DISPLAYFLAG, USEFLAG)
values (242, 'ת��(���������ʻ�)', '0', '1');
insert into T_TRANSTYPE (TRANSTYPE, TRANSNAME, DISPLAYFLAG, USEFLAG)
values (243, '�����˻�Ȧ��ת��', '0', '1');
insert into T_TRANSTYPE (TRANSTYPE, TRANSNAME, DISPLAYFLAG, USEFLAG)
values (245, '�·������˻�����', '0', '1');
insert into T_TRANSTYPE (TRANSTYPE, TRANSNAME, DISPLAYFLAG, USEFLAG)
values (251, '�����˻�ȡ��', '0', '1');
insert into T_TRANSTYPE (TRANSTYPE, TRANSNAME, DISPLAYFLAG, USEFLAG)
values (252, 'ת��(�����˻�תһ��ͨ)', '0', '1');
insert into T_TRANSTYPE (TRANSTYPE, TRANSNAME, DISPLAYFLAG, USEFLAG)
values (253, '�����˻�֧������', '0', '1');
insert into T_TRANSTYPE (TRANSTYPE, TRANSNAME, DISPLAYFLAG, USEFLAG)
values (255, '�����˻��ֹ����', '0', '1');

delete from T_CFGSPLIT where transtype between 241 and 255;
insert into T_CFGSPLIT (TRANSTYPE, FUNDTYPE, OFFLINEFLAG, USECARDFLAG, CALCCARDBAL, DRACCFLAG, DRSUBJNO, DRACCNO, CRACCFLAG, CRSUBJNO, CRACCNO, SUMMARY)
values (241, 0, 0, 0, 0, 'I', '', '', 'E', '2003', null, '�����ʻ���ֵ');
insert into T_CFGSPLIT (TRANSTYPE, FUNDTYPE, OFFLINEFLAG, USECARDFLAG, CALCCARDBAL, DRACCFLAG, DRSUBJNO, DRACCNO, CRACCFLAG, CRSUBJNO, CRACCNO, SUMMARY)
values (245, 0, 0, 1, 1, 'I', '', null, 'E', '2003', null, '�����˻�����');
insert into T_CFGSPLIT (TRANSTYPE, FUNDTYPE, OFFLINEFLAG, USECARDFLAG, CALCCARDBAL, DRACCFLAG, DRSUBJNO, DRACCNO, CRACCFLAG, CRSUBJNO, CRACCNO, SUMMARY)
values (251, 0, 0, 0, 0, 'E', '2003', null, 'N', '1001', '1001', '�����˻�ȡ��');
insert into T_CFGSPLIT (TRANSTYPE, FUNDTYPE, OFFLINEFLAG, USECARDFLAG, CALCCARDBAL, DRACCFLAG, DRSUBJNO, DRACCNO, CRACCFLAG, CRSUBJNO, CRACCNO, SUMMARY)
values (252, 0, 0, 1, 1, 'E', '2003', null, 'C', '2001', null, '�����˻�ת��');
insert into T_CFGSPLIT (TRANSTYPE, FUNDTYPE, OFFLINEFLAG, USECARDFLAG, CALCCARDBAL, DRACCFLAG, DRSUBJNO, DRACCNO, CRACCFLAG, CRSUBJNO, CRACCNO, SUMMARY)
values (253, 0, 0, 1, 1, 'E', '2003', null, 'S', '2004', null, '�����˻�֧��');
insert into T_CFGSPLIT (TRANSTYPE, FUNDTYPE, OFFLINEFLAG, USECARDFLAG, CALCCARDBAL, DRACCFLAG, DRSUBJNO, DRACCNO, CRACCFLAG, CRSUBJNO, CRACCNO, SUMMARY)
values (255, 0, 0, 1, 1, 'I', '', null, 'I', '', null, '�����˻��ֹ����');
commit;


drop table T_NETACC;
drop table T_NETDTL;

CREATE TABLE T_NETACC  (
   ACCNO                VARCHAR2(10)                    NOT NULL,
   ACCNAME              VARCHAR2(60),
   SUBJNO               VARCHAR2(10),
   ACCPWD               VARCHAR2(64),
   CUSTID               NUMBER(9)                       NOT NULL,
   STOPPAYFLAG          NUMBER(9),
   STATUS               CHAR(1)                         NOT NULL,
   YDAYBAL              NUMBER(15,2),
   BALANCE              NUMBER(15,2)                    NOT NULL,
   AVAILBAL             NUMBER(15,2)                    NOT NULL,
   FROZEBAL             NUMBER(15,2)                    NOT NULL,
   LASTTRANSDATE        VARCHAR2(8),
   LASTACCDATE          VARCHAR2(8),
   OPENDATE             VARCHAR2(8)                     NOT NULL,
   CLOSEDATE            VARCHAR2(8)
);

COMMENT ON COLUMN T_NETACC.ACCNO IS
'�˺�';

COMMENT ON COLUMN T_NETACC.ACCNAME IS
'�ʻ���';

COMMENT ON COLUMN T_NETACC.SUBJNO IS
'��Ŀ��';

COMMENT ON COLUMN T_NETACC.ACCPWD IS
'�ʻ�����';

COMMENT ON COLUMN T_NETACC.CUSTID IS
'�ͻ���';

COMMENT ON COLUMN T_NETACC.STOPPAYFLAG IS
'ֹ����־';

COMMENT ON COLUMN T_NETACC.STATUS IS
'״̬';

COMMENT ON COLUMN T_NETACC.YDAYBAL IS
'�������';

COMMENT ON COLUMN T_NETACC.BALANCE IS
'�ʻ����';

COMMENT ON COLUMN T_NETACC.AVAILBAL IS
'�������';

COMMENT ON COLUMN T_NETACC.FROZEBAL IS
'�������';

COMMENT ON COLUMN T_NETACC.LASTTRANSDATE IS
'�ϴν�������';

COMMENT ON COLUMN T_NETACC.LASTACCDATE IS
'�ϴ���������';

COMMENT ON COLUMN T_NETACC.OPENDATE IS
'��������';

COMMENT ON COLUMN T_NETACC.CLOSEDATE IS
'��������';

ALTER TABLE T_NETACC
   ADD CONSTRAINT PK_T_NETACC PRIMARY KEY (ACCNO);

/*==============================================================*/
/* Index: UNIQ_NETACC_CUSTID                                    */
/*==============================================================*/
CREATE UNIQUE INDEX UNIQ_NETACC_CUSTID ON T_NETACC (
   CUSTID ASC
)
TABLESPACE TS_YKT_HIS;


CREATE TABLE T_NETDTL  (
   ACCDATE              NUMBER(8)                       NOT NULL,
   REFNO                VARCHAR2(20)                    NOT NULL,
   TERMID               NUMBER(9),
   TERMSEQNO            NUMBER(9),
   TERMDATE             NUMBER(8),
   TERMTIME             NUMBER(6),
   REQREFNO             VARCHAR(32),
   CUSTID               NUMBER(9),
   CUSTNAME             VARCHAR2(60),
   STUEMPNO             VARCHAR2(20),
   TRANSCODE            NUMBER(4)                       NOT NULL,
   AMOUNT               NUMBER(9)                      DEFAULT 0 NOT NULL,
   BALANCE              NUMBER(9)                      DEFAULT 0 NOT NULL,
   HOSTDATE             NUMBER(8),
   HOSTTIME             NUMBER(6),
   STATUS               NUMBER(2),
   ERRCODE              NUMBER(9),
   REMARK               VARCHAR(60)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_NETDTL.ACCDATE IS
'��������';

COMMENT ON COLUMN T_NETDTL.REFNO IS
'���ײο���';

COMMENT ON COLUMN T_NETDTL.TERMID IS
'�ն˺�';

COMMENT ON COLUMN T_NETDTL.TERMSEQNO IS
'�ն���ˮ��';

COMMENT ON COLUMN T_NETDTL.TERMDATE IS
'��������';

COMMENT ON COLUMN T_NETDTL.TERMTIME IS
'����ʱ��';

COMMENT ON COLUMN T_NETDTL.REQREFNO IS
'������ˮ��';

COMMENT ON COLUMN T_NETDTL.CUSTID IS
'�ͻ���';

COMMENT ON COLUMN T_NETDTL.CUSTNAME IS
'�ͻ�����';

COMMENT ON COLUMN T_NETDTL.STUEMPNO IS
'ѧ����';

COMMENT ON COLUMN T_NETDTL.TRANSCODE IS
'���״���';

COMMENT ON COLUMN T_NETDTL.AMOUNT IS
'���׽��';

COMMENT ON COLUMN T_NETDTL.BALANCE IS
'�˻����';

COMMENT ON COLUMN T_NETDTL.HOSTDATE IS
'��������';

COMMENT ON COLUMN T_NETDTL.HOSTTIME IS
'����ʱ��';

COMMENT ON COLUMN T_NETDTL.STATUS IS
'����״̬';

COMMENT ON COLUMN T_NETDTL.ERRCODE IS
'�������';

COMMENT ON COLUMN T_NETDTL.REMARK IS
'��ע';

ALTER TABLE T_NETDTL
   ADD CONSTRAINT PK_T_NETDTL PRIMARY KEY (REFNO);

/*==============================================================*/
/* Index: UNIQ_NETDTL_REQSEQNO                                  */
/*==============================================================*/
CREATE UNIQUE INDEX UNIQ_NETDTL_REQSEQNO ON T_NETDTL (
   REQREFNO ASC
);

/*==============================================================*/
/* Index: IDX_NETDTL_CUSTID                                     */
/*==============================================================*/
CREATE INDEX IDX_NETDTL_CUSTID ON T_NETDTL (
   CUSTID ASC
);
