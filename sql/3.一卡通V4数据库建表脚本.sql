/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     2013-06-04 14:44:44                          */
/*==============================================================*/


CREATE SEQUENCE S_POSDATA_ID
INCREMENT BY 1
START WITH 1
 MAXVALUE 999999999
 MINVALUE 1
NOCYCLE
 NOCACHE
ORDER;

CREATE SEQUENCE S_REFNO
INCREMENT BY 1
START WITH 1
 MAXVALUE 99999999
CYCLE
 CACHE 10
ORDER;

CREATE SEQUENCE S_TRANSNO
INCREMENT BY 1
START WITH 1
 MAXVALUE 99999999
 MINVALUE 1
CYCLE
ORDER;

CREATE SEQUENCE S_T_DOORDOWNLOAD
INCREMENT BY 1
START WITH 1
 MAXVALUE 99999999
 MINVALUE 1
CYCLE
 CACHE 10
ORDER;

CREATE SEQUENCE S_T_OPERDTL_ID
INCREMENT BY 1
START WITH 1
 MAXVALUE 99999999
 MINVALUE 1
CYCLE
 CACHE 10
ORDER;

/*==============================================================*/
/* Table: T_ACCDTL                                              */
/*==============================================================*/
CREATE TABLE T_ACCDTL  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   ACCTIME              VARCHAR2(6),
   TERMID               NUMBER(9)                       NOT NULL,
   TERMSEQNO            NUMBER(9)                       NOT NULL,
   SUBSEQNO             NUMBER(9)                       NOT NULL,
   TRANSDATE            VARCHAR2(8),
   TRANSTIME            VARCHAR2(6),
   PAYTYPE              NUMBER(9),
   VOUCHERNO            VARCHAR2(20),
   REFNO                VARCHAR2(20),
   TRANSCODE            NUMBER(4),
   TRANSTYPE            NUMBER(9)                       NOT NULL,
   SUMMARY              VARCHAR2(60)                    NOT NULL,
   SUBJNO               VARCHAR2(10),
   ACCNO                VARCHAR2(10)                    NOT NULL,
   ACCNAME              VARCHAR2(90),
   DCFLAG               NUMBER(1)                       NOT NULL,
   AMOUNT               NUMBER(15,2)                    NOT NULL,
   BALANCE              NUMBER(15,2)                    NOT NULL,
   OPPSUBJNO            VARCHAR2(10),
   OPPACCNO             VARCHAR2(10),
   OPPACCNAME           VARCHAR2(90),
   OPERID               NUMBER(9),
   OPERCODE             VARCHAR2(8),
   REMARK               VARCHAR2(240)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_ACCDTL.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_ACCDTL.ACCTIME IS
'记账时间';

COMMENT ON COLUMN T_ACCDTL.TERMID IS
'终端编号(站点号、设备ID)';

COMMENT ON COLUMN T_ACCDTL.TERMSEQNO IS
'终端流水号';

COMMENT ON COLUMN T_ACCDTL.SUBSEQNO IS
'子流水号';

COMMENT ON COLUMN T_ACCDTL.TRANSDATE IS
'交易日期,取系统日期';

COMMENT ON COLUMN T_ACCDTL.TRANSTIME IS
'交易时间,取系统时间';

COMMENT ON COLUMN T_ACCDTL.PAYTYPE IS
'凭证类型';

COMMENT ON COLUMN T_ACCDTL.VOUCHERNO IS
'凭证号(支票、经费本号码)';

COMMENT ON COLUMN T_ACCDTL.REFNO IS
'参考号';

COMMENT ON COLUMN T_ACCDTL.TRANSCODE IS
'交易码';

COMMENT ON COLUMN T_ACCDTL.TRANSTYPE IS
'交易类别';

COMMENT ON COLUMN T_ACCDTL.SUMMARY IS
'摘要';

COMMENT ON COLUMN T_ACCDTL.SUBJNO IS
'科目号';

COMMENT ON COLUMN T_ACCDTL.ACCNO IS
'账号';

COMMENT ON COLUMN T_ACCDTL.ACCNAME IS
'帐户名';

COMMENT ON COLUMN T_ACCDTL.DCFLAG IS
'借贷';

COMMENT ON COLUMN T_ACCDTL.AMOUNT IS
'发生额';

COMMENT ON COLUMN T_ACCDTL.BALANCE IS
'帐户余额';

COMMENT ON COLUMN T_ACCDTL.OPPSUBJNO IS
'对方科目';

COMMENT ON COLUMN T_ACCDTL.OPPACCNO IS
'对方账号';

COMMENT ON COLUMN T_ACCDTL.OPPACCNAME IS
'对方帐户名';

COMMENT ON COLUMN T_ACCDTL.OPERID IS
'操作员ID';

COMMENT ON COLUMN T_ACCDTL.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_ACCDTL.REMARK IS
'备注';

ALTER TABLE T_ACCDTL
   ADD CONSTRAINT PK_T_ACCDTL PRIMARY KEY (ACCDATE, TERMID, TERMSEQNO, SUBSEQNO, ACCNO);

/*==============================================================*/
/* Index: IDX_ACCDTL_ACCNO                                      */
/*==============================================================*/
CREATE INDEX IDX_ACCDTL_ACCNO ON T_ACCDTL (
   ACCNO ASC
)
TABLESPACE TS_YKT_HIS;

/*==============================================================*/
/* Table: T_ACCOUNT                                             */
/*==============================================================*/
CREATE TABLE T_ACCOUNT  (
   ACCNO                VARCHAR2(10)                    NOT NULL,
   ACCNAME              VARCHAR2(90),
   SUBJNO               VARCHAR2(10)                    NOT NULL,
   ACCPWD               VARCHAR2(64),
   CUSTID               NUMBER(9),
   CARDNO               NUMBER(9),
   PURSENO              NUMBER(1),
   SINGLEMAXAMT         NUMBER(15,2),
   DAYCOSTMAXAMT        NUMBER(15,2),
   DAYCOSTAMT           NUMBER(15,2),
   CARDMAXBAL           NUMBER(15,2),
   STATUS               CHAR(1)                         NOT NULL,
   FOREGIFT             NUMBER(15,2)                    NOT NULL,
   YDAYBAL              NUMBER(15,2),
   BALANCE              NUMBER(15,2)                    NOT NULL,
   AVAILBAL             NUMBER(15,2)                    NOT NULL,
   FROZEBAL             NUMBER(15,2)                    NOT NULL,
   SUBSIDYBAL           NUMBER(15,2)                    NOT NULL,
   SUBSIDYNO            NUMBER(9),
   CARDBAL              NUMBER(15,2)                    NOT NULL,
   CARDCNT              NUMBER(9),
   DPSCNT               NUMBER(9),
   PAYCNT               NUMBER(9),
   TERMID               NUMBER(9),
   TRANSTIME            CHAR(14)                       DEFAULT TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),
   LASTSUBSIDYAMT       NUMBER(15,2),
   LASTSUBSIDYNO        NUMBER(9),
   LASTCARDBAL          NUMBER(15,2),
   LASTCARDCNT          NUMBER(9),
   LASTDPSCNT           NUMBER(9),
   LASTPAYCNT           NUMBER(9),
   LASTTRANSDATE        VARCHAR2(8),
   LASTACCDATE          VARCHAR2(8),
   OPENDATE             VARCHAR2(8)                     NOT NULL,
   CLOSEDATE            VARCHAR2(8),
   DELETED              NUMBER(1)
);

COMMENT ON COLUMN T_ACCOUNT.ACCNO IS
'账号';

COMMENT ON COLUMN T_ACCOUNT.ACCNAME IS
'帐户名称';

COMMENT ON COLUMN T_ACCOUNT.SUBJNO IS
'科目号';

COMMENT ON COLUMN T_ACCOUNT.ACCPWD IS
'帐户密码';

COMMENT ON COLUMN T_ACCOUNT.CUSTID IS
'客户号';

COMMENT ON COLUMN T_ACCOUNT.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_ACCOUNT.PURSENO IS
'钱包号';

COMMENT ON COLUMN T_ACCOUNT.SINGLEMAXAMT IS
'单次消费限额';

COMMENT ON COLUMN T_ACCOUNT.DAYCOSTMAXAMT IS
'日消费限额';

COMMENT ON COLUMN T_ACCOUNT.DAYCOSTAMT IS
'日累计消费金额';

COMMENT ON COLUMN T_ACCOUNT.CARDMAXBAL IS
'卡最大金额';

COMMENT ON COLUMN T_ACCOUNT.STATUS IS
'状态';

COMMENT ON COLUMN T_ACCOUNT.FOREGIFT IS
'押金';

COMMENT ON COLUMN T_ACCOUNT.YDAYBAL IS
'昨日余额';

COMMENT ON COLUMN T_ACCOUNT.BALANCE IS
'帐户余额';

COMMENT ON COLUMN T_ACCOUNT.AVAILBAL IS
'可用余额';

COMMENT ON COLUMN T_ACCOUNT.FROZEBAL IS
'冻结余额';

COMMENT ON COLUMN T_ACCOUNT.SUBSIDYBAL IS
'代领补助金额';

COMMENT ON COLUMN T_ACCOUNT.SUBSIDYNO IS
'补助批次号';

COMMENT ON COLUMN T_ACCOUNT.CARDBAL IS
'卡余额';

COMMENT ON COLUMN T_ACCOUNT.CARDCNT IS
'卡交易次数';

COMMENT ON COLUMN T_ACCOUNT.DPSCNT IS
'卡充值次数';

COMMENT ON COLUMN T_ACCOUNT.PAYCNT IS
'卡消费次数';

COMMENT ON COLUMN T_ACCOUNT.TERMID IS
'交易终端号';

COMMENT ON COLUMN T_ACCOUNT.TRANSTIME IS
'交易时间';

COMMENT ON COLUMN T_ACCOUNT.LASTSUBSIDYAMT IS
'上次补助金额';

COMMENT ON COLUMN T_ACCOUNT.LASTSUBSIDYNO IS
'上次补助批次号';

COMMENT ON COLUMN T_ACCOUNT.LASTCARDBAL IS
'上次卡余额';

COMMENT ON COLUMN T_ACCOUNT.LASTCARDCNT IS
'上次交易次数';

COMMENT ON COLUMN T_ACCOUNT.LASTDPSCNT IS
'上次卡充值次数';

COMMENT ON COLUMN T_ACCOUNT.LASTPAYCNT IS
'上次消费次数';

COMMENT ON COLUMN T_ACCOUNT.LASTTRANSDATE IS
'上次交易日期';

COMMENT ON COLUMN T_ACCOUNT.LASTACCDATE IS
'上次清算日期';

COMMENT ON COLUMN T_ACCOUNT.OPENDATE IS
'开户日期';

COMMENT ON COLUMN T_ACCOUNT.CLOSEDATE IS
'销户日期';

COMMENT ON COLUMN T_ACCOUNT.DELETED IS
'DELETED';

ALTER TABLE T_ACCOUNT
   ADD CONSTRAINT PK_T_ACCOUNT PRIMARY KEY (ACCNO);

/*==============================================================*/
/* Index: UNIQ_ACCOUNT_CARDNO                                   */
/*==============================================================*/
CREATE UNIQUE INDEX UNIQ_ACCOUNT_CARDNO ON T_ACCOUNT (
   CARDNO ASC
);

/*==============================================================*/
/* Index: IDX_ACCOUNT_CUSTID                                    */
/*==============================================================*/
CREATE INDEX IDX_ACCOUNT_CUSTID ON T_ACCOUNT (
   CUSTID ASC
);

/*==============================================================*/
/* Table: T_AREA                                                */
/*==============================================================*/
CREATE TABLE T_AREA  (
   AREACODE             VARCHAR2(3)                     NOT NULL,
   AREANAME             VARCHAR2(60),
   FAREACODE            VARCHAR2(3),
   OLDAREACODE          VARCHAR2(3),
   AREALEVEL            NUMBER(9),
   ADDR                 VARCHAR2(240),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_AREA.AREACODE IS
'区域编号';

COMMENT ON COLUMN T_AREA.AREANAME IS
'区域名称';

COMMENT ON COLUMN T_AREA.FAREACODE IS
'上级区域代码';

COMMENT ON COLUMN T_AREA.OLDAREACODE IS
'原区域代码';

COMMENT ON COLUMN T_AREA.AREALEVEL IS
'区域级别';

COMMENT ON COLUMN T_AREA.ADDR IS
'地址';

COMMENT ON COLUMN T_AREA.REMARK IS
'备注';

ALTER TABLE T_AREA
   ADD CONSTRAINT PK_T_AREA PRIMARY KEY (AREACODE);

/*==============================================================*/
/* Table: T_ATTDEVCARDLIST                                      */
/*==============================================================*/
CREATE TABLE T_ATTDEVCARDLIST  (
   DEVICEID             NUMBER(9)                       NOT NULL,
   CUSTID               NUMBER(9)                       NOT NULL,
   WEEKID               NUMBER(9)                       NOT NULL,
   HOLIDAYID            NUMBER(9),
   CARDNO               NUMBER(9),
   CARDPHYID            VARCHAR2(16),
   CARDVERNO            VARCHAR2(12),
   ADDDELFLAG           NUMBER(1),
   DOWNSTATUS           NUMBER(9)                       NOT NULL,
   DOWNTIME             VARCHAR2(30),
   UPDATETIME           VARCHAR2(30)
);

COMMENT ON COLUMN T_ATTDEVCARDLIST.DEVICEID IS
'设备编号';

COMMENT ON COLUMN T_ATTDEVCARDLIST.CUSTID IS
'客户号';

COMMENT ON COLUMN T_ATTDEVCARDLIST.WEEKID IS
'星期ID';

COMMENT ON COLUMN T_ATTDEVCARDLIST.HOLIDAYID IS
'节假日ID';

COMMENT ON COLUMN T_ATTDEVCARDLIST.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_ATTDEVCARDLIST.CARDPHYID IS
'卡物理ID';

COMMENT ON COLUMN T_ATTDEVCARDLIST.CARDVERNO IS
'名单版本号';

COMMENT ON COLUMN T_ATTDEVCARDLIST.ADDDELFLAG IS
'增删标志:1-增-2删';

COMMENT ON COLUMN T_ATTDEVCARDLIST.DOWNSTATUS IS
'下传状态';

COMMENT ON COLUMN T_ATTDEVCARDLIST.DOWNTIME IS
'下传时间';

COMMENT ON COLUMN T_ATTDEVCARDLIST.UPDATETIME IS
'更新时间';

ALTER TABLE T_ATTDEVCARDLIST
   ADD CONSTRAINT PK_T_ATTDEVCARDLIST PRIMARY KEY (DEVICEID, CUSTID, WEEKID);

/*==============================================================*/
/* Table: T_ATTENDDTL                                           */
/*==============================================================*/
CREATE TABLE T_ATTENDDTL  (
   TRANSDATE            VARCHAR2(8)                     NOT NULL,
   TRANSTIME            VARCHAR2(6),
   DEVICEID             NUMBER(9),
   DEVPHYID             VARCHAR2(20)                    NOT NULL,
   DEVSEQNO             NUMBER(9)                       NOT NULL,
   COLDATE              VARCHAR2(8),
   COLTIME              VARCHAR2(6),
   CARDNO               NUMBER(9),
   CARDPHYID            VARCHAR2(16),
   SHOWCARDNO           VARCHAR2(10),
   STUEMPNO             VARCHAR2(20),
   CUSTID               NUMBER(9),
   CUSTNAME             VARCHAR2(60),
   TRANSMARK            NUMBER(9),
   STATUS               NUMBER(1)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_ATTENDDTL.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_ATTENDDTL.TRANSTIME IS
'交易时间';

COMMENT ON COLUMN T_ATTENDDTL.DEVICEID IS
'设备编号';

COMMENT ON COLUMN T_ATTENDDTL.DEVPHYID IS
'设备物理ID';

COMMENT ON COLUMN T_ATTENDDTL.DEVSEQNO IS
'流水号';

COMMENT ON COLUMN T_ATTENDDTL.COLDATE IS
'采集日期';

COMMENT ON COLUMN T_ATTENDDTL.COLTIME IS
'采集时间';

COMMENT ON COLUMN T_ATTENDDTL.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_ATTENDDTL.CARDPHYID IS
'卡物理ID';

COMMENT ON COLUMN T_ATTENDDTL.SHOWCARDNO IS
'显示卡号';

COMMENT ON COLUMN T_ATTENDDTL.STUEMPNO IS
'学工号';

COMMENT ON COLUMN T_ATTENDDTL.CUSTID IS
'客户号';

COMMENT ON COLUMN T_ATTENDDTL.CUSTNAME IS
'姓名';

COMMENT ON COLUMN T_ATTENDDTL.TRANSMARK IS
'交易标记';

COMMENT ON COLUMN T_ATTENDDTL.STATUS IS
'状态';

ALTER TABLE T_ATTENDDTL
   ADD CONSTRAINT PK_T_ATTENDDTL PRIMARY KEY (TRANSDATE, DEVPHYID, DEVSEQNO);

/*==============================================================*/
/* Table: T_AUTHCARD                                            */
/*==============================================================*/
CREATE TABLE T_AUTHCARD  (
   CARDNO               NUMBER(9)                       NOT NULL,
   OPERCODE             VARCHAR2(8),
   CARDPHYID            VARCHAR2(16),
   SHOWCARDNO           VARCHAR2(10),
   PRIVILEGE            NUMBER(9),
   EXPIREDATE           VARCHAR2(8),
   STATUS               CHAR(1),
   LOSSFLAG             CHAR(1),
   LOSSDATE             VARCHAR2(8),
   OPENDATE             VARCHAR2(8),
   CLOSEDATE            VARCHAR2(8)
);

COMMENT ON COLUMN T_AUTHCARD.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_AUTHCARD.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_AUTHCARD.CARDPHYID IS
'卡物理ID';

COMMENT ON COLUMN T_AUTHCARD.SHOWCARDNO IS
'显示卡号';

COMMENT ON COLUMN T_AUTHCARD.PRIVILEGE IS
'授权卡权限';

COMMENT ON COLUMN T_AUTHCARD.EXPIREDATE IS
'有效期';

COMMENT ON COLUMN T_AUTHCARD.STATUS IS
'记录状态';

COMMENT ON COLUMN T_AUTHCARD.LOSSFLAG IS
'挂失状态';

COMMENT ON COLUMN T_AUTHCARD.LOSSDATE IS
'挂失日期';

COMMENT ON COLUMN T_AUTHCARD.OPENDATE IS
'发卡日期';

COMMENT ON COLUMN T_AUTHCARD.CLOSEDATE IS
'注销日期';

ALTER TABLE T_AUTHCARD
   ADD CONSTRAINT PK_T_AUTHCARD PRIMARY KEY (CARDNO);

/*==============================================================*/
/* Table: T_AUTHTYPE                                            */
/*==============================================================*/
CREATE TABLE T_AUTHTYPE  (
   AUTHTYPE             NUMBER(9)                       NOT NULL,
   AUTHTYPENAME         VARCHAR2(60),
   AUTHCLASS            NUMBER(9)
);

COMMENT ON COLUMN T_AUTHTYPE.AUTHTYPE IS
'权限小类';

COMMENT ON COLUMN T_AUTHTYPE.AUTHTYPENAME IS
'权限名称';

COMMENT ON COLUMN T_AUTHTYPE.AUTHCLASS IS
'权限大类';

ALTER TABLE T_AUTHTYPE
   ADD CONSTRAINT PK_T_AUTHTYPE PRIMARY KEY (AUTHTYPE);

/*==============================================================*/
/* Table: T_BANK                                                */
/*==============================================================*/
CREATE TABLE T_BANK  (
   BANKID               NUMBER(9)                       NOT NULL,
   BANKCODE             VARCHAR2(8)                     NOT NULL,
   BANKNAME             VARCHAR2(60)                    NOT NULL,
   USEFLAG              NUMBER(1)                      DEFAULT 0 NOT NULL,
   CHKACCLAG            NUMBER(1)                      DEFAULT 1,
   SVRBEGINTIME         VARCHAR2(6),
   SVRENDTIME           VARCHAR2(6),
   BANKIP               VARCHAR2(15),
   BANKPORT             NUMBER(9),
   BANKTIMEOUT          NUMBER(2),
   FRONTID              NUMBER(9),
   CHKTYPE              CHAR(1),
   CHKBEGINDATE         NUMBER(8),
   LASTCHKDATE          NUMBER(8),
   CHKBEGINTIME         VARCHAR2(6),
   CVTEXECFILE          VARCHAR2(240),
   CHKEXECFILE          VARCHAR2(240),
   AUTORESOLVE          NUMBER(1)
);

COMMENT ON COLUMN T_BANK.BANKID IS
'银行ID';

COMMENT ON COLUMN T_BANK.BANKCODE IS
'银行代码';

COMMENT ON COLUMN T_BANK.BANKNAME IS
'银行名称';

COMMENT ON COLUMN T_BANK.USEFLAG IS
'是否启用';

COMMENT ON COLUMN T_BANK.CHKACCLAG IS
'是否对账';

COMMENT ON COLUMN T_BANK.SVRBEGINTIME IS
'服务开始时间';

COMMENT ON COLUMN T_BANK.SVRENDTIME IS
'服务截止时间';

COMMENT ON COLUMN T_BANK.BANKIP IS
'银行IP';

COMMENT ON COLUMN T_BANK.BANKPORT IS
'银行端口';

COMMENT ON COLUMN T_BANK.BANKTIMEOUT IS
'银行端超时时间';

COMMENT ON COLUMN T_BANK.FRONTID IS
'前置机ID';

COMMENT ON COLUMN T_BANK.CHKTYPE IS
'一卡通核对项';

COMMENT ON COLUMN T_BANK.CHKBEGINDATE IS
'对账开始日期';

COMMENT ON COLUMN T_BANK.LASTCHKDATE IS
'上次对账日期';

COMMENT ON COLUMN T_BANK.CHKBEGINTIME IS
'对账开始时间';

COMMENT ON COLUMN T_BANK.CVTEXECFILE IS
'转换执行文件';

COMMENT ON COLUMN T_BANK.CHKEXECFILE IS
'对账执行文件';

COMMENT ON COLUMN T_BANK.AUTORESOLVE IS
'对账不符自动处理';

ALTER TABLE T_BANK
   ADD CONSTRAINT PK_T_BANK PRIMARY KEY (BANKID);

/*==============================================================*/
/* Index: UNIQ_BANKCODE_BANKCODE                                */
/*==============================================================*/
CREATE UNIQUE INDEX UNIQ_BANKCODE_BANKCODE ON T_BANK (
   BANKCODE ASC
);

/*==============================================================*/
/* Table: T_BANKCARD                                            */
/*==============================================================*/
CREATE TABLE T_BANKCARD  (
   CUSTID               NUMBER(9)                       NOT NULL,
   BANKCARDNO           VARCHAR2(20)                    NOT NULL,
   BANKCODE             VARCHAR2(8),
   BATCHNO              VARCHAR2(20),
   CREATEDDATE           VARCHAR2(8),
   RELATEDATE           VARCHAR2(8),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_BANKCARD.CUSTID IS
'客户号';

COMMENT ON COLUMN T_BANKCARD.BANKCARDNO IS
'银行卡号';

COMMENT ON COLUMN T_BANKCARD.BANKCODE IS
'银行编号';

COMMENT ON COLUMN T_BANKCARD.BATCHNO IS
'导入批次号';

COMMENT ON COLUMN T_BANKCARD.CREATEDDATE IS
'录入日期';

COMMENT ON COLUMN T_BANKCARD.RELATEDATE IS
'关联日期';

COMMENT ON COLUMN T_BANKCARD.LASTSAVED IS
'最后保存时间';

ALTER TABLE T_BANKCARD
   ADD CONSTRAINT PK_T_BANKCARD PRIMARY KEY (CUSTID, BANKCARDNO);

/*==============================================================*/
/* Index: UNIQ_BANKCARD_CUSTID                                  */
/*==============================================================*/
CREATE UNIQUE INDEX UNIQ_BANKCARD_CUSTID ON T_BANKCARD (
   CUSTID ASC
);

/*==============================================================*/
/* Index: UNIQ_BANKCARD_BANKCARDNO                              */
/*==============================================================*/
CREATE UNIQUE INDEX UNIQ_BANKCARD_BANKCARDNO ON T_BANKCARD (
   BANKCARDNO ASC
);

/*==============================================================*/
/* Table: T_BANKCARDDTL                                         */
/*==============================================================*/
CREATE TABLE T_BANKCARDDTL  (
   REFNO                VARCHAR2(20)                    NOT NULL,
   TRANSDATE            VARCHAR2(8),
   TRANSTIME            VARCHAR2(6),
   TERMID               NUMBER(9),
   OPERCODE             VARCHAR2(8),
   BATCHNO              VARCHAR2(30),
   CUSTID               NUMBER(9),
   CUSTNAME             VARCHAR2(60),
   STUEMPNO             VARCHAR2(20),
   BANKCARDNO           VARCHAR2(20),
   OPTYPE               NUMBER(1),
   ADDDELFLAG           NUMBER(1),
   ERRCODE              NUMBER(9),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_BANKCARDDTL.REFNO IS
'交易参考号';

COMMENT ON COLUMN T_BANKCARDDTL.TRANSDATE IS
'发生日期';

COMMENT ON COLUMN T_BANKCARDDTL.TRANSTIME IS
'发生时间';

COMMENT ON COLUMN T_BANKCARDDTL.TERMID IS
'终端号';

COMMENT ON COLUMN T_BANKCARDDTL.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_BANKCARDDTL.BATCHNO IS
'导入批次号';

COMMENT ON COLUMN T_BANKCARDDTL.CUSTID IS
'客户号';

COMMENT ON COLUMN T_BANKCARDDTL.CUSTNAME IS
'姓名';

COMMENT ON COLUMN T_BANKCARDDTL.STUEMPNO IS
'学工号';

COMMENT ON COLUMN T_BANKCARDDTL.BANKCARDNO IS
'银行卡号';

COMMENT ON COLUMN T_BANKCARDDTL.OPTYPE IS
'1- 签约2-解约3- 同步';

COMMENT ON COLUMN T_BANKCARDDTL.ADDDELFLAG IS
'1-增加2-删除';

COMMENT ON COLUMN T_BANKCARDDTL.ERRCODE IS
'错误码';

COMMENT ON COLUMN T_BANKCARDDTL.REMARK IS
'备注';

ALTER TABLE T_BANKCARDDTL
   ADD CONSTRAINT PK_T_BANKCARDDTL PRIMARY KEY (REFNO);

/*==============================================================*/
/* Index: IDX_BANKCARDDTL_CUSTID                                */
/*==============================================================*/
CREATE INDEX IDX_BANKCARDDTL_CUSTID ON T_BANKCARDDTL (
   CUSTID ASC
);

/*==============================================================*/
/* Index: IDX_BANKCARDDTL_SNO                                   */
/*==============================================================*/
CREATE INDEX IDX_BANKCARDDTL_SNO ON T_BANKCARDDTL (
   STUEMPNO ASC
);

/*==============================================================*/
/* Index: IDX_BANKCARDDTL_OPTYPE                                */
/*==============================================================*/
CREATE INDEX IDX_BANKCARDDTL_OPTYPE ON T_BANKCARDDTL (
   OPTYPE ASC
);

/*==============================================================*/
/* Index: IDX_BANKCARDDTL_TRANSDATE                             */
/*==============================================================*/
CREATE INDEX IDX_BANKCARDDTL_TRANSDATE ON T_BANKCARDDTL (
   TRANSDATE ASC
);

/*==============================================================*/
/* Table: T_BANKCARDTMP                                         */
/*==============================================================*/
CREATE TABLE T_BANKCARDTMP  (
   RECORDNO             NUMBER(9)                       NOT NULL,
   TERMID               INTEGER,
   BATCHNO              VARCHAR2(20),
   OPERCODE             VARCHAR2(8),
   CUSTID               NUMBER(9),
   STUEMPNO             VARCHAR2(20),
   BANKCARDNO           VARCHAR2(20),
   OPTYPE               NUMBER(1),
   TRANSDATE            VARCHAR2(8),
   STATUS               NUMBER(1)                       NOT NULL,
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_BANKCARDTMP.RECORDNO IS
'记录号';

COMMENT ON COLUMN T_BANKCARDTMP.TERMID IS
'终端号';

COMMENT ON COLUMN T_BANKCARDTMP.BATCHNO IS
'导入批次号';

COMMENT ON COLUMN T_BANKCARDTMP.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_BANKCARDTMP.CUSTID IS
'客户号';

COMMENT ON COLUMN T_BANKCARDTMP.STUEMPNO IS
'学工号';

COMMENT ON COLUMN T_BANKCARDTMP.BANKCARDNO IS
'银行卡号';

COMMENT ON COLUMN T_BANKCARDTMP.OPTYPE IS
'1- 签约2-解约3- 同步';

COMMENT ON COLUMN T_BANKCARDTMP.TRANSDATE IS
'处理日期';

COMMENT ON COLUMN T_BANKCARDTMP.STATUS IS
'1无效记录2待处理记录3处理失败4处理成功';

COMMENT ON COLUMN T_BANKCARDTMP.REMARK IS
'备注';

ALTER TABLE T_BANKCARDTMP
   ADD CONSTRAINT PK_T_BANKCARDTMP PRIMARY KEY (RECORDNO);

/*==============================================================*/
/* Index: IDX_BANKCARDTMP_STATUS                                */
/*==============================================================*/
CREATE INDEX IDX_BANKCARDTMP_STATUS ON T_BANKCARDTMP (
   STATUS ASC
);

/*==============================================================*/
/* Index: IDX_BANKCARDTMP_BATCHNO                               */
/*==============================================================*/
CREATE INDEX IDX_BANKCARDTMP_BATCHNO ON T_BANKCARDTMP (
   BATCHNO ASC
);

/*==============================================================*/
/* Table: T_BANKCHKDTL                                          */
/*==============================================================*/
CREATE TABLE T_BANKCHKDTL  (
   BANKID               NUMBER(9)                       NOT NULL,
   BANKDATE             NUMBER(8)                       NOT NULL,
   RECORDNO             NUMBER(9)                       NOT NULL,
   AMOUNT               NUMBER(15,2)                    NOT NULL,
   TRANSDATE            NUMBER(8),
   CHKRESULT            CHAR(1)                        DEFAULT 'I',
   RESOLVED             CHAR(1),
   REMARK               VARCHAR2(240),
   LOCALSNO             VARCHAR2(20),
   BANKSNO              VARCHAR2(20),
   BANKCARDNO           VARCHAR2(20),
   CARDNO               NUMBER(9),
   CUSTID               NUMBER(9),
   STUEMPNO             VARCHAR2(20),
   OPERCODE             VARCHAR2(8)
);

COMMENT ON COLUMN T_BANKCHKDTL.BANKID IS
'银行标识';

COMMENT ON COLUMN T_BANKCHKDTL.BANKDATE IS
'账单日期';

COMMENT ON COLUMN T_BANKCHKDTL.RECORDNO IS
'记录号';

COMMENT ON COLUMN T_BANKCHKDTL.AMOUNT IS
'发生额';

COMMENT ON COLUMN T_BANKCHKDTL.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_BANKCHKDTL.CHKRESULT IS
'对账结果:I-未对账 = 一致,存在 ,N一卡通不存在U一卡通未记账,X金额不等B银行不存在';

COMMENT ON COLUMN T_BANKCHKDTL.RESOLVED IS
'‘S''-挂起''I''忽略''A''-补账''R''已处理';

COMMENT ON COLUMN T_BANKCHKDTL.REMARK IS
'备注';

COMMENT ON COLUMN T_BANKCHKDTL.LOCALSNO IS
'本地流水号';

COMMENT ON COLUMN T_BANKCHKDTL.BANKSNO IS
'银行流水号';

COMMENT ON COLUMN T_BANKCHKDTL.BANKCARDNO IS
'银行卡号';

COMMENT ON COLUMN T_BANKCHKDTL.CARDNO IS
'卡号';

COMMENT ON COLUMN T_BANKCHKDTL.CUSTID IS
'客户号';

COMMENT ON COLUMN T_BANKCHKDTL.STUEMPNO IS
'学工号';

COMMENT ON COLUMN T_BANKCHKDTL.OPERCODE IS
'操作员';

ALTER TABLE T_BANKCHKDTL
   ADD CONSTRAINT PK_T_BANKCHKDTL PRIMARY KEY (BANKID, BANKDATE, RECORDNO);

/*==============================================================*/
/* Index: IDX_BANKCHKDTL_BANKCARDNO                             */
/*==============================================================*/
CREATE INDEX IDX_BANKCHKDTL_BANKCARDNO ON T_BANKCHKDTL (
   BANKCARDNO ASC
);

/*==============================================================*/
/* Table: T_BANKCHKFILE                                         */
/*==============================================================*/
CREATE TABLE T_BANKCHKFILE  (
   BANKDATE             NUMBER(8)                       NOT NULL,
   BANKID               NUMBER(9)                       NOT NULL,
   BANKCHKFILE          VARCHAR2(240),
   LOCALCHKFILE         VARCHAR2(240),
   LOCALCVTFILE         VARCHAR2(240),
   FILESOURCE           CHAR(1),
   STATUS               CHAR(1),
   RESOLVED             CHAR(1),
   REMARK               VARCHAR2(240),
   BANKCNT              NUMBER(9),
   BANKAMT              NUMBER(15,2),
   LOCALCNT             NUMBER(9),
   LOCALAMT             NUMBER(15,2),
   CRTTIME              VARCHAR2(14),
   UPDTIME              VARCHAR2(14)
);

COMMENT ON COLUMN T_BANKCHKFILE.BANKDATE IS
'账单日期';

COMMENT ON COLUMN T_BANKCHKFILE.BANKID IS
'银行标识';

COMMENT ON COLUMN T_BANKCHKFILE.BANKCHKFILE IS
'银行对账文件名';

COMMENT ON COLUMN T_BANKCHKFILE.LOCALCHKFILE IS
'本地对账文件名';

COMMENT ON COLUMN T_BANKCHKFILE.LOCALCVTFILE IS
'本地转换文件名';

COMMENT ON COLUMN T_BANKCHKFILE.FILESOURCE IS
'''L‘ 本地 ’B''银行';

COMMENT ON COLUMN T_BANKCHKFILE.STATUS IS
'核对状态:F下载文件中V转换中C对账中S对账完成';

COMMENT ON COLUMN T_BANKCHKFILE.RESOLVED IS
'‘N’正常''I''忽略‘,‘E''错误,S-''挂起’ C-''关闭''';

COMMENT ON COLUMN T_BANKCHKFILE.REMARK IS
'备注';

COMMENT ON COLUMN T_BANKCHKFILE.BANKCNT IS
'银行总条数';

COMMENT ON COLUMN T_BANKCHKFILE.BANKAMT IS
'银行总金额';

COMMENT ON COLUMN T_BANKCHKFILE.LOCALCNT IS
'本地总数';

COMMENT ON COLUMN T_BANKCHKFILE.LOCALAMT IS
'本地总金额';

COMMENT ON COLUMN T_BANKCHKFILE.CRTTIME IS
'记录创建时间';

COMMENT ON COLUMN T_BANKCHKFILE.UPDTIME IS
'最后保存时间';

ALTER TABLE T_BANKCHKFILE
   ADD CONSTRAINT PK_T_BANKCHKFILE PRIMARY KEY (BANKID, BANKDATE);

/*==============================================================*/
/* Table: T_BRANCH                                              */
/*==============================================================*/
CREATE TABLE T_BRANCH  (
   BRANCHNO             NUMBER(9)                       NOT NULL,
   AREACODE             VARCHAR2(3),
   BRANCHNAME           VARCHAR2(60),
   BRANCHTYPE           CHAR(1),
   BANKCODE             VARCHAR2(8),
   BANKACCNO            VARCHAR2(20),
   BANKACCNAME          VARCHAR2(90),
   CONTACTMAN           VARCHAR2(60),
   TEL                  VARCHAR2(20),
   MOBILE               VARCHAR2(20),
   FAX                  VARCHAR2(30),
   ADDR                 VARCHAR2(240),
   ZIPCODE              VARCHAR2(6),
   STATUS               CHAR(1),
   OPENDATE             VARCHAR2(8),
   CLOSEDATE            VARCHAR2(8),
   USEFLAG              CHAR(1),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_BRANCH.BRANCHNO IS
'网点号';

COMMENT ON COLUMN T_BRANCH.AREACODE IS
'区域代码';

COMMENT ON COLUMN T_BRANCH.BRANCHNAME IS
'网点名称';

COMMENT ON COLUMN T_BRANCH.BRANCHTYPE IS
'网点类型：1-管理中心2-充值点3-超市';

COMMENT ON COLUMN T_BRANCH.BANKCODE IS
'银行代码';

COMMENT ON COLUMN T_BRANCH.BANKACCNO IS
'银行帐户';

COMMENT ON COLUMN T_BRANCH.BANKACCNAME IS
'银行帐户名';

COMMENT ON COLUMN T_BRANCH.CONTACTMAN IS
'联系人';

COMMENT ON COLUMN T_BRANCH.TEL IS
'电话';

COMMENT ON COLUMN T_BRANCH.MOBILE IS
'手机';

COMMENT ON COLUMN T_BRANCH.FAX IS
'传真';

COMMENT ON COLUMN T_BRANCH.ADDR IS
'地址';

COMMENT ON COLUMN T_BRANCH.ZIPCODE IS
'邮政编码';

COMMENT ON COLUMN T_BRANCH.STATUS IS
'状态';

COMMENT ON COLUMN T_BRANCH.OPENDATE IS
'注册日期';

COMMENT ON COLUMN T_BRANCH.CLOSEDATE IS
'注销日期';

COMMENT ON COLUMN T_BRANCH.USEFLAG IS
'使用状态 0-未使用1-已使用';

COMMENT ON COLUMN T_BRANCH.LASTSAVED IS
'保存时间';

ALTER TABLE T_BRANCH
   ADD CONSTRAINT PK_T_BRANCH PRIMARY KEY (BRANCHNO);

/*==============================================================*/
/* Table: T_BRASTRANSDTL                                        */
/*==============================================================*/
CREATE TABLE T_BRASTRANSDTL  (
   REFNO                VARCHAR2(14)                    NOT NULL,
   CARDNO               NUMBER(9),
   STUEMPNO             VARCHAR2(20),
   CUSTNAME             VARCHAR2(60),
   OPPACCNO             VARCHAR2(10),
   OPPACCNAME           VARCHAR2(60),
   TRANSDATE            VARCHAR2(8),
   TRANSTIME            VARCHAR2(6),
   TRANSTYPE            NUMBER(9),
   SUMMARY              VARCHAR2(60),
   TRANSAMT             NUMBER(15,2),
   STATUS               NUMBER(1),
   CHKFLAG              NUMBER(1),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_BRASTRANSDTL.REFNO IS
'交易参考号';

COMMENT ON COLUMN T_BRASTRANSDTL.CARDNO IS
'卡号';

COMMENT ON COLUMN T_BRASTRANSDTL.STUEMPNO IS
'学工号';

COMMENT ON COLUMN T_BRASTRANSDTL.CUSTNAME IS
'姓名';

COMMENT ON COLUMN T_BRASTRANSDTL.OPPACCNO IS
'对方账号';

COMMENT ON COLUMN T_BRASTRANSDTL.OPPACCNAME IS
'对方账户名';

COMMENT ON COLUMN T_BRASTRANSDTL.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_BRASTRANSDTL.TRANSTIME IS
'交易时间';

COMMENT ON COLUMN T_BRASTRANSDTL.TRANSTYPE IS
'交易类型';

COMMENT ON COLUMN T_BRASTRANSDTL.SUMMARY IS
'摘要';

COMMENT ON COLUMN T_BRASTRANSDTL.TRANSAMT IS
'交易金额';

COMMENT ON COLUMN T_BRASTRANSDTL.STATUS IS
'处理结果0-成功1失败';

COMMENT ON COLUMN T_BRASTRANSDTL.CHKFLAG IS
'对账标志';

COMMENT ON COLUMN T_BRASTRANSDTL.REMARK IS
'备注';

ALTER TABLE T_BRASTRANSDTL
   ADD CONSTRAINT PK_T_BRASTRANSDTL PRIMARY KEY (REFNO);

/*==============================================================*/
/* Table: T_BUSDTL                                              */
/*==============================================================*/
CREATE TABLE T_BUSDTL  (
   TRANSDATE            VARCHAR2(8)                     NOT NULL,
   TRANSTIME            VARCHAR2(6),
   DEVPHYID             VARCHAR2(20)                    NOT NULL,
   DEVSEQNO             NUMBER(9)                       NOT NULL,
   CARDNO               NUMBER(9)                       NOT NULL,
   CARDCNT              NUMBER(9),
   CARDBEFBAL           NUMBER(15,2),
   AMOUNT               NUMBER(15,2),
   CARDAFTBAL           NUMBER(15,2),
   TRANSMARK            NUMBER(9),
   DATATYPE             NUMBER(1),
   SHOPID               NUMBER(9)                       NOT NULL,
   STUEMPNO             VARCHAR2(20),
   CUSTID               NUMBER(9)                       NOT NULL,
   CUSTNAME             VARCHAR2(60),
   DEPTCODE             VARCHAR2(30),
   FEETYPE              NUMBER(9),
   BATCHNO              VARCHAR2(20),
   COLDATE              VARCHAR2(8),
   COLTIME              VARCHAR2(6),
   ACCDATE              VARCHAR2(8),
   ACCTIME              VARCHAR2(6),
   TERMID               NUMBER(9),
   TERMSEQNO            NUMBER(9),
   STATUS               CHAR(1)                         NOT NULL,
   ERRCODE              NUMBER(9),
   ERRMSG               VARCHAR2(240)
);

COMMENT ON COLUMN T_BUSDTL.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_BUSDTL.TRANSTIME IS
'交易时间';

COMMENT ON COLUMN T_BUSDTL.DEVPHYID IS
'设备物理ID';

COMMENT ON COLUMN T_BUSDTL.DEVSEQNO IS
'设备流水号';

COMMENT ON COLUMN T_BUSDTL.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_BUSDTL.CARDCNT IS
'卡交易次数';

COMMENT ON COLUMN T_BUSDTL.CARDBEFBAL IS
'交易前卡余额';

COMMENT ON COLUMN T_BUSDTL.AMOUNT IS
'发生额-包含管理费';

COMMENT ON COLUMN T_BUSDTL.CARDAFTBAL IS
'交易后卡余额';

COMMENT ON COLUMN T_BUSDTL.TRANSMARK IS
'交易标记';

COMMENT ON COLUMN T_BUSDTL.DATATYPE IS
'数据类型';

COMMENT ON COLUMN T_BUSDTL.SHOPID IS
'商户号';

COMMENT ON COLUMN T_BUSDTL.STUEMPNO IS
'学号';

COMMENT ON COLUMN T_BUSDTL.CUSTID IS
'客户号';

COMMENT ON COLUMN T_BUSDTL.CUSTNAME IS
'客户姓名';

COMMENT ON COLUMN T_BUSDTL.DEPTCODE IS
'部门代码';

COMMENT ON COLUMN T_BUSDTL.FEETYPE IS
'收费类别';

COMMENT ON COLUMN T_BUSDTL.BATCHNO IS
'导入批次号';

COMMENT ON COLUMN T_BUSDTL.COLDATE IS
'采集日期';

COMMENT ON COLUMN T_BUSDTL.COLTIME IS
'采集时间';

COMMENT ON COLUMN T_BUSDTL.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_BUSDTL.ACCTIME IS
'记账时间';

COMMENT ON COLUMN T_BUSDTL.TERMID IS
'终端号';

COMMENT ON COLUMN T_BUSDTL.TERMSEQNO IS
'终端流水号';

COMMENT ON COLUMN T_BUSDTL.STATUS IS
'状态';

COMMENT ON COLUMN T_BUSDTL.ERRCODE IS
'错误码';

COMMENT ON COLUMN T_BUSDTL.ERRMSG IS
'错误信息';

ALTER TABLE T_BUSDTL
   ADD CONSTRAINT PK_T_BUSDTL PRIMARY KEY (TRANSDATE, DEVPHYID, DEVSEQNO);

/*==============================================================*/
/* Index: IDX_BUSDTL_STATUS                                     */
/*==============================================================*/
CREATE INDEX IDX_BUSDTL_STATUS ON T_BUSDTL (
   STATUS ASC
);

/*==============================================================*/
/* Index: IDX_BUSDTL_SHOPID                                     */
/*==============================================================*/
CREATE INDEX IDX_BUSDTL_SHOPID ON T_BUSDTL (
   SHOPID ASC
);

/*==============================================================*/
/* Index: IDX_BUSDTL_CUSTID                                     */
/*==============================================================*/
CREATE INDEX IDX_BUSDTL_CUSTID ON T_BUSDTL (
   CUSTID ASC
);

/*==============================================================*/
/* Index: IDX_BUSDTL_STUEMPNO                                   */
/*==============================================================*/
CREATE INDEX IDX_BUSDTL_STUEMPNO ON T_BUSDTL (
   STUEMPNO ASC
);

/*==============================================================*/
/* Table: T_BUSFEETYPE                                          */
/*==============================================================*/
CREATE TABLE T_BUSFEETYPE  (
   BUSFEETYPE           NUMBER(3)                       NOT NULL,
   BUSFEENAME           VARCHAR2(60)                    NOT NULL
);

COMMENT ON COLUMN T_BUSFEETYPE.BUSFEETYPE IS
'收费类别';

COMMENT ON COLUMN T_BUSFEETYPE.BUSFEENAME IS
'收费名称';

ALTER TABLE T_BUSFEETYPE
   ADD CONSTRAINT PK_T_BUSFEETYPE PRIMARY KEY (BUSFEETYPE);

/*==============================================================*/
/* Table: T_CARD                                                */
/*==============================================================*/
CREATE TABLE T_CARD  (
   CARDNO               NUMBER(9)                       NOT NULL,
   OLDCARDNO            NUMBER(9),
   ACCNO                VARCHAR2(10)                    NOT NULL,
   CARDTYPE             NUMBER(2),
   CARDPHYTYPE          NUMBER(9),
   FEETYPE              NUMBER(3)                       NOT NULL,
   CUSTID               NUMBER(9),
   SHOWCARDNO           VARCHAR2(10),
   CARDPHYID            VARCHAR2(16),
   CARDPWD              VARCHAR2(32),
   EXPIREDATE           VARCHAR2(8)                     NOT NULL,
   STATUS               CHAR(1)                         NOT NULL,
   LOSSFLAG             CHAR(1)                         NOT NULL,
   LOSSDATE             VARCHAR2(8),
   RENEWFLAG            NUMBER(1),
   RENEWDATE            VARCHAR2(8),
   RENEWCARDNO          NUMBER(9),
   LOSSEFTTIME          VARCHAR2(14),
   FROZEFLAG            CHAR(1)                         NOT NULL,
   FROZEDATE            VARCHAR2(8),
   BADFLAG              CHAR(1)                         NOT NULL,
   BADTYPE              CHAR(1),
   BADDATE              VARCHAR2(8),
   LOCKFLAG             CHAR(1)                         NOT NULL,
   LOCKDATE             VARCHAR2(8),
   OPENDATE             VARCHAR2(8)                     NOT NULL,
   CLOSEDATE            VARCHAR2(8),
   CARDVERNO            VARCHAR2(12),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_CARD.CARDNO IS
'卡号';

COMMENT ON COLUMN T_CARD.OLDCARDNO IS
'原卡号';

COMMENT ON COLUMN T_CARD.ACCNO IS
'卡账号';

COMMENT ON COLUMN T_CARD.CARDTYPE IS
'卡类型';

COMMENT ON COLUMN T_CARD.CARDPHYTYPE IS
'卡物理类型';

COMMENT ON COLUMN T_CARD.FEETYPE IS
'收费类型';

COMMENT ON COLUMN T_CARD.CUSTID IS
'客户号';

COMMENT ON COLUMN T_CARD.SHOWCARDNO IS
'显示卡号';

COMMENT ON COLUMN T_CARD.CARDPHYID IS
'卡物理ID';

COMMENT ON COLUMN T_CARD.CARDPWD IS
'卡密码';

COMMENT ON COLUMN T_CARD.EXPIREDATE IS
'到期日期';

COMMENT ON COLUMN T_CARD.STATUS IS
'记录状态0-未确认1-正常2-注销';

COMMENT ON COLUMN T_CARD.LOSSFLAG IS
'1-挂失0-未挂失';

COMMENT ON COLUMN T_CARD.LOSSDATE IS
'挂失日期';

COMMENT ON COLUMN T_CARD.RENEWFLAG IS
'补办标志';

COMMENT ON COLUMN T_CARD.RENEWDATE IS
'补办日期';

COMMENT ON COLUMN T_CARD.RENEWCARDNO IS
'补办卡号';

COMMENT ON COLUMN T_CARD.LOSSEFTTIME IS
'挂失生效时间';

COMMENT ON COLUMN T_CARD.FROZEFLAG IS
'1-冻结0-未冻结';

COMMENT ON COLUMN T_CARD.FROZEDATE IS
'冻结日期';

COMMENT ON COLUMN T_CARD.BADFLAG IS
'1-坏卡0-不是坏卡';

COMMENT ON COLUMN T_CARD.BADTYPE IS
'0-卡结构错误1-人为损坏2-质量问题';

COMMENT ON COLUMN T_CARD.BADDATE IS
'坏卡登记日期';

COMMENT ON COLUMN T_CARD.LOCKFLAG IS
'锁定标志';

COMMENT ON COLUMN T_CARD.LOCKDATE IS
'锁定日期';

COMMENT ON COLUMN T_CARD.OPENDATE IS
'开卡日期';

COMMENT ON COLUMN T_CARD.CLOSEDATE IS
'注销日期';

COMMENT ON COLUMN T_CARD.CARDVERNO IS
'卡版本号';

COMMENT ON COLUMN T_CARD.LASTSAVED IS
'最后保存时间';

ALTER TABLE T_CARD
   ADD CONSTRAINT PK_T_CARD PRIMARY KEY (CARDNO);

/*==============================================================*/
/* Index: INDEX_CARD_CARDTYPE                                   */
/*==============================================================*/
CREATE INDEX INDEX_CARD_CARDTYPE ON T_CARD (
   CARDTYPE ASC
);

/*==============================================================*/
/* Index: IDEX_CARD_CUSTID                                      */
/*==============================================================*/
CREATE INDEX IDEX_CARD_CUSTID ON T_CARD (
   CUSTID ASC
);

/*==============================================================*/
/* Table: T_CARDBALANCE                                         */
/*==============================================================*/
CREATE TABLE T_CARDBALANCE  (
   ACCNO                VARCHAR2(10)                    NOT NULL,
   PURSETYPE            NUMBER(1)                       NOT NULL,
   CARDNO               NUMBER(9)                       NOT NULL,
   OLDCARDNO            NUMBER(9),
   TRANSDATE            VARCHAR2(8),
   TRANSTIME            VARCHAR2(6),
   DPSCNT               NUMBER(9)                       NOT NULL,
   PAYCNT               NUMBER(9),
   BALANCE              NUMBER(15,2),
   CARDBAL              NUMBER(15,2)                    NOT NULL,
   ACCUMDPSAMT          NUMBER(15,2)
);

COMMENT ON COLUMN T_CARDBALANCE.ACCNO IS
'账号';

COMMENT ON COLUMN T_CARDBALANCE.PURSETYPE IS
'钱包类型';

COMMENT ON COLUMN T_CARDBALANCE.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_CARDBALANCE.OLDCARDNO IS
'原卡号';

COMMENT ON COLUMN T_CARDBALANCE.TRANSDATE IS
'最后交易日期';

COMMENT ON COLUMN T_CARDBALANCE.TRANSTIME IS
'最后交易时间';

COMMENT ON COLUMN T_CARDBALANCE.DPSCNT IS
'充值次数';

COMMENT ON COLUMN T_CARDBALANCE.PAYCNT IS
'消费次数';

COMMENT ON COLUMN T_CARDBALANCE.BALANCE IS
'账户余额';

COMMENT ON COLUMN T_CARDBALANCE.CARDBAL IS
'卡余额';

COMMENT ON COLUMN T_CARDBALANCE.ACCUMDPSAMT IS
'累计充值金额';

ALTER TABLE T_CARDBALANCE
   ADD CONSTRAINT PK_T_CARDBALANCE PRIMARY KEY (ACCNO, PURSETYPE);

/*==============================================================*/
/* Index: IDX_CARDBALANCE_CARDNO                                */
/*==============================================================*/
CREATE INDEX IDX_CARDBALANCE_CARDNO ON T_CARDBALANCE (
   PURSETYPE ASC,
   CARDNO ASC
);

/*==============================================================*/
/* Table: T_CARDBALUPDLIST                                      */
/*==============================================================*/
CREATE TABLE T_CARDBALUPDLIST  (
   BATCHNO              VARCHAR2(20)                    NOT NULL,
   SEQNO                NUMBER(9)                       NOT NULL,
   CARDNO               NUMBER(9)                       NOT NULL,
   TRANSDATE            NUMBER(8),
   STATUS               CHAR(1)                         NOT NULL,
   AMOUNT               NUMBER(15,2)                    NOT NULL,
   SUMMARY              VARCHAR2(60),
   TRANSCODE            NUMBER(9),
   REMARK               VARCHAR2(240),
   LASTUPDTIME          VARCHAR2(30)
);

COMMENT ON COLUMN T_CARDBALUPDLIST.BATCHNO IS
'批次号';

COMMENT ON COLUMN T_CARDBALUPDLIST.SEQNO IS
'下发序号';

COMMENT ON COLUMN T_CARDBALUPDLIST.CARDNO IS
'卡号';

COMMENT ON COLUMN T_CARDBALUPDLIST.TRANSDATE IS
'发生日期';

COMMENT ON COLUMN T_CARDBALUPDLIST.STATUS IS
'N-未处理P已下发S已领取F写卡失败I写卡中断C撤销';

COMMENT ON COLUMN T_CARDBALUPDLIST.AMOUNT IS
'补写金额正为加钱负为减钱';

COMMENT ON COLUMN T_CARDBALUPDLIST.SUMMARY IS
'摘要';

COMMENT ON COLUMN T_CARDBALUPDLIST.TRANSCODE IS
'原交易代码';

COMMENT ON COLUMN T_CARDBALUPDLIST.REMARK IS
'备注';

COMMENT ON COLUMN T_CARDBALUPDLIST.LASTUPDTIME IS
'更新时间';

ALTER TABLE T_CARDBALUPDLIST
   ADD CONSTRAINT PK_T_CARDBALUPDLIST PRIMARY KEY (BATCHNO, SEQNO);

/*==============================================================*/
/* Index: IDX_CARDBALUPDLIST_CARDNO                             */
/*==============================================================*/
CREATE INDEX IDX_CARDBALUPDLIST_CARDNO ON T_CARDBALUPDLIST (
   CARDNO ASC,
   STATUS ASC
);

/*==============================================================*/
/* Table: T_CARDBITMAP                                          */
/*==============================================================*/
CREATE TABLE T_CARDBITMAP  (
   CARDNO               NUMBER(9)                       NOT NULL,
   BASENO               NUMBER(9),
   BITMAP0              VARCHAR2(100),
   BITMAP1              VARCHAR2(100),
   BITMAP2              VARCHAR2(100),
   BITMAP3              VARCHAR2(100),
   BITMAP4              VARCHAR2(100),
   BITMAP5              VARCHAR2(100),
   BITMAP6              VARCHAR2(100),
   BITMAP7              VARCHAR2(100),
   BITMAP8              VARCHAR2(100),
   BITMAP9              VARCHAR2(100),
   DELFLAG              NUMBER(1)
);

COMMENT ON COLUMN T_CARDBITMAP.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_CARDBITMAP.BASENO IS
'基准卡流水号';

COMMENT ON COLUMN T_CARDBITMAP.BITMAP0 IS
'位图0';

COMMENT ON COLUMN T_CARDBITMAP.BITMAP1 IS
'位图1';

COMMENT ON COLUMN T_CARDBITMAP.BITMAP2 IS
'位图2';

COMMENT ON COLUMN T_CARDBITMAP.BITMAP3 IS
'位图3';

COMMENT ON COLUMN T_CARDBITMAP.BITMAP4 IS
'位图4';

COMMENT ON COLUMN T_CARDBITMAP.BITMAP5 IS
'位图5';

COMMENT ON COLUMN T_CARDBITMAP.BITMAP6 IS
'位图6';

COMMENT ON COLUMN T_CARDBITMAP.BITMAP7 IS
'位图7';

COMMENT ON COLUMN T_CARDBITMAP.BITMAP8 IS
'位图8';

COMMENT ON COLUMN T_CARDBITMAP.BITMAP9 IS
'位图9';

COMMENT ON COLUMN T_CARDBITMAP.DELFLAG IS
'删除标志';

ALTER TABLE T_CARDBITMAP
   ADD CONSTRAINT PK_T_CARDBITMAP PRIMARY KEY (CARDNO);

/*==============================================================*/
/* Table: T_CARDBOOK                                            */
/*==============================================================*/
CREATE TABLE T_CARDBOOK  (
   SHOWCARDNO           NUMBER(10)                      NOT NULL,
   CARDTYPE             NUMBER(2)                       NOT NULL,
   CARDPHYID            VARCHAR2(16),
   OPERCODE             VARCHAR2(8)                     NOT NULL,
   PUTOPERCODE          VARCHAR2(8),
   BATCHNO              VARCHAR2(30),
   GETDATE              VARCHAR2(8),
   USEDATE              VARCHAR2(8),
   RECLAIMDATE          VARCHAR2(8),
   USESTATUS            NUMBER(1)                       NOT NULL
);

COMMENT ON COLUMN T_CARDBOOK.SHOWCARDNO IS
'记录号';

COMMENT ON COLUMN T_CARDBOOK.CARDTYPE IS
'卡类型';

COMMENT ON COLUMN T_CARDBOOK.CARDPHYID IS
'卡物理ID';

COMMENT ON COLUMN T_CARDBOOK.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_CARDBOOK.PUTOPERCODE IS
'转交操作员';

COMMENT ON COLUMN T_CARDBOOK.BATCHNO IS
'领入批次号';

COMMENT ON COLUMN T_CARDBOOK.GETDATE IS
'领入日期';

COMMENT ON COLUMN T_CARDBOOK.USEDATE IS
'使用日期';

COMMENT ON COLUMN T_CARDBOOK.RECLAIMDATE IS
'回收日期';

COMMENT ON COLUMN T_CARDBOOK.USESTATUS IS
'使用状态';

ALTER TABLE T_CARDBOOK
   ADD CONSTRAINT PK_T_CARDBOOK PRIMARY KEY (SHOWCARDNO);

/*==============================================================*/
/* Table: T_CARDDIFF                                            */
/*==============================================================*/
CREATE TABLE T_CARDDIFF  (
   CARDNO               NUMBER(9)                       NOT NULL,
   STATDATE             NUMBER(8)                       NOT NULL,
   BALANCE              NUMBER(9)                       NOT NULL,
   AMOUNT               NUMBER(9)                       NOT NULL,
   DIFFAMT              NUMBER(9)                       NOT NULL,
   STATTIME             VARCHAR2(14)                    NOT NULL
);

COMMENT ON COLUMN T_CARDDIFF.CARDNO IS
'卡号';

COMMENT ON COLUMN T_CARDDIFF.STATDATE IS
'统计日期';

COMMENT ON COLUMN T_CARDDIFF.BALANCE IS
'账户余额';

COMMENT ON COLUMN T_CARDDIFF.AMOUNT IS
'不平变化量';

COMMENT ON COLUMN T_CARDDIFF.DIFFAMT IS
'账户余额 - 卡余额';

COMMENT ON COLUMN T_CARDDIFF.STATTIME IS
'统计时间';

ALTER TABLE T_CARDDIFF
   ADD CONSTRAINT PK_T_CARDDIFF PRIMARY KEY (CARDNO, STATDATE);

/*==============================================================*/
/* Table: T_CARDLOSTDTL                                         */
/*==============================================================*/
CREATE TABLE T_CARDLOSTDTL  (
   CARDNO               NUMBER(9)                       NOT NULL,
   DPSCNT               NUMBER(9)                      DEFAULT 0 NOT NULL,
   PAYCNT               NUMBER(9)                      DEFAULT 0 NOT NULL,
   CARDBEFBAL           NUMBER(9)                      DEFAULT 0 NOT NULL,
   AMOUNT               NUMBER(9)                       NOT NULL,
   CARDAFTBAL           NUMBER(9)                      DEFAULT 0 NOT NULL,
   TRANSFLAG            NUMBER(1)                       NOT NULL,
   TRANSDATE            NUMBER(8)                       NOT NULL,
   DATATYPE             NUMBER(1),
   CREATEDATE           NUMBER(8)                       NOT NULL,
   CHKFLAG              NUMBER(1)                      DEFAULT 0 NOT NULL,
   CHKDATE              NUMBER(8),
   CHKOPERID            NUMBER(9),
   HANDLED              NUMBER(1)                      DEFAULT 0 NOT NULL,
   ACCDATE              NUMBER(8)                      DEFAULT 0
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_CARDLOSTDTL.CARDNO IS
'卡号';

COMMENT ON COLUMN T_CARDLOSTDTL.DPSCNT IS
'卡充值次数';

COMMENT ON COLUMN T_CARDLOSTDTL.PAYCNT IS
'消费次数';

COMMENT ON COLUMN T_CARDLOSTDTL.CARDBEFBAL IS
'交易前卡余额';

COMMENT ON COLUMN T_CARDLOSTDTL.AMOUNT IS
'交易金额';

COMMENT ON COLUMN T_CARDLOSTDTL.CARDAFTBAL IS
'交易后卡余额';

COMMENT ON COLUMN T_CARDLOSTDTL.TRANSFLAG IS
'1充值2消费';

COMMENT ON COLUMN T_CARDLOSTDTL.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_CARDLOSTDTL.DATATYPE IS
'0-可疑1-丢失2中途拔卡9其他';

COMMENT ON COLUMN T_CARDLOSTDTL.CREATEDATE IS
'创建日期';

COMMENT ON COLUMN T_CARDLOSTDTL.CHKFLAG IS
'0-未审核1已审核2拒绝';

COMMENT ON COLUMN T_CARDLOSTDTL.CHKDATE IS
'审核日期';

COMMENT ON COLUMN T_CARDLOSTDTL.CHKOPERID IS
'审核操作员';

COMMENT ON COLUMN T_CARDLOSTDTL.HANDLED IS
'0-未记账1已记账';

COMMENT ON COLUMN T_CARDLOSTDTL.ACCDATE IS
'记账日期';

ALTER TABLE T_CARDLOSTDTL
   ADD CONSTRAINT PK_T_CARDLOSTDTL PRIMARY KEY (CARDNO, DPSCNT, PAYCNT, CARDBEFBAL);

/*==============================================================*/
/* Table: T_CARDNOCHANGE                                        */
/*==============================================================*/
CREATE TABLE T_CARDNOCHANGE  (
   OLDCARDNO            NUMBER(9)                       NOT NULL,
   NEWCARDNO            NUMBER(9)                       NOT NULL,
   CHANGEDATE           VARCHAR2(8)
);

COMMENT ON COLUMN T_CARDNOCHANGE.OLDCARDNO IS
'旧卡号';

COMMENT ON COLUMN T_CARDNOCHANGE.NEWCARDNO IS
'新卡号';

COMMENT ON COLUMN T_CARDNOCHANGE.CHANGEDATE IS
'变更日期';

ALTER TABLE T_CARDNOCHANGE
   ADD CONSTRAINT PK_T_CARDNOCHANGE PRIMARY KEY (OLDCARDNO);

/*==============================================================*/
/* Table: T_CARDPHYTYPE                                         */
/*==============================================================*/
CREATE TABLE T_CARDPHYTYPE  (
   CARDPHYTYPE          NUMBER(2)                       NOT NULL,
   CARDPHYTYPENAME      VARCHAR2(60)                    NOT NULL,
   USEFLAG              NUMBER(1)                      DEFAULT 0 NOT NULL,
   CARDPHYTYPECODE      NUMBER(9)                      DEFAULT 0 NOT NULL,
   KEYGROUP             NUMBER(9)
);

COMMENT ON COLUMN T_CARDPHYTYPE.CARDPHYTYPE IS
'卡类型';

COMMENT ON COLUMN T_CARDPHYTYPE.CARDPHYTYPENAME IS
'卡类别名称';

COMMENT ON COLUMN T_CARDPHYTYPE.USEFLAG IS
'是否启用';

COMMENT ON COLUMN T_CARDPHYTYPE.CARDPHYTYPECODE IS
'卡物理类型编码';

COMMENT ON COLUMN T_CARDPHYTYPE.KEYGROUP IS
'KEYGROUP';

ALTER TABLE T_CARDPHYTYPE
   ADD CONSTRAINT PK_T_CARDPHYTYPE PRIMARY KEY (CARDPHYTYPE);

/*==============================================================*/
/* Table: T_CARDTRANS                                           */
/*==============================================================*/
CREATE TABLE T_CARDTRANS  (
   CARDNO               NUMBER(9)                       NOT NULL,
   TRANSDATE            VARCHAR2(8)                    DEFAULT TO_CHAR(SYSDATE,'YYYYMMDD') NOT NULL,
   TRANSTIME            VARCHAR2(6)                    DEFAULT TO_CHAR(SYSDATE,'HH24MISS') NOT NULL,
   TRANSCODE            NUMBER(9)                      DEFAULT 0 NOT NULL,
   TERMID               NUMBER(9)                      DEFAULT 0 NOT NULL,
   TERMSEQNO            NUMBER(9)                      DEFAULT 0 NOT NULL,
   DPSCNT               NUMBER(9)                      DEFAULT 0 NOT NULL,
   PAYCNT               NUMBER(9)                      DEFAULT 0 NOT NULL,
   AMOUNT               NUMBER(15,2)                   DEFAULT 0 NOT NULL,
   CARDBEFBAL           NUMBER(15,2)                   DEFAULT 0 NOT NULL,
   CARDAFTBAL           NUMBER(15,2)                   DEFAULT 0 NOT NULL,
   UPDCNT               NUMBER(9)                      DEFAULT 0,
   UPDTIME              CHAR(14)                       DEFAULT TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')
);

COMMENT ON COLUMN T_CARDTRANS.CARDNO IS
'卡号';

COMMENT ON COLUMN T_CARDTRANS.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_CARDTRANS.TRANSTIME IS
'交易时间';

COMMENT ON COLUMN T_CARDTRANS.TRANSCODE IS
'交易代码';

COMMENT ON COLUMN T_CARDTRANS.TERMID IS
'交易终端';

COMMENT ON COLUMN T_CARDTRANS.TERMSEQNO IS
'终端流水号';

COMMENT ON COLUMN T_CARDTRANS.DPSCNT IS
'充值次数';

COMMENT ON COLUMN T_CARDTRANS.PAYCNT IS
'消费次数';

COMMENT ON COLUMN T_CARDTRANS.AMOUNT IS
'交易金额';

COMMENT ON COLUMN T_CARDTRANS.CARDBEFBAL IS
'交易前余额';

COMMENT ON COLUMN T_CARDTRANS.CARDAFTBAL IS
'交易后余额';

COMMENT ON COLUMN T_CARDTRANS.UPDCNT IS
'更新次数';

COMMENT ON COLUMN T_CARDTRANS.UPDTIME IS
'更新时间';

ALTER TABLE T_CARDTRANS
   ADD CONSTRAINT PK_T_CARDTRANS PRIMARY KEY (CARDNO);

/*==============================================================*/
/* Table: T_CARDTRANSDTL                                        */
/*==============================================================*/
CREATE TABLE T_CARDTRANSDTL  (
   CARDNO               NUMBER(9)                       NOT NULL,
   TRANSFLAG            NUMBER(1)                       NOT NULL,
   CARDCNT              NUMBER(9)                       NOT NULL,
   TRANSDATE            VARCHAR2(8)                     NOT NULL,
   TRANSTIME            VARCHAR2(6)                     NOT NULL,
   TERMNO               VARCHAR2(12)                    NOT NULL,
   TERMSNO              NUMBER(9)                       NOT NULL,
   CARDBEFBAL           NUMBER(15,2)                    NOT NULL,
   AMOUNT               NUMBER(15,2)                    NOT NULL,
   ADDAMT               NUMBER(15,2),
   MANAGEFEE            NUMBER(15,2),
   SHOPID               NUMBER(9),
   COLDATE              VARCHAR2(8),
   COLTIME              VARCHAR2(6),
   STATUS               NUMBER(1)                       NOT NULL,
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_CARDTRANSDTL.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_CARDTRANSDTL.TRANSFLAG IS
'交易标志';

COMMENT ON COLUMN T_CARDTRANSDTL.CARDCNT IS
'卡交易次数';

COMMENT ON COLUMN T_CARDTRANSDTL.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_CARDTRANSDTL.TRANSTIME IS
'交易时间';

COMMENT ON COLUMN T_CARDTRANSDTL.TERMNO IS
'终端号';

COMMENT ON COLUMN T_CARDTRANSDTL.TERMSNO IS
'终端流水号';

COMMENT ON COLUMN T_CARDTRANSDTL.CARDBEFBAL IS
'交易前卡余额';

COMMENT ON COLUMN T_CARDTRANSDTL.AMOUNT IS
'发生额-包含管理费';

COMMENT ON COLUMN T_CARDTRANSDTL.ADDAMT IS
'补写金额';

COMMENT ON COLUMN T_CARDTRANSDTL.MANAGEFEE IS
'管理费';

COMMENT ON COLUMN T_CARDTRANSDTL.SHOPID IS
'商户卡号';

COMMENT ON COLUMN T_CARDTRANSDTL.COLDATE IS
'采集日期';

COMMENT ON COLUMN T_CARDTRANSDTL.COLTIME IS
'采集时间';

COMMENT ON COLUMN T_CARDTRANSDTL.STATUS IS
'状态-1初始状态2-入账失败3-成功4-异常流水';

COMMENT ON COLUMN T_CARDTRANSDTL.REMARK IS
'备注';

ALTER TABLE T_CARDTRANSDTL
   ADD CONSTRAINT PK_T_CARDTRANSDTL PRIMARY KEY (TRANSFLAG, CARDCNT, CARDNO);

/*==============================================================*/
/* Table: T_CARDTYPE                                            */
/*==============================================================*/
CREATE TABLE T_CARDTYPE  (
   CARDTYPE             NUMBER(2)                       NOT NULL,
   CARDTYPENAME         VARCHAR2(60),
   CARDPHYTYPE          NUMBER(9),
   ANONYMFLAG           CHAR(1),
   FEETYPE              NUMBER(3),
   CARDCOSTFEE          NUMBER(15,2),
   REUSEABLE            CHAR(1),
   RENEWABLE            CHAR(1),
   RECYCLEABLE          CHAR(1),
   MULTIPURSE           CHAR(1),
   FIXDAYFLAG           CHAR(1),
   FIXDAYCNT            NUMBER(9),
   USEFLAG              CHAR(1),
   PURPOSE              VARCHAR2(240)
);

COMMENT ON COLUMN T_CARDTYPE.CARDTYPE IS
'卡类型';

COMMENT ON COLUMN T_CARDTYPE.CARDTYPENAME IS
'卡类别名称';

COMMENT ON COLUMN T_CARDTYPE.CARDPHYTYPE IS
'卡物理类型';

COMMENT ON COLUMN T_CARDTYPE.ANONYMFLAG IS
'1-匿名0-记名';

COMMENT ON COLUMN T_CARDTYPE.FEETYPE IS
'默认收费类别';

COMMENT ON COLUMN T_CARDTYPE.CARDCOSTFEE IS
'卡成本费';

COMMENT ON COLUMN T_CARDTYPE.REUSEABLE IS
'能否重用:0-不能1-能';

COMMENT ON COLUMN T_CARDTYPE.RENEWABLE IS
'能否补办:0-不能1-能';

COMMENT ON COLUMN T_CARDTYPE.RECYCLEABLE IS
'能否回收:0-不能1-能';

COMMENT ON COLUMN T_CARDTYPE.MULTIPURSE IS
'多钱包标志';

COMMENT ON COLUMN T_CARDTYPE.FIXDAYFLAG IS
'有效期是否固定天数';

COMMENT ON COLUMN T_CARDTYPE.FIXDAYCNT IS
'有效天数';

COMMENT ON COLUMN T_CARDTYPE.USEFLAG IS
'使用标志:0-未使用1已使用';

COMMENT ON COLUMN T_CARDTYPE.PURPOSE IS
'用途';

ALTER TABLE T_CARDTYPE
   ADD CONSTRAINT PK_T_CARDTYPE PRIMARY KEY (CARDTYPE);

/*==============================================================*/
/* Table: T_CARDTYPERIGHT                                       */
/*==============================================================*/
CREATE TABLE T_CARDTYPERIGHT  (
   CARDTYPE             NUMBER(9)                       NOT NULL,
   FEETYPE              NUMBER(9)                       NOT NULL,
   OPERCODE             VARCHAR2(8),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_CARDTYPERIGHT.CARDTYPE IS
'卡类型';

COMMENT ON COLUMN T_CARDTYPERIGHT.FEETYPE IS
'收费类别';

COMMENT ON COLUMN T_CARDTYPERIGHT.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_CARDTYPERIGHT.LASTSAVED IS
'最好保存时间';

ALTER TABLE T_CARDTYPERIGHT
   ADD CONSTRAINT PK_T_CARDTYPERIGHT PRIMARY KEY (CARDTYPE, FEETYPE);

/*==============================================================*/
/* Table: T_CARDVER                                             */
/*==============================================================*/
CREATE TABLE T_CARDVER  (
   CARDVERNO            VARCHAR2(12)                    NOT NULL,
   ACCDATE              VARCHAR2(8),
   TERMID               NUMBER(9),
   TERMSEQNO            NUMBER(9),
   CARDNO               NUMBER(9),
   CARDPHYID            VARCHAR2(16),
   STUEMPNO             VARCHAR2(20),
   CARDVERTYPE          NUMBER(9),
   ADDDELFLAG           NUMBER(1),
   STATUS               CHAR(1)
);

COMMENT ON COLUMN T_CARDVER.CARDVERNO IS
'卡版本号';

COMMENT ON COLUMN T_CARDVER.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_CARDVER.TERMID IS
'终端号';

COMMENT ON COLUMN T_CARDVER.TERMSEQNO IS
'终端流水号';

COMMENT ON COLUMN T_CARDVER.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_CARDVER.CARDPHYID IS
'卡物理ID';

COMMENT ON COLUMN T_CARDVER.STUEMPNO IS
'学工号';

COMMENT ON COLUMN T_CARDVER.CARDVERTYPE IS
'标志:1-开户2-销户3-挂失4-冻结5-换卡6-解挂 7-解冻卡8-换卡旧卡';

COMMENT ON COLUMN T_CARDVER.ADDDELFLAG IS
'增删标志1-添加-2删除';

COMMENT ON COLUMN T_CARDVER.STATUS IS
'记录状态1-正常-2-注销';

ALTER TABLE T_CARDVER
   ADD CONSTRAINT PK_T_CARDVER PRIMARY KEY (CARDVERNO);

/*==============================================================*/
/* Index: INDEX_CARDNO                                          */
/*==============================================================*/
CREATE INDEX INDEX_CARDNO ON T_CARDVER (
   CARDNO ASC
);

/*==============================================================*/
/* Table: T_CFGACCCHK                                           */
/*==============================================================*/
CREATE TABLE T_CFGACCCHK  (
   ACCCHKTYPE           NUMBER(9)                       NOT NULL,
   ACCCHKTYPENAME       VARCHAR2(30),
   ACCCHKFILEPATH       VARCHAR2(240),
   ACCCHKEXCNAME        VARCHAR2(30),
   BCCDRTPNO            NUMBER(9),
   BCCFUNCNO            NUMBER(9),
   BCCTIMEOUT           NUMBER(9),
   DELFLAG              CHAR(1)
);

COMMENT ON COLUMN T_CFGACCCHK.ACCCHKTYPE IS
'对账类型';

COMMENT ON COLUMN T_CFGACCCHK.ACCCHKTYPENAME IS
'对账类别名称';

COMMENT ON COLUMN T_CFGACCCHK.ACCCHKFILEPATH IS
'对账文件在前置机上的路径';

COMMENT ON COLUMN T_CFGACCCHK.ACCCHKEXCNAME IS
'对账程序的名称';

COMMENT ON COLUMN T_CFGACCCHK.BCCDRTPNO IS
'前置机节点';

COMMENT ON COLUMN T_CFGACCCHK.BCCFUNCNO IS
'前置机功能号';

COMMENT ON COLUMN T_CFGACCCHK.BCCTIMEOUT IS
'前置机超时时间（秒）';

COMMENT ON COLUMN T_CFGACCCHK.DELFLAG IS
'是否删除前置上对账文件';

ALTER TABLE T_CFGACCCHK
   ADD CONSTRAINT PK_T_CFGACCCHK PRIMARY KEY (ACCCHKTYPE);

/*==============================================================*/
/* Table: T_CFGBANK                                             */
/*==============================================================*/
CREATE TABLE T_CFGBANK  (
   BANKCODE             VARCHAR2(8)                     NOT NULL,
   BANKNAME             VARCHAR2(60),
   BANKSTARTTIME        VARCHAR2(6),
   BANKENDTIME          VARCHAR2(6),
   BANKIP               VARCHAR2(15),
   BANKPORT             NUMBER(9),
   BANKTIMEOUT          NUMBER(2),
   BCCDRTPNO            NUMBER(9),
   BCCFUNCNO            NUMBER(9),
   BCCTIMEOUT           NUMBER(2),
   QRYCARDFLAG          NUMBER(1)
);

COMMENT ON COLUMN T_CFGBANK.BANKCODE IS
'银行代码';

COMMENT ON COLUMN T_CFGBANK.BANKNAME IS
'银行名称';

COMMENT ON COLUMN T_CFGBANK.BANKSTARTTIME IS
'银行服务开始时间';

COMMENT ON COLUMN T_CFGBANK.BANKENDTIME IS
'银行服务截止时间';

COMMENT ON COLUMN T_CFGBANK.BANKIP IS
'银行IP';

COMMENT ON COLUMN T_CFGBANK.BANKPORT IS
'银行端口';

COMMENT ON COLUMN T_CFGBANK.BANKTIMEOUT IS
'银行端超时时间';

COMMENT ON COLUMN T_CFGBANK.BCCDRTPNO IS
'前置机节点';

COMMENT ON COLUMN T_CFGBANK.BCCFUNCNO IS
'前置机功能号';

COMMENT ON COLUMN T_CFGBANK.BCCTIMEOUT IS
'前置机超时';

COMMENT ON COLUMN T_CFGBANK.QRYCARDFLAG IS
'QRYCARDFLAG';

ALTER TABLE T_CFGBANK
   ADD CONSTRAINT PK_T_CFGBANK PRIMARY KEY (BANKCODE);

/*==============================================================*/
/* Table: T_CFGFEE                                              */
/*==============================================================*/
CREATE TABLE T_CFGFEE  (
   FEETYPE              NUMBER(3)                       NOT NULL,
   TRANSCODE            NUMBER(4)                       NOT NULL,
   CARDTYPE             NUMBER(2)                       NOT NULL,
   TRANSTYPE            NUMBER(9)                       NOT NULL,
   RATETYPE             NUMBER(9),
   RATEAMT              NUMBER(15,2),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_CFGFEE.FEETYPE IS
'客户的收费类别';

COMMENT ON COLUMN T_CFGFEE.TRANSCODE IS
'交易码';

COMMENT ON COLUMN T_CFGFEE.CARDTYPE IS
'卡类型';

COMMENT ON COLUMN T_CFGFEE.TRANSTYPE IS
'交易类型';

COMMENT ON COLUMN T_CFGFEE.RATETYPE IS
'费率类型:1固定值- 2-百分比3-以输入值作为收费金额';

COMMENT ON COLUMN T_CFGFEE.RATEAMT IS
'费率';

COMMENT ON COLUMN T_CFGFEE.REMARK IS
'备注';

ALTER TABLE T_CFGFEE
   ADD CONSTRAINT PK_T_CFGFEE PRIMARY KEY (FEETYPE, TRANSCODE, CARDTYPE, TRANSTYPE);

/*==============================================================*/
/* Table: T_CFGPAYMENT                                          */
/*==============================================================*/
CREATE TABLE T_CFGPAYMENT  (
   PAYCODE              NUMBER(9)                       NOT NULL,
   SUMMARY              VARCHAR2(60)                    NOT NULL,
   ENABLED              NUMBER(1)                       NOT NULL,
   ONLINEPAY            NUMBER(1)                       NOT NULL,
   PAYCHKFLAG           NUMBER(1)                       NOT NULL,
   PAYEEACCTYPE         NUMBER(1)                       NOT NULL,
   SHOPID               NUMBER(9)                       NOT NULL,
   BCCFUNCNO            NUMBER(9),
   BCCDRTPNO            NUMBER(9),
   IP                   VARCHAR2(15),
   PORT                 NUMBER(9),
   TIMEOUT              NUMBER(9),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_CFGPAYMENT.PAYCODE IS
'客户的收费类别';

COMMENT ON COLUMN T_CFGPAYMENT.SUMMARY IS
'交易类型';

COMMENT ON COLUMN T_CFGPAYMENT.ENABLED IS
'是否启用';

COMMENT ON COLUMN T_CFGPAYMENT.ONLINEPAY IS
'0-不联机1联机';

COMMENT ON COLUMN T_CFGPAYMENT.PAYCHKFLAG IS
'1需要0不需要';

COMMENT ON COLUMN T_CFGPAYMENT.PAYEEACCTYPE IS
'0-输入1卡号2客户号3学号';

COMMENT ON COLUMN T_CFGPAYMENT.SHOPID IS
'商户号';

COMMENT ON COLUMN T_CFGPAYMENT.BCCFUNCNO IS
'BCC主功能号';

COMMENT ON COLUMN T_CFGPAYMENT.BCCDRTPNO IS
'BCCDRTP节点号';

COMMENT ON COLUMN T_CFGPAYMENT.IP IS
'商户服务IP';

COMMENT ON COLUMN T_CFGPAYMENT.PORT IS
'商户服务端口';

COMMENT ON COLUMN T_CFGPAYMENT.TIMEOUT IS
'商户超时时间(秒)';

COMMENT ON COLUMN T_CFGPAYMENT.LASTSAVED IS
'最后保存时间';

ALTER TABLE T_CFGPAYMENT
   ADD CONSTRAINT PK_T_CFGPAYMENT PRIMARY KEY (PAYCODE);

/*==============================================================*/
/* Table: T_CFGRAKEOFF                                          */
/*==============================================================*/
CREATE TABLE T_CFGRAKEOFF  (
   SHOPID               NUMBER(9)                       NOT NULL,
   AMOUNT               NUMBER(15,2)                    NOT NULL,
   AGIO                 NUMBER(4,4),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_CFGRAKEOFF.SHOPID IS
'商户号';

COMMENT ON COLUMN T_CFGRAKEOFF.AMOUNT IS
'商户金额';

COMMENT ON COLUMN T_CFGRAKEOFF.AGIO IS
'折扣返回率';

COMMENT ON COLUMN T_CFGRAKEOFF.REMARK IS
'备注';

ALTER TABLE T_CFGRAKEOFF
   ADD CONSTRAINT PK_T_CFGRAKEOFF PRIMARY KEY (SHOPID, AMOUNT);

/*==============================================================*/
/* Table: T_CFGSHOPFEE                                          */
/*==============================================================*/
CREATE TABLE T_CFGSHOPFEE  (
   SHOPID               NUMBER(9)                       NOT NULL,
   FEETYPE              NUMBER(3)                       NOT NULL,
   FEERATE              NUMBER(4,4)                    DEFAULT 0 NOT NULL,
   FEERATE2             NUMBER(4,4)                    DEFAULT 0 NOT NULL,
   OPERCODE             VARCHAR2(8),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_CFGSHOPFEE.SHOPID IS
'商户号';

COMMENT ON COLUMN T_CFGSHOPFEE.FEETYPE IS
'卡收费类别';

COMMENT ON COLUMN T_CFGSHOPFEE.FEERATE IS
'商户费率';

COMMENT ON COLUMN T_CFGSHOPFEE.FEERATE2 IS
'学校费率';

COMMENT ON COLUMN T_CFGSHOPFEE.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_CFGSHOPFEE.LASTSAVED IS
'最后保存时间';

ALTER TABLE T_CFGSHOPFEE
   ADD CONSTRAINT PK_T_CFGSHOPFEE PRIMARY KEY (SHOPID, FEETYPE);

/*==============================================================*/
/* Table: T_CFGSHOPPAY                                          */
/*==============================================================*/
CREATE TABLE T_CFGSHOPPAY  (
   SHOPID               NUMBER(9)                       NOT NULL,
   FEETYPE              NUMBER(9)                       NOT NULL,
   FLAG                 NUMBER(9),
   PAYAMT               NUMBER(15,2)
);

COMMENT ON COLUMN T_CFGSHOPPAY.SHOPID IS
'商户号';

COMMENT ON COLUMN T_CFGSHOPPAY.FEETYPE IS
'收费类别';

COMMENT ON COLUMN T_CFGSHOPPAY.FLAG IS
'标志';

COMMENT ON COLUMN T_CFGSHOPPAY.PAYAMT IS
'扣费金额';

ALTER TABLE T_CFGSHOPPAY
   ADD CONSTRAINT PK_T_CFGSHOPPAY PRIMARY KEY (SHOPID, FEETYPE);

/*==============================================================*/
/* Table: T_CFGSPLIT                                            */
/*==============================================================*/
CREATE TABLE T_CFGSPLIT  (
   TRANSTYPE            NUMBER(9)                       NOT NULL,
   FUNDTYPE             NUMBER(9)                       NOT NULL,
   OFFLINEFLAG          NUMBER(9),
   USECARDFLAG          NUMBER(9),
   CALCCARDBAL          NUMBER(9),
   DRACCFLAG            CHAR(1)                         NOT NULL,
   DRSUBJNO             VARCHAR2(10),
   DRACCNO              VARCHAR2(10),
   CRACCFLAG            CHAR(1)                         NOT NULL,
   CRSUBJNO             VARCHAR2(10),
   CRACCNO              VARCHAR2(10),
   SUMMARY              VARCHAR2(60)
);

COMMENT ON COLUMN T_CFGSPLIT.TRANSTYPE IS
'交易类型';

COMMENT ON COLUMN T_CFGSPLIT.FUNDTYPE IS
'资金类型';

COMMENT ON COLUMN T_CFGSPLIT.OFFLINEFLAG IS
'脱机标志1-脱机0-联机';

COMMENT ON COLUMN T_CFGSPLIT.USECARDFLAG IS
'卡交易标志';

COMMENT ON COLUMN T_CFGSPLIT.CALCCARDBAL IS
'计算卡余额标志';

COMMENT ON COLUMN T_CFGSPLIT.DRACCFLAG IS
'借方标志';

COMMENT ON COLUMN T_CFGSPLIT.DRSUBJNO IS
'借方科目';

COMMENT ON COLUMN T_CFGSPLIT.DRACCNO IS
'借方账号';

COMMENT ON COLUMN T_CFGSPLIT.CRACCFLAG IS
'贷方标志';

COMMENT ON COLUMN T_CFGSPLIT.CRSUBJNO IS
'贷方科目';

COMMENT ON COLUMN T_CFGSPLIT.CRACCNO IS
'贷方账号';

COMMENT ON COLUMN T_CFGSPLIT.SUMMARY IS
'摘要';

ALTER TABLE T_CFGSPLIT
   ADD CONSTRAINT PK_T_CFGSPLIT PRIMARY KEY (TRANSTYPE, FUNDTYPE);

/*==============================================================*/
/* Table: T_CFGTRANS                                            */
/*==============================================================*/
CREATE TABLE T_CFGTRANS  (
   FEETYPE              NUMBER(3)                       NOT NULL,
   TRANSCODE            NUMBER(4)                       NOT NULL,
   TRANSTYPE            NUMBER(9)                       NOT NULL,
   RATETYPE             NUMBER(9),
   RATEAMT              NUMBER(15,2),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_CFGTRANS.FEETYPE IS
'客户的收费类别';

COMMENT ON COLUMN T_CFGTRANS.TRANSCODE IS
'交易码';

COMMENT ON COLUMN T_CFGTRANS.TRANSTYPE IS
'交易类型';

COMMENT ON COLUMN T_CFGTRANS.RATETYPE IS
'费率类型:1定额- 2-百分比3-以输入金额为准';

COMMENT ON COLUMN T_CFGTRANS.RATEAMT IS
'费率';

COMMENT ON COLUMN T_CFGTRANS.REMARK IS
'备注';

ALTER TABLE T_CFGTRANS
   ADD CONSTRAINT PK_T_CFGTRANS PRIMARY KEY (FEETYPE, TRANSCODE, TRANSTYPE);

/*==============================================================*/
/* Table: T_CFGVER                                              */
/*==============================================================*/
CREATE TABLE T_CFGVER  (
   CFGTYPE              NUMBER(9)                       NOT NULL,
   CFGVERNO             NUMBER(9)                       NOT NULL,
   OPERCODE             VARCHAR2(8),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_CFGVER.CFGTYPE IS
'配置类型';

COMMENT ON COLUMN T_CFGVER.CFGVERNO IS
'配置版本';

COMMENT ON COLUMN T_CFGVER.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_CFGVER.LASTSAVED IS
'最后保存时间';

ALTER TABLE T_CFGVER
   ADD CONSTRAINT PK_T_CFGVER PRIMARY KEY (CFGTYPE);

/*==============================================================*/
/* Table: T_CLOSEAPPLY                                          */
/*==============================================================*/
CREATE TABLE T_CLOSEAPPLY  (
   APPLYID              NUMBER(9)                       NOT NULL,
   STUEMPNO             VARCHAR2(20)                    NOT NULL,
   SUMMARY              VARCHAR2(90)                    NOT NULL,
   STATUS               NUMBER(1)                       NOT NULL,
   BATCHNO              VARCHAR2(20),
   CRTDATE              NUMBER(8)                       NOT NULL,
   CHKDATE              NUMBER(8),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_CLOSEAPPLY.APPLYID IS
'ID号';

COMMENT ON COLUMN T_CLOSEAPPLY.STUEMPNO IS
'学工号';

COMMENT ON COLUMN T_CLOSEAPPLY.SUMMARY IS
'摘要';

COMMENT ON COLUMN T_CLOSEAPPLY.STATUS IS
'状态';

COMMENT ON COLUMN T_CLOSEAPPLY.BATCHNO IS
'批次号';

COMMENT ON COLUMN T_CLOSEAPPLY.CRTDATE IS
'创建日期';

COMMENT ON COLUMN T_CLOSEAPPLY.CHKDATE IS
'审核日期';

COMMENT ON COLUMN T_CLOSEAPPLY.REMARK IS
'备注';

ALTER TABLE T_CLOSEAPPLY
   ADD CONSTRAINT PK_T_CLOSEAPPLY PRIMARY KEY (APPLYID);

/*==============================================================*/
/* Index: IDX_CLOSEAPPLY_SNO                                    */
/*==============================================================*/
CREATE INDEX IDX_CLOSEAPPLY_SNO ON T_CLOSEAPPLY (
   STUEMPNO ASC
);

/*==============================================================*/
/* Table: T_CLOSETASK                                           */
/*==============================================================*/
CREATE TABLE T_CLOSETASK  (
   CARDNO               NUMBER(9)                       NOT NULL,
   APPLYID              NUMBER(9),
   CUSTID               NUMBER(9)                       NOT NULL,
   CARDAMT              NUMBER(9)                      DEFAULT 0 NOT NULL,
   SUBSIDYAMT           NUMBER(9)                      DEFAULT 0 NOT NULL,
   FOREGIFTAMT          NUMBER(9)                      DEFAULT 0 NOT NULL,
   WATERAMT             NUMBER(9)                      DEFAULT 0 NOT NULL,
   FROZEDATE            NUMBER(8),
   PLANDATE             NUMBER(8),
   CLOSEDATE            NUMBER(8)                       NOT NULL,
   STATUS               NUMBER(1),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_CLOSETASK.CARDNO IS
'卡号';

COMMENT ON COLUMN T_CLOSETASK.APPLYID IS
'销户申请ID号';

COMMENT ON COLUMN T_CLOSETASK.CUSTID IS
'客户号';

COMMENT ON COLUMN T_CLOSETASK.CARDAMT IS
'退卡余额';

COMMENT ON COLUMN T_CLOSETASK.SUBSIDYAMT IS
'退补助';

COMMENT ON COLUMN T_CLOSETASK.FOREGIFTAMT IS
'退卡押金';

COMMENT ON COLUMN T_CLOSETASK.WATERAMT IS
'退水控余额';

COMMENT ON COLUMN T_CLOSETASK.FROZEDATE IS
'冻结日期';

COMMENT ON COLUMN T_CLOSETASK.PLANDATE IS
'计划销户日期';

COMMENT ON COLUMN T_CLOSETASK.CLOSEDATE IS
'销户日期';

COMMENT ON COLUMN T_CLOSETASK.STATUS IS
'1-销户成功2销户失败';

COMMENT ON COLUMN T_CLOSETASK.REMARK IS
'备注';

ALTER TABLE T_CLOSETASK
   ADD CONSTRAINT PK_T_CLOSETASK PRIMARY KEY (CARDNO);

/*==============================================================*/
/* Index: IDX_CLOSETASK_CUSTID                                  */
/*==============================================================*/
CREATE INDEX IDX_CLOSETASK_CUSTID ON T_CLOSETASK (
   CUSTID ASC
);

/*==============================================================*/
/* Table: T_CUSTIDCTL                                           */
/*==============================================================*/
CREATE TABLE T_CUSTIDCTL  (
   AREACODE             VARCHAR2(3)                     NOT NULL,
   STARTNO              NUMBER(9)                       NOT NULL,
   NEXTNO               NUMBER(9),
   ENDNO                NUMBER(9),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_CUSTIDCTL.AREACODE IS
'区域代码';

COMMENT ON COLUMN T_CUSTIDCTL.STARTNO IS
'客户起始号';

COMMENT ON COLUMN T_CUSTIDCTL.NEXTNO IS
'客户当前号';

COMMENT ON COLUMN T_CUSTIDCTL.ENDNO IS
'客户结束号';

COMMENT ON COLUMN T_CUSTIDCTL.LASTSAVED IS
'最后保存时间';

ALTER TABLE T_CUSTIDCTL
   ADD CONSTRAINT PK_T_CUSTIDCTL PRIMARY KEY (AREACODE, STARTNO);

/*==============================================================*/
/* Table: T_CUSTOMER                                            */
/*==============================================================*/
CREATE TABLE T_CUSTOMER  (
   CUSTID               NUMBER(9)                       NOT NULL,
   STUEMPNO             VARCHAR2(20),
   CUSTTYPE             NUMBER(9),
   FEETYPE              NUMBER(3),
   STATUS               CHAR(1)                         NOT NULL,
   CUSTNAME             VARCHAR2(60),
   AREACODE             VARCHAR2(3),
   DEPTCODE             VARCHAR2(30),
   DEPTFULLNAME         VARCHAR2(1000),
   SPECIALTYCODE        VARCHAR2(30),
   CLASSCODE            VARCHAR2(30),
   CLASSNAME            VARCHAR2(60),
   IDTYPE               CHAR(1),
   IDNO                 VARCHAR2(60),
   SEX                  CHAR(1),
   COUNTRY              CHAR(3),
   NATION               CHAR(2),
   EMAIL                VARCHAR2(60),
   TEL                  VARCHAR2(20),
   MOBILE               VARCHAR2(20),
   ADDR                 VARCHAR2(240),
   ZIPCODE              VARCHAR2(6),
   CUSTATTR             VARCHAR2(10),
   INDATE               VARCHAR2(8),
   OUTDATE              VARCHAR2(8),
   OPENDATE             VARCHAR2(8),
   CLOSEDATE            VARCHAR2(8),
   BATCHNO              VARCHAR2(20),
   OPENFLAG             NUMBER(1),
   HOLDCARDCNT          NUMBER(9),
   USEFLAG              CHAR(1),
   EACCFLAG             CHAR(1),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_CUSTOMER.CUSTID IS
'客户号';

COMMENT ON COLUMN T_CUSTOMER.STUEMPNO IS
'学工号';

COMMENT ON COLUMN T_CUSTOMER.CUSTTYPE IS
'客户类型';

COMMENT ON COLUMN T_CUSTOMER.FEETYPE IS
'收费类别';

COMMENT ON COLUMN T_CUSTOMER.STATUS IS
'状态1-正常2-注销';

COMMENT ON COLUMN T_CUSTOMER.CUSTNAME IS
'客户名称';

COMMENT ON COLUMN T_CUSTOMER.AREACODE IS
'区域代码';

COMMENT ON COLUMN T_CUSTOMER.DEPTCODE IS
'部门代码';

COMMENT ON COLUMN T_CUSTOMER.DEPTFULLNAME IS
'部门全称';

COMMENT ON COLUMN T_CUSTOMER.SPECIALTYCODE IS
'专业代码';

COMMENT ON COLUMN T_CUSTOMER.CLASSCODE IS
'班级代码';

COMMENT ON COLUMN T_CUSTOMER.CLASSNAME IS
'班级名称';

COMMENT ON COLUMN T_CUSTOMER.IDTYPE IS
'证件类型';

COMMENT ON COLUMN T_CUSTOMER.IDNO IS
'证件号码';

COMMENT ON COLUMN T_CUSTOMER.SEX IS
'性别';

COMMENT ON COLUMN T_CUSTOMER.COUNTRY IS
'国籍';

COMMENT ON COLUMN T_CUSTOMER.NATION IS
'民族';

COMMENT ON COLUMN T_CUSTOMER.EMAIL IS
'电子信箱';

COMMENT ON COLUMN T_CUSTOMER.TEL IS
'电话';

COMMENT ON COLUMN T_CUSTOMER.MOBILE IS
'手机';

COMMENT ON COLUMN T_CUSTOMER.ADDR IS
'地址';

COMMENT ON COLUMN T_CUSTOMER.ZIPCODE IS
'邮政编码';

COMMENT ON COLUMN T_CUSTOMER.CUSTATTR IS
'客户属性';

COMMENT ON COLUMN T_CUSTOMER.INDATE IS
'入校日期';

COMMENT ON COLUMN T_CUSTOMER.OUTDATE IS
'预计离校日期';

COMMENT ON COLUMN T_CUSTOMER.OPENDATE IS
'注册日期,指的是客户信息添加进来的日期';

COMMENT ON COLUMN T_CUSTOMER.CLOSEDATE IS
'注销日期';

COMMENT ON COLUMN T_CUSTOMER.BATCHNO IS
'导入批次号';

COMMENT ON COLUMN T_CUSTOMER.OPENFLAG IS
'正式卡开通标志';

COMMENT ON COLUMN T_CUSTOMER.HOLDCARDCNT IS
'拥有卡个数';

COMMENT ON COLUMN T_CUSTOMER.USEFLAG IS
'使用标志';

COMMENT ON COLUMN T_CUSTOMER.EACCFLAG IS
'电子钱包开通标志';

COMMENT ON COLUMN T_CUSTOMER.LASTSAVED IS
'最后保存时间';

ALTER TABLE T_CUSTOMER
   ADD CONSTRAINT PK_T_CUSTOMER PRIMARY KEY (CUSTID);

/*==============================================================*/
/* Index: IDX_CUSTOMER_STUEMPNO                                 */
/*==============================================================*/
CREATE INDEX IDX_CUSTOMER_STUEMPNO ON T_CUSTOMER (
   STUEMPNO ASC
);

/*==============================================================*/
/* Index: IDX_CUSTOMER_FEETYPE                                  */
/*==============================================================*/
CREATE INDEX IDX_CUSTOMER_FEETYPE ON T_CUSTOMER (
   FEETYPE ASC
);

/*==============================================================*/
/* Index: IDX_CUSTOMER_HOLDCARDCNT                              */
/*==============================================================*/
CREATE INDEX IDX_CUSTOMER_HOLDCARDCNT ON T_CUSTOMER (
   HOLDCARDCNT ASC
);

/*==============================================================*/
/* Index: IDX_CUSTOMER_DEPTCODE                                 */
/*==============================================================*/
CREATE INDEX IDX_CUSTOMER_DEPTCODE ON T_CUSTOMER (
   DEPTCODE ASC
);

/*==============================================================*/
/* Table: T_CUSTOMERTMP                                         */
/*==============================================================*/
CREATE TABLE T_CUSTOMERTMP  (
   BATCHNO              VARCHAR2(20)                    NOT NULL,
   SEQNO                NUMBER(9)                       NOT NULL,
   TRANSDATE            VARCHAR2(8),
   OPERCODE             VARCHAR2(8),
   STUEMPNO             VARCHAR2(20),
   CUSTTYPE             NUMBER(9),
   CUSTTYPENAME         VARCHAR2(60),
   FEETYPE              NUMBER(3),
   CUSTNAME             VARCHAR2(60),
   AREACODE             VARCHAR2(3),
   DEPTCODE             VARCHAR2(30),
   DEPTNAME             VARCHAR2(90),
   SPECIALTYCODE        VARCHAR2(30),
   CLASSNAME            VARCHAR2(60),
   IDTYPE               CHAR(1),
   IDNO                 VARCHAR2(60),
   SEX                  CHAR(1),
   COUNTRY              CHAR(3),
   NATION               CHAR(2),
   EMAIL                VARCHAR2(60),
   TEL                  VARCHAR2(20),
   MOBILE               VARCHAR2(20),
   ADDR                 VARCHAR2(240),
   ZIPCODE              VARCHAR2(6),
   INDATE               VARCHAR2(8),
   OUTDATE              VARCHAR2(8),
   SYNCFLAG             NUMBER(1)                      DEFAULT 0 NOT NULL,
   CHKFLAG              NUMBER(1)                      DEFAULT 0 NOT NULL,
   ERRMSG               VARCHAR2(240)
);

COMMENT ON COLUMN T_CUSTOMERTMP.BATCHNO IS
'导入批次号或同步时间';

COMMENT ON COLUMN T_CUSTOMERTMP.SEQNO IS
'导入序号';

COMMENT ON COLUMN T_CUSTOMERTMP.TRANSDATE IS
'导入日期';

COMMENT ON COLUMN T_CUSTOMERTMP.OPERCODE IS
'导入操作员';

COMMENT ON COLUMN T_CUSTOMERTMP.STUEMPNO IS
'学工号';

COMMENT ON COLUMN T_CUSTOMERTMP.CUSTTYPE IS
'客户类型';

COMMENT ON COLUMN T_CUSTOMERTMP.CUSTTYPENAME IS
'客户类别名称';

COMMENT ON COLUMN T_CUSTOMERTMP.FEETYPE IS
'收费类别';

COMMENT ON COLUMN T_CUSTOMERTMP.CUSTNAME IS
'客户名称';

COMMENT ON COLUMN T_CUSTOMERTMP.AREACODE IS
'区域代码';

COMMENT ON COLUMN T_CUSTOMERTMP.DEPTCODE IS
'部门代码';

COMMENT ON COLUMN T_CUSTOMERTMP.DEPTNAME IS
'部门名称';

COMMENT ON COLUMN T_CUSTOMERTMP.SPECIALTYCODE IS
'专业代码';

COMMENT ON COLUMN T_CUSTOMERTMP.CLASSNAME IS
'班级名称';

COMMENT ON COLUMN T_CUSTOMERTMP.IDTYPE IS
'证件类型';

COMMENT ON COLUMN T_CUSTOMERTMP.IDNO IS
'证件号码';

COMMENT ON COLUMN T_CUSTOMERTMP.SEX IS
'性别';

COMMENT ON COLUMN T_CUSTOMERTMP.COUNTRY IS
'国籍';

COMMENT ON COLUMN T_CUSTOMERTMP.NATION IS
'民族';

COMMENT ON COLUMN T_CUSTOMERTMP.EMAIL IS
'电子信箱';

COMMENT ON COLUMN T_CUSTOMERTMP.TEL IS
'电话';

COMMENT ON COLUMN T_CUSTOMERTMP.MOBILE IS
'手机';

COMMENT ON COLUMN T_CUSTOMERTMP.ADDR IS
'地址';

COMMENT ON COLUMN T_CUSTOMERTMP.ZIPCODE IS
'邮政编码';

COMMENT ON COLUMN T_CUSTOMERTMP.INDATE IS
'入校日期';

COMMENT ON COLUMN T_CUSTOMERTMP.OUTDATE IS
'离校日期';

COMMENT ON COLUMN T_CUSTOMERTMP.SYNCFLAG IS
'1-同步数据0-非同步数据';

COMMENT ON COLUMN T_CUSTOMERTMP.CHKFLAG IS
'0-未审核1-审核失败2审核通过';

COMMENT ON COLUMN T_CUSTOMERTMP.ERRMSG IS
'错误信息';

/*==============================================================*/
/* Index: IDX_CUSTTMP_SYNCFLAG                                  */
/*==============================================================*/
CREATE INDEX IDX_CUSTTMP_SYNCFLAG ON T_CUSTOMERTMP (
   SYNCFLAG ASC,
   STUEMPNO ASC
);

/*==============================================================*/
/* Index: IDX_CUSTTMP_BATCHNO                                   */
/*==============================================================*/
CREATE INDEX IDX_CUSTTMP_BATCHNO ON T_CUSTOMERTMP (
   BATCHNO ASC,
   SEQNO ASC
);

/*==============================================================*/
/* Table: T_CUSTTYPE                                            */
/*==============================================================*/
CREATE TABLE T_CUSTTYPE  (
   CUSTTYPE             NUMBER(9)                       NOT NULL,
   CUSTTYPENAME         VARCHAR2(60),
   FEETYPE              NUMBER(3),
   AREACODE             VARCHAR2(3),
   OLDCUSTTYPE          VARCHAR2(10),
   USEFLAG              CHAR(1)
);

COMMENT ON COLUMN T_CUSTTYPE.CUSTTYPE IS
'客户类型';

COMMENT ON COLUMN T_CUSTTYPE.CUSTTYPENAME IS
'客户类型名称';

COMMENT ON COLUMN T_CUSTTYPE.FEETYPE IS
'默认收费类别';

COMMENT ON COLUMN T_CUSTTYPE.AREACODE IS
'学校代码';

COMMENT ON COLUMN T_CUSTTYPE.OLDCUSTTYPE IS
'原客户类别';

COMMENT ON COLUMN T_CUSTTYPE.USEFLAG IS
'使用标志';

ALTER TABLE T_CUSTTYPE
   ADD CONSTRAINT PK_T_CUSTTYPE PRIMARY KEY (CUSTTYPE);

/*==============================================================*/
/* Table: T_DEPT                                                */
/*==============================================================*/
CREATE TABLE T_DEPT  (
   DEPTCODE             VARCHAR2(30)                    NOT NULL,
   AREACODE             VARCHAR2(3),
   DEPTNAME             VARCHAR2(240),
   DEPTENAME            VARCHAR2(240),
   DEPTFULLNAME         VARCHAR2(1000),
   FDEPTCODE            VARCHAR2(30),
   DEPTLEVEL            NUMBER(9),
   DEPTTYPE             NUMBER(1)                      DEFAULT 0,
   OLDDEPTCODE          VARCHAR2(30),
   USEFLAG              CHAR(1),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_DEPT.DEPTCODE IS
'部门代码';

COMMENT ON COLUMN T_DEPT.AREACODE IS
'区域代码';

COMMENT ON COLUMN T_DEPT.DEPTNAME IS
'部门名称';

COMMENT ON COLUMN T_DEPT.DEPTENAME IS
'部门英文名';

COMMENT ON COLUMN T_DEPT.DEPTFULLNAME IS
'部门全称';

COMMENT ON COLUMN T_DEPT.FDEPTCODE IS
'上级部门代码';

COMMENT ON COLUMN T_DEPT.DEPTLEVEL IS
'部门级别';

COMMENT ON COLUMN T_DEPT.DEPTTYPE IS
'0部门1班级';

COMMENT ON COLUMN T_DEPT.OLDDEPTCODE IS
'原部门代码';

COMMENT ON COLUMN T_DEPT.USEFLAG IS
'使用标志:0-未使用1-已使用';

COMMENT ON COLUMN T_DEPT.LASTSAVED IS
'最后保存日期';

ALTER TABLE T_DEPT
   ADD CONSTRAINT PK_T_DEPT PRIMARY KEY (DEPTCODE);

/*==============================================================*/
/* Table: T_DEVICE                                              */
/*==============================================================*/
CREATE TABLE T_DEVICE  (
   DEVICEID             NUMBER(9)                       NOT NULL,
   DEVICENAME           VARCHAR2(60),
   DEVPHYID             VARCHAR2(20),
   DEVICENO             NUMBER(9),
   DEVPHYTYPE           NUMBER(9),
   DEVTYPECODE          VARCHAR2(30),
   DEVVERNO             VARCHAR2(30),
   CARDPHYTYPE          VARCHAR2(2),
   FDEVICEID            NUMBER(9),
   RUNSTATUS            CHAR(1),
   STATUS               CHAR(1),
   SVRPORTCNT           NUMBER(9),
   SVRPORTNO            NUMBER(9),
   COMMTYPE             NUMBER(9),
   IP                   VARCHAR2(15),
   PORTNO               NUMBER(9),
   BAUDRATE             NUMBER(9),
   CARDSET              VARCHAR2(64),
   CARDVERNO            VARCHAR2(12)                   DEFAULT '000000000000',
   LASTSEQNO            NUMBER(9),
   LASTTRANSTIME        VARCHAR2(30),
   PURSENO              NUMBER(2),
   MAXAMT               NUMBER(15,2),
   SYSID                NUMBER(9),
   AREACODE             VARCHAR2(3),
   DOORLSTVER           VARCHAR2(12),
   DEVUSAGE             NUMBER(9),
   OPENDATE             VARCHAR2(8),
   CLOSEDATE            VARCHAR2(8),
   BATCHNO              VARCHAR2(20),
   LASTSAVED            VARCHAR2(30),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_DEVICE.DEVICEID IS
'终端编号也是设备编号';

COMMENT ON COLUMN T_DEVICE.DEVICENAME IS
'设备名称';

COMMENT ON COLUMN T_DEVICE.DEVPHYID IS
'设备物理ID★';

COMMENT ON COLUMN T_DEVICE.DEVICENO IS
'设备机号';

COMMENT ON COLUMN T_DEVICE.DEVPHYTYPE IS
'设备厂商代码';

COMMENT ON COLUMN T_DEVICE.DEVTYPECODE IS
'设备类型★';

COMMENT ON COLUMN T_DEVICE.DEVVERNO IS
'设备版本号★';

COMMENT ON COLUMN T_DEVICE.CARDPHYTYPE IS
'卡物理型号';

COMMENT ON COLUMN T_DEVICE.FDEVICEID IS
'上级设备ID';

COMMENT ON COLUMN T_DEVICE.RUNSTATUS IS
'运行状态';

COMMENT ON COLUMN T_DEVICE.STATUS IS
'状态:1-正常2-注销';

COMMENT ON COLUMN T_DEVICE.SVRPORTCNT IS
'端口总数';

COMMENT ON COLUMN T_DEVICE.SVRPORTNO IS
'服务器接口编号';

COMMENT ON COLUMN T_DEVICE.COMMTYPE IS
'通讯方式:1-串口2-MODEM3-TCPIP 9-级联';

COMMENT ON COLUMN T_DEVICE.IP IS
'IP地址';

COMMENT ON COLUMN T_DEVICE.PORTNO IS
'服务器SOCKET端口号';

COMMENT ON COLUMN T_DEVICE.BAUDRATE IS
'波特率';

COMMENT ON COLUMN T_DEVICE.CARDSET IS
'终端允许使用的卡收费类别';

COMMENT ON COLUMN T_DEVICE.CARDVERNO IS
'卡黑名单版本号';

COMMENT ON COLUMN T_DEVICE.LASTSEQNO IS
'上次设备交易流水号';

COMMENT ON COLUMN T_DEVICE.LASTTRANSTIME IS
'上次交易时间';

COMMENT ON COLUMN T_DEVICE.PURSENO IS
'设备读卡的钱包号';

COMMENT ON COLUMN T_DEVICE.MAXAMT IS
'最大充值限额，单位分';

COMMENT ON COLUMN T_DEVICE.SYSID IS
'前置机系统ID';

COMMENT ON COLUMN T_DEVICE.AREACODE IS
'区域代码';

COMMENT ON COLUMN T_DEVICE.DOORLSTVER IS
'用于记录已经记录消息队列的名单版本';

COMMENT ON COLUMN T_DEVICE.DEVUSAGE IS
'设备用途';

COMMENT ON COLUMN T_DEVICE.OPENDATE IS
'注册日期';

COMMENT ON COLUMN T_DEVICE.CLOSEDATE IS
'注销日期';

COMMENT ON COLUMN T_DEVICE.BATCHNO IS
'导入批次号';

COMMENT ON COLUMN T_DEVICE.LASTSAVED IS
'上次修改日期';

COMMENT ON COLUMN T_DEVICE.REMARK IS
'备注';

ALTER TABLE T_DEVICE
   ADD CONSTRAINT PK_T_DEVICE PRIMARY KEY (DEVICEID);

/*==============================================================*/
/* Index: IDX_DEVPHYID                                          */
/*==============================================================*/
CREATE INDEX IDX_DEVPHYID ON T_DEVICE (
   DEVPHYID ASC
);

/*==============================================================*/
/* Table: T_DEVICETMP                                           */
/*==============================================================*/
CREATE TABLE T_DEVICETMP  (
   BATCHNO              VARCHAR2(20)                    NOT NULL,
   SEQNO                NUMBER(9)                       NOT NULL,
   TRANSDATE            VARCHAR2(8),
   TRANSTIME            VARCHAR2(6),
   OPERCODE             VARCHAR2(8),
   AREACODE             VARCHAR2(3),
   DEVICENAME           VARCHAR2(60),
   DEVPHYID             VARCHAR2(20),
   DEVPHYTYPE           NUMBER(9),
   DEVTYPECODE          VARCHAR2(30),
   DEVICENO             NUMBER(9),
   FDEVICEID            NUMBER(9),
   CARDPHYTYPE          VARCHAR2(2),
   COMMTYPE             NUMBER(9),
   IP                   VARCHAR2(15),
   PORTNO               NUMBER(9),
   SVRPORTNO            NUMBER(9),
   SVRPORTCNT           NUMBER(9),
   SYSID                NUMBER(9),
   DEVUSAGE             NUMBER(9),
   ERRMSG               VARCHAR2(240)
);

COMMENT ON COLUMN T_DEVICETMP.BATCHNO IS
'导入批次号';

COMMENT ON COLUMN T_DEVICETMP.SEQNO IS
'导入序列号';

COMMENT ON COLUMN T_DEVICETMP.TRANSDATE IS
'导入日期';

COMMENT ON COLUMN T_DEVICETMP.TRANSTIME IS
'导入时间';

COMMENT ON COLUMN T_DEVICETMP.OPERCODE IS
'导入操作员';

COMMENT ON COLUMN T_DEVICETMP.AREACODE IS
'区域代码';

COMMENT ON COLUMN T_DEVICETMP.DEVICENAME IS
'设备名称';

COMMENT ON COLUMN T_DEVICETMP.DEVPHYID IS
'设备物理ID★';

COMMENT ON COLUMN T_DEVICETMP.DEVPHYTYPE IS
'设备厂商代码';

COMMENT ON COLUMN T_DEVICETMP.DEVTYPECODE IS
'设备类型★';

COMMENT ON COLUMN T_DEVICETMP.DEVICENO IS
'设备机号';

COMMENT ON COLUMN T_DEVICETMP.FDEVICEID IS
'上级设备ID';

COMMENT ON COLUMN T_DEVICETMP.CARDPHYTYPE IS
'卡物理型号';

COMMENT ON COLUMN T_DEVICETMP.COMMTYPE IS
'通讯方式:1-串口2-MODEM3-TCPIP 9-级联';

COMMENT ON COLUMN T_DEVICETMP.IP IS
'IP地址';

COMMENT ON COLUMN T_DEVICETMP.PORTNO IS
'通讯端口号';

COMMENT ON COLUMN T_DEVICETMP.SVRPORTNO IS
'服务器接口编号';

COMMENT ON COLUMN T_DEVICETMP.SVRPORTCNT IS
'端口总数';

COMMENT ON COLUMN T_DEVICETMP.SYSID IS
'前置机系统ID';

COMMENT ON COLUMN T_DEVICETMP.DEVUSAGE IS
'设备用途';

COMMENT ON COLUMN T_DEVICETMP.ERRMSG IS
'错误信息';

ALTER TABLE T_DEVICETMP
   ADD CONSTRAINT PK_T_DEVICETMP PRIMARY KEY (BATCHNO, SEQNO);

/*==============================================================*/
/* Table: T_DEVMONITOR                                          */
/*==============================================================*/
CREATE TABLE T_DEVMONITOR  (
   DEVICEID             NUMBER(9)                       NOT NULL,
   OPTIME               VARCHAR2(30),
   COLTIME              VARCHAR2(30),
   DEVTIME              VARCHAR2(30),
   BEATSTATUS           NUMBER(9),
   CARDVERNO            VARCHAR2(12),
   HARDISKPER           NUMBER,
   MEMORYPER            NUMBER,
   CPUPER               NUMBER
);

COMMENT ON COLUMN T_DEVMONITOR.DEVICEID IS
'终端编号也是设备编号';

COMMENT ON COLUMN T_DEVMONITOR.OPTIME IS
'OPTIME';

COMMENT ON COLUMN T_DEVMONITOR.COLTIME IS
'采集时间';

COMMENT ON COLUMN T_DEVMONITOR.DEVTIME IS
'DEVTIME';

COMMENT ON COLUMN T_DEVMONITOR.BEATSTATUS IS
'BEATSTATUS';

COMMENT ON COLUMN T_DEVMONITOR.CARDVERNO IS
'卡版本号';

COMMENT ON COLUMN T_DEVMONITOR.HARDISKPER IS
'HARDISKPER';

COMMENT ON COLUMN T_DEVMONITOR.MEMORYPER IS
'MEMORYPER';

COMMENT ON COLUMN T_DEVMONITOR.CPUPER IS
'CPUPER';

ALTER TABLE T_DEVMONITOR
   ADD CONSTRAINT PK_T_DEVMONITOR PRIMARY KEY (DEVICEID);

/*==============================================================*/
/* Table: T_DEVMSG                                              */
/*==============================================================*/
CREATE TABLE T_DEVMSG  (
   MSGID                NUMBER(9)                       NOT NULL,
   SYSID                NUMBER(9),
   DEVICEID             NUMBER(9),
   DEVPHYID             VARCHAR2(20),
   MSGLEVEL             NUMBER(1),
   MSGTYPE              NUMBER(9),
   MSGDATA              VARCHAR2(2000),
   CRTTIME              VARCHAR2(14),
   REQTIME              VARCHAR2(14),
   REQCNT               NUMBER(9),
   RESPTIME             VARCHAR2(14),
   RESPDATA             VARCHAR2(2000),
   RESPCODE             NUMBER(2),
   RESPMSG              VARCHAR2(240),
   CLOSED               NUMBER(1)
);

COMMENT ON COLUMN T_DEVMSG.MSGID IS
'消息ID';

COMMENT ON COLUMN T_DEVMSG.SYSID IS
'子系统编号';

COMMENT ON COLUMN T_DEVMSG.DEVICEID IS
'设备ID';

COMMENT ON COLUMN T_DEVMSG.DEVPHYID IS
'设备物理ID';

COMMENT ON COLUMN T_DEVMSG.MSGLEVEL IS
'0-优先级最高1-优先级次高';

COMMENT ON COLUMN T_DEVMSG.MSGTYPE IS
'消息类型';

COMMENT ON COLUMN T_DEVMSG.MSGDATA IS
'消息请求内容';

COMMENT ON COLUMN T_DEVMSG.CRTTIME IS
'消息生成时间';

COMMENT ON COLUMN T_DEVMSG.REQTIME IS
'消息开始处理时间';

COMMENT ON COLUMN T_DEVMSG.REQCNT IS
'请求次数';

COMMENT ON COLUMN T_DEVMSG.RESPTIME IS
'消息处理完成时间';

COMMENT ON COLUMN T_DEVMSG.RESPDATA IS
'消息应答内容';

COMMENT ON COLUMN T_DEVMSG.RESPCODE IS
'1-不支持 2-失败 0-成功';

COMMENT ON COLUMN T_DEVMSG.RESPMSG IS
'返回的处理结果信息';

COMMENT ON COLUMN T_DEVMSG.CLOSED IS
'0-未完成1完成';

ALTER TABLE T_DEVMSG
   ADD CONSTRAINT PK_T_DEVMSG PRIMARY KEY (MSGID);

/*==============================================================*/
/* Index: IDX_DEVMSG_CLOSED                                     */
/*==============================================================*/
CREATE INDEX IDX_DEVMSG_CLOSED ON T_DEVMSG (
   CLOSED ASC
);

/*==============================================================*/
/* Table: T_DICTIONARY                                          */
/*==============================================================*/
CREATE TABLE T_DICTIONARY  (
   DICTTYPE             NUMBER(9)                       NOT NULL,
   DICTTYPENAME         VARCHAR2(60),
   DICTVAL              VARCHAR2(30)                    NOT NULL,
   DICTCAPTION          VARCHAR2(60)
);

COMMENT ON COLUMN T_DICTIONARY.DICTTYPE IS
'字典类型';

COMMENT ON COLUMN T_DICTIONARY.DICTTYPENAME IS
'字典类型名称';

COMMENT ON COLUMN T_DICTIONARY.DICTVAL IS
'字典值';

COMMENT ON COLUMN T_DICTIONARY.DICTCAPTION IS
'字典名称';

ALTER TABLE T_DICTIONARY
   ADD CONSTRAINT PK_T_DICTIONARY PRIMARY KEY (DICTTYPE, DICTVAL);

/*==============================================================*/
/* Table: T_DOORCARD                                            */
/*==============================================================*/
CREATE TABLE T_DOORCARD  (
   DEVICEID             NUMBER(9)                       NOT NULL,
   CUSTID               NUMBER(9)                       NOT NULL,
   CARDNO               NUMBER(9)                       NOT NULL,
   CARDPHYID            VARCHAR2(16),
   CARDVERNO            VARCHAR2(12),
   STATUS               NUMBER(1)                       NOT NULL,
   INSERTDATE           VARCHAR2(14)
);

COMMENT ON COLUMN T_DOORCARD.DEVICEID IS
'设备编号';

COMMENT ON COLUMN T_DOORCARD.CUSTID IS
'客户号';

COMMENT ON COLUMN T_DOORCARD.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_DOORCARD.CARDPHYID IS
'卡物理ID';

COMMENT ON COLUMN T_DOORCARD.CARDVERNO IS
'名单版本号';

COMMENT ON COLUMN T_DOORCARD.STATUS IS
'状态';

COMMENT ON COLUMN T_DOORCARD.INSERTDATE IS
'更新时间';

ALTER TABLE T_DOORCARD
   ADD CONSTRAINT PK_T_DOORCARD PRIMARY KEY (DEVICEID, CUSTID, CARDNO);

/*==============================================================*/
/* Table: T_DOORCARDADDR                                        */
/*==============================================================*/
CREATE TABLE T_DOORCARDADDR  (
   CARDADDR             NUMBER(9)                       NOT NULL,
   CARDNO               NUMBER(9)                       NOT NULL,
   USEFLAG              CHAR(1),
   LISTID               NUMBER(9),
   CTRLID               NUMBER(9)                       NOT NULL,
   ADDDELFLAG           NUMBER(1)                       NOT NULL
);

COMMENT ON COLUMN T_DOORCARDADDR.CARDADDR IS
'CARDADDR';

COMMENT ON COLUMN T_DOORCARDADDR.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_DOORCARDADDR.USEFLAG IS
'USEFLAG';

COMMENT ON COLUMN T_DOORCARDADDR.LISTID IS
'LISTID';

COMMENT ON COLUMN T_DOORCARDADDR.CTRLID IS
'CTRLID';

COMMENT ON COLUMN T_DOORCARDADDR.ADDDELFLAG IS
'增删标志';

ALTER TABLE T_DOORCARDADDR
   ADD CONSTRAINT PK_T_DOORCARDADDR PRIMARY KEY (CARDADDR, CTRLID);

/*==============================================================*/
/* Index: IDX_DCA_CARDNOCTRLID                                  */
/*==============================================================*/
CREATE INDEX IDX_DCA_CARDNOCTRLID ON T_DOORCARDADDR (
   CARDNO ASC,
   CTRLID ASC
);

/*==============================================================*/
/* Index: IDX_DCA_LCA                                           */
/*==============================================================*/
CREATE INDEX IDX_DCA_LCA ON T_DOORCARDADDR (
   LISTID ASC,
   CTRLID ASC,
   ADDDELFLAG ASC
);

/*==============================================================*/
/* Index: IDX_DCA_USEFLAGCTRLID                                 */
/*==============================================================*/
CREATE INDEX IDX_DCA_USEFLAGCTRLID ON T_DOORCARDADDR (
   USEFLAG ASC,
   CTRLID ASC
);

/*==============================================================*/
/* Table: T_DOORDEVCARDLIST                                     */
/*==============================================================*/
CREATE TABLE T_DOORDEVCARDLIST  (
   DEVICEID             NUMBER(9)                       NOT NULL,
   CUSTID               NUMBER(9)                       NOT NULL,
   WEEKID               NUMBER(9)                       NOT NULL,
   HOLIDAYID            NUMBER(9),
   CARDNO               NUMBER(9),
   CARDPHYID            VARCHAR2(16),
   CARDVERNO            VARCHAR2(12),
   ADDDELFLAG           NUMBER(1),
   DOWNSTATUS           NUMBER(9)                       NOT NULL,
   DOWNTIME             VARCHAR2(30),
   UPDATETIME           VARCHAR2(30)
);

COMMENT ON COLUMN T_DOORDEVCARDLIST.DEVICEID IS
'设备编号';

COMMENT ON COLUMN T_DOORDEVCARDLIST.CUSTID IS
'客户号';

COMMENT ON COLUMN T_DOORDEVCARDLIST.WEEKID IS
'星期ID';

COMMENT ON COLUMN T_DOORDEVCARDLIST.HOLIDAYID IS
'节假日ID';

COMMENT ON COLUMN T_DOORDEVCARDLIST.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_DOORDEVCARDLIST.CARDPHYID IS
'卡物理ID';

COMMENT ON COLUMN T_DOORDEVCARDLIST.CARDVERNO IS
'名单版本号';

COMMENT ON COLUMN T_DOORDEVCARDLIST.ADDDELFLAG IS
'增删标志:1-增-2删';

COMMENT ON COLUMN T_DOORDEVCARDLIST.DOWNSTATUS IS
'下传状态';

COMMENT ON COLUMN T_DOORDEVCARDLIST.DOWNTIME IS
'下传时间';

COMMENT ON COLUMN T_DOORDEVCARDLIST.UPDATETIME IS
'更新时间';

ALTER TABLE T_DOORDEVCARDLIST
   ADD CONSTRAINT PK_T_DOORDEVCARDLIST PRIMARY KEY (DEVICEID, CUSTID, WEEKID);

/*==============================================================*/
/* Table: T_DOORDEVHOLIDAY                                      */
/*==============================================================*/
CREATE TABLE T_DOORDEVHOLIDAY  (
   MAJORDEVID           NUMBER                          NOT NULL,
   MINORDEVID           NUMBER(9)                       NOT NULL,
   HOLIDAYID            NUMBER                          NOT NULL,
   SEQNO                NUMBER(9),
   ADDDELFLAG           NUMBER(1),
   DOWNSTATUS           NUMBER(9),
   DOWNTIME             VARCHAR2(30),
   REFCNT               NUMBER(9),
   UPDATETIME           VARCHAR2(30)
);

COMMENT ON COLUMN T_DOORDEVHOLIDAY.MAJORDEVID IS
'主设备ID';

COMMENT ON COLUMN T_DOORDEVHOLIDAY.MINORDEVID IS
'从设备ID';

COMMENT ON COLUMN T_DOORDEVHOLIDAY.HOLIDAYID IS
'假日ID';

COMMENT ON COLUMN T_DOORDEVHOLIDAY.SEQNO IS
'序号';

COMMENT ON COLUMN T_DOORDEVHOLIDAY.ADDDELFLAG IS
'增删标志';

COMMENT ON COLUMN T_DOORDEVHOLIDAY.DOWNSTATUS IS
'下传状态';

COMMENT ON COLUMN T_DOORDEVHOLIDAY.DOWNTIME IS
'下载时间';

COMMENT ON COLUMN T_DOORDEVHOLIDAY.REFCNT IS
'REFCNT';

COMMENT ON COLUMN T_DOORDEVHOLIDAY.UPDATETIME IS
'最后保存时间';

ALTER TABLE T_DOORDEVHOLIDAY
   ADD CONSTRAINT PK_T_DOORDEVHOLIDAY PRIMARY KEY (MAJORDEVID, MINORDEVID, HOLIDAYID);

/*==============================================================*/
/* Table: T_DOORDEVTIME                                         */
/*==============================================================*/
CREATE TABLE T_DOORDEVTIME  (
   MAJORDEVID           NUMBER(9)                       NOT NULL,
   MINORDEVID           NUMBER(9)                       NOT NULL,
   TIMEID               NUMBER(9)                       NOT NULL,
   SEQNO                NUMBER(9),
   ADDDELFLAG           NUMBER(1),
   DOWNSTATUS           NUMBER(9),
   DOWNTIME             VARCHAR2(30),
   REFCNT               NUMBER(9),
   UPDATETIME           VARCHAR2(30)
);

COMMENT ON COLUMN T_DOORDEVTIME.MAJORDEVID IS
'MAJORDEVID';

COMMENT ON COLUMN T_DOORDEVTIME.MINORDEVID IS
'MINORDEVID';

COMMENT ON COLUMN T_DOORDEVTIME.TIMEID IS
'时间段ID';

COMMENT ON COLUMN T_DOORDEVTIME.SEQNO IS
'序号';

COMMENT ON COLUMN T_DOORDEVTIME.ADDDELFLAG IS
'增删标志';

COMMENT ON COLUMN T_DOORDEVTIME.DOWNSTATUS IS
'下传状态';

COMMENT ON COLUMN T_DOORDEVTIME.DOWNTIME IS
'下传时间';

COMMENT ON COLUMN T_DOORDEVTIME.REFCNT IS
'REFCNT';

COMMENT ON COLUMN T_DOORDEVTIME.UPDATETIME IS
'UPDATETIME';

ALTER TABLE T_DOORDEVTIME
   ADD CONSTRAINT PK_T_DOORDEVTIME PRIMARY KEY (MAJORDEVID, MINORDEVID, TIMEID);

/*==============================================================*/
/* Table: T_DOORDEVTIMEGRP                                      */
/*==============================================================*/
CREATE TABLE T_DOORDEVTIMEGRP  (
   MAJORDEVID           NUMBER(9)                       NOT NULL,
   MINORDEVID           NUMBER(9)                       NOT NULL,
   TIMEGRPID            NUMBER(9)                       NOT NULL,
   SEQNO                NUMBER(9),
   ADDDELFLAG           NUMBER(1),
   DOWNSTATUS           NUMBER(9),
   DOWNTIME             VARCHAR2(30),
   REFCNT               NUMBER(9),
   UPDATETIME           VARCHAR2(30)
);

COMMENT ON COLUMN T_DOORDEVTIMEGRP.MAJORDEVID IS
'MAJORDEVID';

COMMENT ON COLUMN T_DOORDEVTIMEGRP.MINORDEVID IS
'MINORDEVID';

COMMENT ON COLUMN T_DOORDEVTIMEGRP.TIMEGRPID IS
'时间段组ID';

COMMENT ON COLUMN T_DOORDEVTIMEGRP.SEQNO IS
'流水号';

COMMENT ON COLUMN T_DOORDEVTIMEGRP.ADDDELFLAG IS
'增删标志';

COMMENT ON COLUMN T_DOORDEVTIMEGRP.DOWNSTATUS IS
'下传状态';

COMMENT ON COLUMN T_DOORDEVTIMEGRP.DOWNTIME IS
'下传时间';

COMMENT ON COLUMN T_DOORDEVTIMEGRP.REFCNT IS
'引用次数';

COMMENT ON COLUMN T_DOORDEVTIMEGRP.UPDATETIME IS
'最后保存时间';

ALTER TABLE T_DOORDEVTIMEGRP
   ADD CONSTRAINT PK_T_DOORDEVTIMEGRP PRIMARY KEY (MAJORDEVID, MINORDEVID, TIMEGRPID);

/*==============================================================*/
/* Table: T_DOORDEVWEEK                                         */
/*==============================================================*/
CREATE TABLE T_DOORDEVWEEK  (
   MAJORDEVID           NUMBER(9)                       NOT NULL,
   MINORDEVID           NUMBER(9)                       NOT NULL,
   WEEKID               NUMBER(9)                       NOT NULL,
   SEQNO                NUMBER(9),
   ADDDELFLAG           NUMBER(1),
   DOWNSTATUS           NUMBER(9),
   DOWNTIME             VARCHAR2(30),
   REFCNT               NUMBER(9),
   LINKCNT              NUMBER(9),
   UPDATETIME           VARCHAR2(30)
);

COMMENT ON COLUMN T_DOORDEVWEEK.MAJORDEVID IS
'MAJORDEVID';

COMMENT ON COLUMN T_DOORDEVWEEK.MINORDEVID IS
'MINORDEVID';

COMMENT ON COLUMN T_DOORDEVWEEK.WEEKID IS
'星期ID';

COMMENT ON COLUMN T_DOORDEVWEEK.SEQNO IS
'流水号';

COMMENT ON COLUMN T_DOORDEVWEEK.ADDDELFLAG IS
'增删标志';

COMMENT ON COLUMN T_DOORDEVWEEK.DOWNSTATUS IS
'下传状态';

COMMENT ON COLUMN T_DOORDEVWEEK.DOWNTIME IS
'下传时间';

COMMENT ON COLUMN T_DOORDEVWEEK.REFCNT IS
'REFCNT';

COMMENT ON COLUMN T_DOORDEVWEEK.LINKCNT IS
'LINKCNT';

COMMENT ON COLUMN T_DOORDEVWEEK.UPDATETIME IS
'最后保存时间';

ALTER TABLE T_DOORDEVWEEK
   ADD CONSTRAINT PK_T_DOORDEVWEEK PRIMARY KEY (MAJORDEVID, MINORDEVID, WEEKID);

/*==============================================================*/
/* Table: T_DOORDOWNLOAD                                        */
/*==============================================================*/
CREATE TABLE T_DOORDOWNLOAD  (
   ID                   NUMBER(9)                       NOT NULL,
   CARDVERNO            VARCHAR2(12),
   CUSTID               NUMBER(9)                       NOT NULL,
   CTRLID               NUMBER(9)                       NOT NULL,
   SYSID                NUMBER(9)                       NOT NULL,
   CARDNO               NUMBER(9)                       NOT NULL,
   CARDPHYID            VARCHAR2(16)                    NOT NULL,
   RIGHTBIT             VARCHAR2(240),
   CARDSEQNO            NUMBER(9)                       NOT NULL,
   WEEKID               NUMBER(9)                       NOT NULL,
   WEEKSEQNO            NUMBER(9)                       NOT NULL,
   HOLIDAYID            NUMBER(9)                       NOT NULL,
   HOLIDAYSEQNO         NUMBER(9)                       NOT NULL,
   CREATETIME           VARCHAR2(30)                    NOT NULL,
   SUCCTIME             VARCHAR2(30),
   STATUS               NUMBER(1)                       NOT NULL,
   ADDDELFLAG           NUMBER(1)                       NOT NULL,
   DOORCOUNT            NUMBER(9)
);

COMMENT ON COLUMN T_DOORDOWNLOAD.ID IS
'编号';

COMMENT ON COLUMN T_DOORDOWNLOAD.CARDVERNO IS
'名单版本号';

COMMENT ON COLUMN T_DOORDOWNLOAD.CUSTID IS
'客户号';

COMMENT ON COLUMN T_DOORDOWNLOAD.CTRLID IS
'CTRLID';

COMMENT ON COLUMN T_DOORDOWNLOAD.SYSID IS
'SYSID';

COMMENT ON COLUMN T_DOORDOWNLOAD.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_DOORDOWNLOAD.CARDPHYID IS
'卡物理ID';

COMMENT ON COLUMN T_DOORDOWNLOAD.RIGHTBIT IS
'权限';

COMMENT ON COLUMN T_DOORDOWNLOAD.CARDSEQNO IS
'CARDSEQNO';

COMMENT ON COLUMN T_DOORDOWNLOAD.WEEKID IS
'WEEKID';

COMMENT ON COLUMN T_DOORDOWNLOAD.WEEKSEQNO IS
'WEEKSEQNO';

COMMENT ON COLUMN T_DOORDOWNLOAD.HOLIDAYID IS
'HOLIDAYID';

COMMENT ON COLUMN T_DOORDOWNLOAD.HOLIDAYSEQNO IS
'HOLIDAYSEQNO';

COMMENT ON COLUMN T_DOORDOWNLOAD.CREATETIME IS
'CREATETIME';

COMMENT ON COLUMN T_DOORDOWNLOAD.SUCCTIME IS
'SUCCTIME';

COMMENT ON COLUMN T_DOORDOWNLOAD.STATUS IS
'状态';

COMMENT ON COLUMN T_DOORDOWNLOAD.ADDDELFLAG IS
'增删标志';

COMMENT ON COLUMN T_DOORDOWNLOAD.DOORCOUNT IS
'DOORCOUNT';

ALTER TABLE T_DOORDOWNLOAD
   ADD CONSTRAINT PK_T_DOORDOWNLOAD PRIMARY KEY (ID);

/*==============================================================*/
/* Index: IDX_DOORDL                                            */
/*==============================================================*/
CREATE INDEX IDX_DOORDL ON T_DOORDOWNLOAD (
   CARDVERNO ASC,
   CTRLID ASC
);

/*==============================================================*/
/* Table: T_DOORDTL                                             */
/*==============================================================*/
CREATE TABLE T_DOORDTL  (
   TRANSDATE            VARCHAR2(8)                     NOT NULL,
   TRANSTIME            VARCHAR2(6),
   DEVICEID             NUMBER(9),
   DEVPHYID             VARCHAR2(20)                    NOT NULL,
   DEVSEQNO             NUMBER(9)                       NOT NULL,
   COLDATE              VARCHAR2(8),
   COLTIME              VARCHAR2(6),
   CARDNO               NUMBER(9),
   CARDPHYID            VARCHAR2(16),
   SHOWCARDNO           VARCHAR2(10),
   STUEMPNO             VARCHAR2(20),
   CUSTID               NUMBER(9),
   CUSTNAME             VARCHAR2(60),
   TRANSMARK            NUMBER(9),
   SYSID                NUMBER(9)
);

COMMENT ON COLUMN T_DOORDTL.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_DOORDTL.TRANSTIME IS
'交易时间';

COMMENT ON COLUMN T_DOORDTL.DEVICEID IS
'设备编号';

COMMENT ON COLUMN T_DOORDTL.DEVPHYID IS
'设备物理ID';

COMMENT ON COLUMN T_DOORDTL.DEVSEQNO IS
'流水号';

COMMENT ON COLUMN T_DOORDTL.COLDATE IS
'采集日期';

COMMENT ON COLUMN T_DOORDTL.COLTIME IS
'采集时间';

COMMENT ON COLUMN T_DOORDTL.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_DOORDTL.CARDPHYID IS
'卡物理ID';

COMMENT ON COLUMN T_DOORDTL.SHOWCARDNO IS
'显示卡号';

COMMENT ON COLUMN T_DOORDTL.STUEMPNO IS
'学工号';

COMMENT ON COLUMN T_DOORDTL.CUSTID IS
'客户号';

COMMENT ON COLUMN T_DOORDTL.CUSTNAME IS
'客户姓名';

COMMENT ON COLUMN T_DOORDTL.TRANSMARK IS
'交易标记';

COMMENT ON COLUMN T_DOORDTL.SYSID IS
'子系统ID';

ALTER TABLE T_DOORDTL
   ADD CONSTRAINT PK_T_DOORDTL PRIMARY KEY (TRANSDATE, DEVPHYID, DEVSEQNO);

/*==============================================================*/
/* Table: T_DOOREVENTDTL                                        */
/*==============================================================*/
CREATE TABLE T_DOOREVENTDTL  (
   DEVICEID             NUMBER(9)                       NOT NULL,
   TRANSDATE            VARCHAR2(8)                     NOT NULL,
   TRANSTIME            VARCHAR2(6)                     NOT NULL,
   EVENTCODE            NUMBER(9)                       NOT NULL,
   EVENTMSG             VARCHAR2(240),
   SYSID                NUMBER(9),
   COLDATE              VARCHAR2(8),
   COLTIME              VARCHAR2(6)
);

COMMENT ON COLUMN T_DOOREVENTDTL.DEVICEID IS
'设备编号';

COMMENT ON COLUMN T_DOOREVENTDTL.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_DOOREVENTDTL.TRANSTIME IS
'交易时间';

COMMENT ON COLUMN T_DOOREVENTDTL.EVENTCODE IS
'事件代码';

COMMENT ON COLUMN T_DOOREVENTDTL.EVENTMSG IS
'事件消息';

COMMENT ON COLUMN T_DOOREVENTDTL.SYSID IS
'子系统ID';

COMMENT ON COLUMN T_DOOREVENTDTL.COLDATE IS
'采集日期';

COMMENT ON COLUMN T_DOOREVENTDTL.COLTIME IS
'采集时间';

ALTER TABLE T_DOOREVENTDTL
   ADD CONSTRAINT PK_T_DOOREVENTDTL PRIMARY KEY (DEVICEID, TRANSDATE, TRANSTIME, EVENTCODE);

/*==============================================================*/
/* Table: T_DOORGROUP                                           */
/*==============================================================*/
CREATE TABLE T_DOORGROUP  (
   GROUPID              NUMBER(9)                       NOT NULL,
   GROUPNAME            VARCHAR2(60),
   STATUS               CHAR(1),
   UPDATETIME           VARCHAR2(30)
);

COMMENT ON COLUMN T_DOORGROUP.GROUPID IS
'组号';

COMMENT ON COLUMN T_DOORGROUP.GROUPNAME IS
'组名称';

COMMENT ON COLUMN T_DOORGROUP.STATUS IS
'状态';

COMMENT ON COLUMN T_DOORGROUP.UPDATETIME IS
'更新时间';

ALTER TABLE T_DOORGROUP
   ADD CONSTRAINT PK_T_DOORGROUP PRIMARY KEY (GROUPID);

/*==============================================================*/
/* Table: T_DOORGRPMEMBER                                       */
/*==============================================================*/
CREATE TABLE T_DOORGRPMEMBER  (
   GROUPID              NUMBER(9)                       NOT NULL,
   DEVICEID             NUMBER(9)                       NOT NULL,
   UPDATETIME           VARCHAR2(30)
);

COMMENT ON COLUMN T_DOORGRPMEMBER.GROUPID IS
'组号';

COMMENT ON COLUMN T_DOORGRPMEMBER.DEVICEID IS
'设备编号';

COMMENT ON COLUMN T_DOORGRPMEMBER.UPDATETIME IS
'更新时间';

ALTER TABLE T_DOORGRPMEMBER
   ADD CONSTRAINT PK_T_DOORGRPMEMBER PRIMARY KEY (GROUPID, DEVICEID);

/*==============================================================*/
/* Table: T_DOORGRPOPERRIGHT                                    */
/*==============================================================*/
CREATE TABLE T_DOORGRPOPERRIGHT  (
   GROUPID              NUMBER(9)                       NOT NULL,
   OPERCODE             VARCHAR2(8)                     NOT NULL,
   UPDATETIME           VARCHAR2(30)
);

COMMENT ON COLUMN T_DOORGRPOPERRIGHT.GROUPID IS
'组号';

COMMENT ON COLUMN T_DOORGRPOPERRIGHT.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_DOORGRPOPERRIGHT.UPDATETIME IS
'更新时间';

ALTER TABLE T_DOORGRPOPERRIGHT
   ADD CONSTRAINT PK_T_DOORGRPOPERRIGHT PRIMARY KEY (GROUPID, OPERCODE);

/*==============================================================*/
/* Table: T_DOORHOLIDAY                                         */
/*==============================================================*/
CREATE TABLE T_DOORHOLIDAY  (
   HOLIDAYID            NUMBER(9)                       NOT NULL,
   HOLIDAYNAME          VARCHAR2(60),
   DAYCNT               NUMBER(9),
   ADDDELFLAG           NUMBER(1),
   DOWNSTATUS           NUMBER(9),
   UPDATETIME           VARCHAR2(30)
);

COMMENT ON COLUMN T_DOORHOLIDAY.HOLIDAYID IS
'节假日ID';

COMMENT ON COLUMN T_DOORHOLIDAY.HOLIDAYNAME IS
'节假日名';

COMMENT ON COLUMN T_DOORHOLIDAY.DAYCNT IS
'节假日天数';

COMMENT ON COLUMN T_DOORHOLIDAY.ADDDELFLAG IS
'增删标志';

COMMENT ON COLUMN T_DOORHOLIDAY.DOWNSTATUS IS
'下传状态';

COMMENT ON COLUMN T_DOORHOLIDAY.UPDATETIME IS
'最后保存时间';

ALTER TABLE T_DOORHOLIDAY
   ADD CONSTRAINT PK_T_DOORHOLIDAY PRIMARY KEY (HOLIDAYID);

/*==============================================================*/
/* Table: T_DOORHOLIDAYTIME                                     */
/*==============================================================*/
CREATE TABLE T_DOORHOLIDAYTIME  (
   HOLIDAYID            NUMBER(9)                       NOT NULL,
   HOLIDAYDATE          VARCHAR2(8)                     NOT NULL,
   TIMEGRPID            NUMBER(9),
   ADDDELFLAG           NUMBER(1),
   DOWNSTATUS           NUMBER(9),
   UPDATETIME           VARCHAR2(30)
);

COMMENT ON COLUMN T_DOORHOLIDAYTIME.HOLIDAYID IS
'HOLIDAYID';

COMMENT ON COLUMN T_DOORHOLIDAYTIME.HOLIDAYDATE IS
'HOLIDAYDATE';

COMMENT ON COLUMN T_DOORHOLIDAYTIME.TIMEGRPID IS
'时间组ID';

COMMENT ON COLUMN T_DOORHOLIDAYTIME.ADDDELFLAG IS
'增删标志';

COMMENT ON COLUMN T_DOORHOLIDAYTIME.DOWNSTATUS IS
'下传状态';

COMMENT ON COLUMN T_DOORHOLIDAYTIME.UPDATETIME IS
'最后保存时间';

ALTER TABLE T_DOORHOLIDAYTIME
   ADD CONSTRAINT PK_T_DOORHOLIDAYTIME PRIMARY KEY (HOLIDAYID, HOLIDAYDATE);

/*==============================================================*/
/* Table: T_DOOROPERRIGHT                                       */
/*==============================================================*/
CREATE TABLE T_DOOROPERRIGHT  (
   DEVICEID             NUMBER(9)                       NOT NULL,
   OPERCODE             VARCHAR2(8)                     NOT NULL,
   UPDATETIME           VARCHAR2(30)
);

COMMENT ON COLUMN T_DOOROPERRIGHT.DEVICEID IS
'设备编号';

COMMENT ON COLUMN T_DOOROPERRIGHT.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_DOOROPERRIGHT.UPDATETIME IS
'UPDATETIME';

ALTER TABLE T_DOOROPERRIGHT
   ADD CONSTRAINT PK_T_DOOROPERRIGHT PRIMARY KEY (DEVICEID, OPERCODE);

/*==============================================================*/
/* Table: T_DOORRPTDAY                                          */
/*==============================================================*/
CREATE TABLE T_DOORRPTDAY  (
   TRANSDATE            VARCHAR2(8)                     NOT NULL,
   DEVICEID             NUMBER(9)                       NOT NULL,
   TOTALCNT             NUMBER(9),
   VALIDCNT             NUMBER,
   INVALIDCNT           NUMBER(9)
);

COMMENT ON COLUMN T_DOORRPTDAY.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_DOORRPTDAY.DEVICEID IS
'设备编号';

COMMENT ON COLUMN T_DOORRPTDAY.TOTALCNT IS
'总次数';

COMMENT ON COLUMN T_DOORRPTDAY.VALIDCNT IS
'VALIDCNT';

COMMENT ON COLUMN T_DOORRPTDAY.INVALIDCNT IS
'INVALIDCNT';

ALTER TABLE T_DOORRPTDAY
   ADD CONSTRAINT PK_T_DOORRPTDAY PRIMARY KEY (TRANSDATE, DEVICEID);

/*==============================================================*/
/* Table: T_DOORTIME                                            */
/*==============================================================*/
CREATE TABLE T_DOORTIME  (
   TIMEID               NUMBER(9)                       NOT NULL,
   TIMENAME             VARCHAR2(60),
   STARTTIME            VARCHAR2(6),
   ENDTIME              VARCHAR2(6),
   ADDDELFLAG           NUMBER(1),
   DOWNSTATUS           NUMBER(9),
   UPDATETIME           VARCHAR2(30)
);

COMMENT ON COLUMN T_DOORTIME.TIMEID IS
'TIMEID';

COMMENT ON COLUMN T_DOORTIME.TIMENAME IS
'TIMENAME';

COMMENT ON COLUMN T_DOORTIME.STARTTIME IS
'STARTTIME';

COMMENT ON COLUMN T_DOORTIME.ENDTIME IS
'ENDTIME';

COMMENT ON COLUMN T_DOORTIME.ADDDELFLAG IS
'增删标志';

COMMENT ON COLUMN T_DOORTIME.DOWNSTATUS IS
'下传状态';

COMMENT ON COLUMN T_DOORTIME.UPDATETIME IS
'UPDATETIME';

ALTER TABLE T_DOORTIME
   ADD CONSTRAINT PK_T_DOORTIME PRIMARY KEY (TIMEID);

/*==============================================================*/
/* Table: T_DOORTIMEGRP                                         */
/*==============================================================*/
CREATE TABLE T_DOORTIMEGRP  (
   TIMEGRPID            NUMBER(9)                       NOT NULL,
   TIMEGRPNAME          VARCHAR2(60),
   TIMEID1              NUMBER(9),
   TIMEID2              NUMBER(9),
   TIMEID3              NUMBER(9),
   TIMEID4              NUMBER(9),
   TIMEID5              NUMBER(9),
   TIMEID6              NUMBER(9),
   TIMEID7              NUMBER(9),
   TIMEID8              NUMBER(9),
   ADDDELFLAG           NUMBER(1),
   DOWNSTATUS           NUMBER(9),
   UPDATETIME           VARCHAR2(30)
);

COMMENT ON COLUMN T_DOORTIMEGRP.TIMEGRPID IS
'TIMEGRPID';

COMMENT ON COLUMN T_DOORTIMEGRP.TIMEGRPNAME IS
'TIMEGRPNAME';

COMMENT ON COLUMN T_DOORTIMEGRP.TIMEID1 IS
'TIMEID1';

COMMENT ON COLUMN T_DOORTIMEGRP.TIMEID2 IS
'TIMEID2';

COMMENT ON COLUMN T_DOORTIMEGRP.TIMEID3 IS
'TIMEID3';

COMMENT ON COLUMN T_DOORTIMEGRP.TIMEID4 IS
'TIMEID4';

COMMENT ON COLUMN T_DOORTIMEGRP.TIMEID5 IS
'TIMEID5';

COMMENT ON COLUMN T_DOORTIMEGRP.TIMEID6 IS
'TIMEID6';

COMMENT ON COLUMN T_DOORTIMEGRP.TIMEID7 IS
'TIMEID7';

COMMENT ON COLUMN T_DOORTIMEGRP.TIMEID8 IS
'TIMEID8';

COMMENT ON COLUMN T_DOORTIMEGRP.ADDDELFLAG IS
'增删标志';

COMMENT ON COLUMN T_DOORTIMEGRP.DOWNSTATUS IS
'下传状态';

COMMENT ON COLUMN T_DOORTIMEGRP.UPDATETIME IS
'更新时间';

ALTER TABLE T_DOORTIMEGRP
   ADD CONSTRAINT PK_T_DOORTIMEGRP PRIMARY KEY (TIMEGRPID);

/*==============================================================*/
/* Table: T_DOORWEEKTIME                                        */
/*==============================================================*/
CREATE TABLE T_DOORWEEKTIME  (
   WEEKID               NUMBER(9)                       NOT NULL,
   WEEKNAME             VARCHAR2(60),
   DAY1TIMEGRPID        NUMBER(9),
   DAY2TIMEGRPID        NUMBER(9),
   DAY3TIMEGRPID        NUMBER(9),
   DAY4TIMEGRPID        NUMBER(9),
   DAY5TIMEGRPID        NUMBER(9),
   DAY6TIMEGRPID        NUMBER(9),
   DAY7TIMEGRPID        NUMBER(9),
   ADDDELFLAG           NUMBER(1),
   DOWNSTATUS           NUMBER(9),
   UPDATETIME           VARCHAR2(30)
);

COMMENT ON COLUMN T_DOORWEEKTIME.WEEKID IS
'星期ID';

COMMENT ON COLUMN T_DOORWEEKTIME.WEEKNAME IS
'WEEKNAME';

COMMENT ON COLUMN T_DOORWEEKTIME.DAY1TIMEGRPID IS
'DAY1TIMEGRPID';

COMMENT ON COLUMN T_DOORWEEKTIME.DAY2TIMEGRPID IS
'DAY2TIMEGRPID';

COMMENT ON COLUMN T_DOORWEEKTIME.DAY3TIMEGRPID IS
'DAY3TIMEGRPID';

COMMENT ON COLUMN T_DOORWEEKTIME.DAY4TIMEGRPID IS
'DAY4TIMEGRPID';

COMMENT ON COLUMN T_DOORWEEKTIME.DAY5TIMEGRPID IS
'DAY5TIMEGRPID';

COMMENT ON COLUMN T_DOORWEEKTIME.DAY6TIMEGRPID IS
'DAY6TIMEGRPID';

COMMENT ON COLUMN T_DOORWEEKTIME.DAY7TIMEGRPID IS
'DAY7TIMEGRPID';

COMMENT ON COLUMN T_DOORWEEKTIME.ADDDELFLAG IS
'增删标志';

COMMENT ON COLUMN T_DOORWEEKTIME.DOWNSTATUS IS
'下传状态';

COMMENT ON COLUMN T_DOORWEEKTIME.UPDATETIME IS
'UPDATETIME';

ALTER TABLE T_DOORWEEKTIME
   ADD CONSTRAINT PK_T_DOORWEEKTIME PRIMARY KEY (WEEKID);

/*==============================================================*/
/* Table: T_DPSCARD                                             */
/*==============================================================*/
CREATE TABLE T_DPSCARD  (
   CARDNO               NUMBER(9)                       NOT NULL,
   OPERID               NUMBER(9)                       NOT NULL,
   CREATEOPERID         NUMBER(9),
   CREATEDATE           NUMBER(8),
   DELETEDATE           NUMBER(8),
   DELETED              NUMBER(1)                       NOT NULL
);

COMMENT ON COLUMN T_DPSCARD.CARDNO IS
'卡号';

COMMENT ON COLUMN T_DPSCARD.OPERID IS
'操作员号';

COMMENT ON COLUMN T_DPSCARD.CREATEOPERID IS
'绑定操作员';

COMMENT ON COLUMN T_DPSCARD.CREATEDATE IS
'绑定日期';

COMMENT ON COLUMN T_DPSCARD.DELETEDATE IS
'删除日期';

COMMENT ON COLUMN T_DPSCARD.DELETED IS
'0-正常1-删除';

ALTER TABLE T_DPSCARD
   ADD CONSTRAINT PK_T_DPSCARD PRIMARY KEY (CARDNO);

/*==============================================================*/
/* Table: T_DPSMAC                                              */
/*==============================================================*/
CREATE TABLE T_DPSMAC  (
   REFNO                VARCHAR2(20)                    NOT NULL,
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   ORIGREFNO            VARCHAR2(20),
   TERMID               NUMBER(9),
   TERMSEQNO            NUMBER(9),
   OPERID               NUMBER(9),
   SHOPID				NUMBER(9),
   TRANSCODE            NUMBER(9),
   CARDASNO             VARCHAR2(20),
   CARDNO               NUMBER(9)                       NOT NULL,
   DPSCNT               NUMBER(6)                      DEFAULT 0 NOT NULL,
   PAYCNT               NUMBER(6)                      DEFAULT 0,
   CARDBEFBAL           NUMBER(9)                      DEFAULT 0 NOT NULL,
   AMOUNT               NUMBER(9),
   DPSAMT               NUMBER(9),
   CARDAFTBAL           NUMBER(9),
   HOSTDATE             VARCHAR2(8),
   HOSTTIME             VARCHAR2(6),
   SAMNO                VARCHAR2(12),
   RANDNUM              VARCHAR2(8),
   MAC1                 VARCHAR2(8),
   MAC2                 VARCHAR2(8),
   TAC                  VARCHAR2(8),
   POSTED               NUMBER(1)                      DEFAULT 0 NOT NULL,
   CONFIRMED            NUMBER(1)                      DEFAULT 0 NOT NULL,
   ISOK                 NUMBER(1),
   ISBREAK              NUMBER(1),
   WATERTYPE            NUMBER(2)                      DEFAULT 0,
   WATERBEFBAL          NUMBER(9)                      DEFAULT 0,
   WATERISOK            NUMBER(1)                      DEFAULT 0,
   WATERISBREAK         NUMBER(1)                      DEFAULT 0,
   UPDTIME              VARCHAR2(14)
);

COMMENT ON COLUMN T_DPSMAC.REFNO IS
'交易参考号';

COMMENT ON COLUMN T_DPSMAC.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_DPSMAC.ORIGREFNO IS
'原交易参考号';

COMMENT ON COLUMN T_DPSMAC.TERMID IS
'终端号';

COMMENT ON COLUMN T_DPSMAC.TERMSEQNO IS
'终端流水号';

COMMENT ON COLUMN T_DPSMAC.OPERID IS
'操作员ID';

COMMENT ON COLUMN T_DPSMAC.SHOPID IS
'商户号';

COMMENT ON COLUMN T_DPSMAC.TRANSCODE IS
'交易代码';

COMMENT ON COLUMN T_DPSMAC.CARDASNO IS
'卡应用序列号';

COMMENT ON COLUMN T_DPSMAC.CARDNO IS
'卡号';

COMMENT ON COLUMN T_DPSMAC.DPSCNT IS
'充值前次数';

COMMENT ON COLUMN T_DPSMAC.PAYCNT IS
'消费前次数';

COMMENT ON COLUMN T_DPSMAC.CARDBEFBAL IS
'充值前余额';

COMMENT ON COLUMN T_DPSMAC.AMOUNT IS
'总发生额';

COMMENT ON COLUMN T_DPSMAC.DPSAMT IS
'充值金额';

COMMENT ON COLUMN T_DPSMAC.CARDAFTBAL IS
'充值后余额';

COMMENT ON COLUMN T_DPSMAC.HOSTDATE IS
'充值日期';

COMMENT ON COLUMN T_DPSMAC.HOSTTIME IS
'充值时间';

COMMENT ON COLUMN T_DPSMAC.SAMNO IS
'SAMNO';

COMMENT ON COLUMN T_DPSMAC.RANDNUM IS
'RANDNUM';

COMMENT ON COLUMN T_DPSMAC.MAC1 IS
'MAC1';

COMMENT ON COLUMN T_DPSMAC.MAC2 IS
'MAC2';

COMMENT ON COLUMN T_DPSMAC.TAC IS
'TAC';

COMMENT ON COLUMN T_DPSMAC.POSTED IS
'是否记账';

COMMENT ON COLUMN T_DPSMAC.CONFIRMED IS
'是否确认';

COMMENT ON COLUMN T_DPSMAC.ISOK IS
'ISOK';

COMMENT ON COLUMN T_DPSMAC.ISBREAK IS
'ISBREAK';

COMMENT ON COLUMN T_DPSMAC.WATERTYPE IS
'水控钱包类型';

COMMENT ON COLUMN T_DPSMAC.WATERBEFBAL IS
'水控钱包余额';

COMMENT ON COLUMN T_DPSMAC.WATERISOK IS
'WATERISOK';

COMMENT ON COLUMN T_DPSMAC.WATERISBREAK IS
'WATERISBREAK';

COMMENT ON COLUMN T_DPSMAC.UPDTIME IS
'UPDTIME';

ALTER TABLE T_DPSMAC
   ADD CONSTRAINT PK_T_DPSMAC PRIMARY KEY (REFNO);

/*==============================================================*/
/* Table: T_ERRCODE                                             */
/*==============================================================*/
CREATE TABLE T_ERRCODE  (
   ERRCODE              NUMBER(9)                       NOT NULL,
   ERRMSG               VARCHAR2(240)
);

COMMENT ON COLUMN T_ERRCODE.ERRCODE IS
'错误码';

COMMENT ON COLUMN T_ERRCODE.ERRMSG IS
'错误消息';

ALTER TABLE T_ERRCODE
   ADD CONSTRAINT PK_T_ERRCODE PRIMARY KEY (ERRCODE);

/*==============================================================*/
/* Table: T_EXCEPTDTL                                           */
/*==============================================================*/
CREATE TABLE T_EXCEPTDTL  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   TERMID               NUMBER(9)                       NOT NULL,
   TERMSEQNO            NUMBER(9)                       NOT NULL,
   REFNO                VARCHAR2(20)                    NOT NULL,
   CARDNO               NUMBER(9)                       NOT NULL,
   PURSENO              NUMBER(9)                       NOT NULL,
   DPSCNT               NUMBER(9)                       NOT NULL,
   PAYCNT               NUMBER(9)                       NOT NULL,
   CARDBEFBAL           NUMBER(15,2)                    NOT NULL,
   CARDAFTBAL           NUMBER(15,2)                    NOT NULL,
   FAILTYPE             NUMBER(1),
   STATUS               NUMBER(1)                       NOT NULL,
   REMARK               VARCHAR2(240),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_EXCEPTDTL.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_EXCEPTDTL.TERMID IS
'终端号';

COMMENT ON COLUMN T_EXCEPTDTL.TERMSEQNO IS
'终端流水号';

COMMENT ON COLUMN T_EXCEPTDTL.REFNO IS
'交易参考号';

COMMENT ON COLUMN T_EXCEPTDTL.CARDNO IS
'卡号';

COMMENT ON COLUMN T_EXCEPTDTL.PURSENO IS
'钱包号';

COMMENT ON COLUMN T_EXCEPTDTL.DPSCNT IS
'卡充值次数';

COMMENT ON COLUMN T_EXCEPTDTL.PAYCNT IS
'卡消费次数';

COMMENT ON COLUMN T_EXCEPTDTL.CARDBEFBAL IS
'卡交易前余额';

COMMENT ON COLUMN T_EXCEPTDTL.CARDAFTBAL IS
'卡交易后余额';

COMMENT ON COLUMN T_EXCEPTDTL.FAILTYPE IS
'0-中途拔卡1写卡失败';

COMMENT ON COLUMN T_EXCEPTDTL.STATUS IS
'0-未处理2失败3成功';

COMMENT ON COLUMN T_EXCEPTDTL.REMARK IS
'备注';

COMMENT ON COLUMN T_EXCEPTDTL.LASTSAVED IS
'最后保存时间';

ALTER TABLE T_EXCEPTDTL
   ADD CONSTRAINT PK_T_EXCEPTDTL PRIMARY KEY (ACCDATE, TERMID, TERMSEQNO);

/*==============================================================*/
/* Table: T_EXTCARDDTL                                          */
/*==============================================================*/
CREATE TABLE T_EXTCARDDTL  (
   REFNO                VARCHAR2(20)                    NOT NULL,
   ACCDATE              VARCHAR2(8),
   TERMID               NUMBER(9),
   TERMSEQNO            NUMBER(9),
   CARDNO               NUMBER(9)                       NOT NULL,
   AMOUNT               NUMBER(9),
   TRANSDATE            VARCHAR2(8),
   TRANSTIME            VARCHAR2(6),
   STATUS               NUMBER(1)                       NOT NULL,
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_EXTCARDDTL.REFNO IS
'交易参考号';

COMMENT ON COLUMN T_EXTCARDDTL.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_EXTCARDDTL.TERMID IS
'终端号';

COMMENT ON COLUMN T_EXTCARDDTL.TERMSEQNO IS
'终端流水号';

COMMENT ON COLUMN T_EXTCARDDTL.CARDNO IS
'正为加钱负为减钱';

COMMENT ON COLUMN T_EXTCARDDTL.AMOUNT IS
'补写金额';

COMMENT ON COLUMN T_EXTCARDDTL.TRANSDATE IS
'处理日期';

COMMENT ON COLUMN T_EXTCARDDTL.TRANSTIME IS
'处理时间';

COMMENT ON COLUMN T_EXTCARDDTL.STATUS IS
'1未补写2已补写3已下补助';

COMMENT ON COLUMN T_EXTCARDDTL.REMARK IS
'补写原因';

ALTER TABLE T_EXTCARDDTL
   ADD CONSTRAINT PK_T_EXTCARDDTL PRIMARY KEY (REFNO);

/*==============================================================*/
/* Table: T_FEETYPE                                             */
/*==============================================================*/
CREATE TABLE T_FEETYPE  (
   FEETYPE              NUMBER(3)                       NOT NULL,
   FEENAME              VARCHAR2(60)                    NOT NULL,
   BOARDFLAG            NUMBER(1)                       NOT NULL,
   BOARDRATE            NUMBER(2)                       NOT NULL,
   DPSRATE              NUMBER(2),
   UPDTIME              VARCHAR2(14)
);

COMMENT ON COLUMN T_FEETYPE.FEETYPE IS
'收费类别';

COMMENT ON COLUMN T_FEETYPE.FEENAME IS
'收费名称';

COMMENT ON COLUMN T_FEETYPE.BOARDFLAG IS
'是否收搭伙费:1-收0-不收';

COMMENT ON COLUMN T_FEETYPE.BOARDRATE IS
'搭伙费率';

COMMENT ON COLUMN T_FEETYPE.DPSRATE IS
'充值费率';

COMMENT ON COLUMN T_FEETYPE.UPDTIME IS
'更新时间';

ALTER TABLE T_FEETYPE
   ADD CONSTRAINT PK_T_FEETYPE PRIMARY KEY (FEETYPE);

/*==============================================================*/
/* Table: T_FRONT                                               */
/*==============================================================*/
CREATE TABLE T_FRONT  (
   FRONTID              NUMBER(9)                       NOT NULL,
   FRONTNAME            VARCHAR2(60),
   IP                   VARCHAR2(15),
   DRTPPORT             NUMBER(9)                      DEFAULT 4000,
   DRTPNODE             NUMBER,
   BCCMAINFUNCNO        NUMBER(9)
);

COMMENT ON COLUMN T_FRONT.FRONTID IS
'FRONTID';

COMMENT ON COLUMN T_FRONT.FRONTNAME IS
'前置机名称';

COMMENT ON COLUMN T_FRONT.IP IS
'IP地址';

COMMENT ON COLUMN T_FRONT.DRTPPORT IS
'DRTP端口';

COMMENT ON COLUMN T_FRONT.DRTPNODE IS
'DRTP节点号';

COMMENT ON COLUMN T_FRONT.BCCMAINFUNCNO IS
'BCC主功能号';

ALTER TABLE T_FRONT
   ADD CONSTRAINT PK_T_FRONT PRIMARY KEY (FRONTID);

/*==============================================================*/
/* Table: T_GDCTPARA                                            */
/*==============================================================*/
CREATE TABLE T_GDCTPARA  (
   PARANAME             VARCHAR2(60)                    NOT NULL,
   PARAVAL              VARCHAR2(60),
   REMARK               VARCHAR2(240),
   PARAFLAG             NUMBER(1)
);

COMMENT ON COLUMN T_GDCTPARA.PARANAME IS
'参数名称';

COMMENT ON COLUMN T_GDCTPARA.PARAVAL IS
'参数值';

COMMENT ON COLUMN T_GDCTPARA.REMARK IS
'备注';

COMMENT ON COLUMN T_GDCTPARA.PARAFLAG IS
'参数标志';

ALTER TABLE T_GDCTPARA
   ADD CONSTRAINT PK_T_GDCTPARA PRIMARY KEY (PARANAME);

/*==============================================================*/
/* Table: T_GETELECCARD                                         */
/*==============================================================*/
CREATE TABLE T_GETELECCARD  (
   CARDNO               NUMBER(9)                       NOT NULL,
   CARDPHYID            VARCHAR2(16)                    NOT NULL,
   DEVICEID             NUMBER(9)                       NOT NULL,
   USETYPE              NUMBER(1)                       NOT NULL,
   ADDDELFLAG           NUMBER(1)                       NOT NULL,
   DOWNTIME             VARCHAR2(30)
);

COMMENT ON COLUMN T_GETELECCARD.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_GETELECCARD.CARDPHYID IS
'卡物理ID';

COMMENT ON COLUMN T_GETELECCARD.DEVICEID IS
'设备ID';

COMMENT ON COLUMN T_GETELECCARD.USETYPE IS
'0-管理卡-1-常开卡';

COMMENT ON COLUMN T_GETELECCARD.ADDDELFLAG IS
'1-增加2-删除';

COMMENT ON COLUMN T_GETELECCARD.DOWNTIME IS
'下载时间';

ALTER TABLE T_GETELECCARD
   ADD CONSTRAINT PK_T_GETELECCARD PRIMARY KEY (CARDNO, DEVICEID);

/*==============================================================*/
/* Table: T_INNERACC                                            */
/*==============================================================*/
CREATE TABLE T_INNERACC  (
   ACCNO                VARCHAR2(10)                    NOT NULL,
   ACCNAME              VARCHAR2(90)                    NOT NULL,
   SUBJNO               VARCHAR2(10)                    NOT NULL,
   YDAYBAL              NUMBER(15,2),
   BALANCE              NUMBER(15,2)                    NOT NULL,
   BALFLAG              NUMBER(1)                       NOT NULL,
   LASTTRANSDATE        VARCHAR2(8),
   LASTACCDATE          VARCHAR2(8)
);

COMMENT ON COLUMN T_INNERACC.ACCNO IS
'账号';

COMMENT ON COLUMN T_INNERACC.ACCNAME IS
'帐户名';

COMMENT ON COLUMN T_INNERACC.SUBJNO IS
'科目号';

COMMENT ON COLUMN T_INNERACC.YDAYBAL IS
'昨日余额';

COMMENT ON COLUMN T_INNERACC.BALANCE IS
'帐户余额';

COMMENT ON COLUMN T_INNERACC.BALFLAG IS
'余额方向';

COMMENT ON COLUMN T_INNERACC.LASTTRANSDATE IS
'上次交易日期';

COMMENT ON COLUMN T_INNERACC.LASTACCDATE IS
'上次清算日期';

ALTER TABLE T_INNERACC
   ADD CONSTRAINT PK_T_INNERACC PRIMARY KEY (ACCNO);

/*==============================================================*/
/* Table: T_KEYCARDS                                            */
/*==============================================================*/
CREATE TABLE T_KEYCARDS  (
   CARDID               NUMBER(9)                       NOT NULL,
   CARDPHYID            VARCHAR2(16)                    NOT NULL,
   PIN                  VARCHAR2(16),
   KEYGROUP             NUMBER(9),
   ISSUEDATE            VARCHAR2(8),
   ISSUETIME            VARCHAR2(6),
   OPERCODE             VARCHAR2(8),
   DELFLAG              NUMBER(1),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_KEYCARDS.CARDID IS
'CARDID';

COMMENT ON COLUMN T_KEYCARDS.CARDPHYID IS
'CARDPHYID';

COMMENT ON COLUMN T_KEYCARDS.PIN IS
'PIN';

COMMENT ON COLUMN T_KEYCARDS.KEYGROUP IS
'KEYGROUP';

COMMENT ON COLUMN T_KEYCARDS.ISSUEDATE IS
'ISSUEDATE';

COMMENT ON COLUMN T_KEYCARDS.ISSUETIME IS
'ISSUETIME';

COMMENT ON COLUMN T_KEYCARDS.OPERCODE IS
'OPERCODE';

COMMENT ON COLUMN T_KEYCARDS.DELFLAG IS
'DELFLAG';

COMMENT ON COLUMN T_KEYCARDS.REMARK IS
'REMARK';

ALTER TABLE T_KEYCARDS
   ADD CONSTRAINT PK_T_KEYCARDS PRIMARY KEY (CARDID, CARDPHYID);

/*==============================================================*/
/* Table: T_KEYS                                                */
/*==============================================================*/
CREATE TABLE T_KEYS  (
   KEYGROUP             NUMBER(9)                       NOT NULL,
   KEYID                NUMBER(9)                       NOT NULL,
   KEYVAL               VARCHAR2(64),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_KEYS.KEYGROUP IS
'KEY组';

COMMENT ON COLUMN T_KEYS.KEYID IS
'密钥ID';

COMMENT ON COLUMN T_KEYS.KEYVAL IS
'密钥值';

COMMENT ON COLUMN T_KEYS.REMARK IS
'备注';

ALTER TABLE T_KEYS
   ADD CONSTRAINT PK_T_KEYS PRIMARY KEY (KEYGROUP, KEYID);

/*==============================================================*/
/* Table: T_LOSSCARDINFO                                        */
/*==============================================================*/
CREATE TABLE T_LOSSCARDINFO  (
   CARDNO               NUMBER(9)                       NOT NULL,
   CARDPHYID            VARCHAR2(16),
   SHOPCODE             VARCHAR2(60)                    NOT NULL,
   REGDATE              VARCHAR2(8)                     NOT NULL,
   REGTIME              VARCHAR2(6),
   STATUS               NUMBER(1),
   ENDDATE              VARCHAR2(8),
   GETCARDPLACE         VARCHAR2(240),
   TEL                  VARCHAR2(30),
   ADDR                 VARCHAR2(240),
   IDTYPE               NUMBER(1),
   IDNO                 VARCHAR2(60),
   GETDATE              VARCHAR2(8),
   GETTIME              VARCHAR2(6),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_LOSSCARDINFO.CARDNO IS
'卡号';

COMMENT ON COLUMN T_LOSSCARDINFO.CARDPHYID IS
'物理卡号';

COMMENT ON COLUMN T_LOSSCARDINFO.SHOPCODE IS
'登记商户代码';

COMMENT ON COLUMN T_LOSSCARDINFO.REGDATE IS
'登记日期';

COMMENT ON COLUMN T_LOSSCARDINFO.REGTIME IS
'登记时间';

COMMENT ON COLUMN T_LOSSCARDINFO.STATUS IS
'遗失卡状态';

COMMENT ON COLUMN T_LOSSCARDINFO.ENDDATE IS
'保存截至日期';

COMMENT ON COLUMN T_LOSSCARDINFO.GETCARDPLACE IS
'卡片所在位置';

COMMENT ON COLUMN T_LOSSCARDINFO.TEL IS
'联系电话';

COMMENT ON COLUMN T_LOSSCARDINFO.ADDR IS
'商户地点';

COMMENT ON COLUMN T_LOSSCARDINFO.IDTYPE IS
'领取人证件类型';

COMMENT ON COLUMN T_LOSSCARDINFO.IDNO IS
'证件号码';

COMMENT ON COLUMN T_LOSSCARDINFO.GETDATE IS
'领取日期';

COMMENT ON COLUMN T_LOSSCARDINFO.GETTIME IS
'领取时间';

COMMENT ON COLUMN T_LOSSCARDINFO.REMARK IS
'备注';

ALTER TABLE T_LOSSCARDINFO
   ADD CONSTRAINT PK_T_LOSSCARDINFO PRIMARY KEY (CARDNO, SHOPCODE, REGDATE);

/*==============================================================*/
/* Table: T_LOSSCARDSHOP                                        */
/*==============================================================*/
CREATE TABLE T_LOSSCARDSHOP  (
   SHOPCODE             VARCHAR2(60)                    NOT NULL,
   SHOPNAME             VARCHAR2(90),
   ADDR                 VARCHAR2(240),
   TEL                  VARCHAR2(20),
   GETCARDPLACE         VARCHAR2(240),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_LOSSCARDSHOP.SHOPCODE IS
'登陆商户号';

COMMENT ON COLUMN T_LOSSCARDSHOP.SHOPNAME IS
'商户名称';

COMMENT ON COLUMN T_LOSSCARDSHOP.ADDR IS
'商户地点';

COMMENT ON COLUMN T_LOSSCARDSHOP.TEL IS
'联系电话';

COMMENT ON COLUMN T_LOSSCARDSHOP.GETCARDPLACE IS
'领取卡片地点';

COMMENT ON COLUMN T_LOSSCARDSHOP.LASTSAVED IS
'最后修改时间';

ALTER TABLE T_LOSSCARDSHOP
   ADD CONSTRAINT PK_T_LOSSCARDSHOP PRIMARY KEY (SHOPCODE);

/*==============================================================*/
/* Table: T_MACHINECODE                                         */
/*==============================================================*/
CREATE TABLE T_MACHINECODE  (
   MACHINECODE          VARCHAR2(60)                    NOT NULL,
   IP                   VARCHAR2(15),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_MACHINECODE.MACHINECODE IS
'机器码';

COMMENT ON COLUMN T_MACHINECODE.IP IS
'IP地址';

COMMENT ON COLUMN T_MACHINECODE.LASTSAVED IS
'最后保存时间';

ALTER TABLE T_MACHINECODE
   ADD CONSTRAINT PK_T_MACHINECODE PRIMARY KEY (MACHINECODE);

/*==============================================================*/
/* Table: T_MEALTYPE                                            */
/*==============================================================*/
CREATE TABLE T_MEALTYPE  (
   MEALTYPE             NUMBER(9)                       NOT NULL,
   MEALNAME             VARCHAR2(30)                    NOT NULL,
   ENDTIME              VARCHAR2(6)                     NOT NULL,
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_MEALTYPE.MEALTYPE IS
'餐次ID';

COMMENT ON COLUMN T_MEALTYPE.MEALNAME IS
'餐次名称';

COMMENT ON COLUMN T_MEALTYPE.ENDTIME IS
'结束时间';

COMMENT ON COLUMN T_MEALTYPE.LASTSAVED IS
'更新时间';

ALTER TABLE T_MEALTYPE
   ADD CONSTRAINT PK_T_MEALTYPE PRIMARY KEY (MEALTYPE);

/*==============================================================*/
/* Table: T_MODIFYINFO                                          */
/*==============================================================*/
CREATE TABLE T_MODIFYINFO  (
   CUSTID               NUMBER(9)                       NOT NULL,
   STUEMPNO             VARCHAR2(20)                    NOT NULL,
   ENROLLNO             VARCHAR2(30)                    NOT NULL,
   MODIFYDATE           VARCHAR2(8),
   MODIFYTIME           VARCHAR2(6),
   OPERCODE             VARCHAR2(8)
);

COMMENT ON COLUMN T_MODIFYINFO.CUSTID IS
'客户号';

COMMENT ON COLUMN T_MODIFYINFO.STUEMPNO IS
'学工号';

COMMENT ON COLUMN T_MODIFYINFO.ENROLLNO IS
'录取通知号';

COMMENT ON COLUMN T_MODIFYINFO.MODIFYDATE IS
'修改日期';

COMMENT ON COLUMN T_MODIFYINFO.MODIFYTIME IS
'修改时间';

COMMENT ON COLUMN T_MODIFYINFO.OPERCODE IS
'操作员号';

ALTER TABLE T_MODIFYINFO
   ADD CONSTRAINT PK_T_MODIFYINFO PRIMARY KEY (CUSTID, STUEMPNO, ENROLLNO);

/*==============================================================*/
/* Table: T_MODULE                                              */
/*==============================================================*/
CREATE TABLE T_MODULE  (
   MODULECODE           VARCHAR2(10)                    NOT NULL,
   MODULENAME           VARCHAR2(60)                    NOT NULL,
   MODULELEVEL          NUMBER(1),
   FUNCCODE             VARCHAR2(60)
);

COMMENT ON COLUMN T_MODULE.MODULECODE IS
'模块代码';

COMMENT ON COLUMN T_MODULE.MODULENAME IS
'模块名称';

COMMENT ON COLUMN T_MODULE.MODULELEVEL IS
'1根2下级,3末级';

COMMENT ON COLUMN T_MODULE.FUNCCODE IS
'功能号';

ALTER TABLE T_MODULE
   ADD CONSTRAINT PK_T_MODULE PRIMARY KEY (MODULECODE);

/*==============================================================*/
/* Table: T_MSGLIST                                             */
/*==============================================================*/
CREATE TABLE T_MSGLIST  (
   MSGID                NUMBER(9)                       NOT NULL,
   MSGTYPE              NUMBER(9),
   MSGLEVEL             NUMBER(9),
   SYSID                NUMBER(9),
   DEVICEID             NUMBER(9),
   CARDNO               NUMBER(9),
   TRANSDATE            VARCHAR2(8),
   CREATEDTIME          VARCHAR2(30),
   STARTTIME            VARCHAR2(30),
   ENDTIME              VARCHAR2(30),
   REQDATA              VARCHAR2(1000),
   RESPDATA             VARCHAR2(1000),
   FUNCNO               NUMBER(6),
   PFUNCNO              NUMBER(6),
   MAXSENDCNT           NUMBER(9),
   SENDCNT              NUMBER(9),
   RECVCNT              NUMBER(9),
   STATUS               NUMBER(1),
   SEQNO                NUMBER(9),
   OPERCODE             VARCHAR2(8),
   ERRCODE              NUMBER(9),
   ERRMSG               VARCHAR2(240),
   DELFLAG              NUMBER(1)
);

COMMENT ON COLUMN T_MSGLIST.MSGID IS
'消息ID';

COMMENT ON COLUMN T_MSGLIST.MSGTYPE IS
'消息类型';

COMMENT ON COLUMN T_MSGLIST.MSGLEVEL IS
'消息级别';

COMMENT ON COLUMN T_MSGLIST.SYSID IS
'子系统编号';

COMMENT ON COLUMN T_MSGLIST.DEVICEID IS
'设备编号';

COMMENT ON COLUMN T_MSGLIST.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_MSGLIST.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_MSGLIST.CREATEDTIME IS
'消息生成时间';

COMMENT ON COLUMN T_MSGLIST.STARTTIME IS
'消息开始处理时间';

COMMENT ON COLUMN T_MSGLIST.ENDTIME IS
'消息处理完成时间';

COMMENT ON COLUMN T_MSGLIST.REQDATA IS
'消息请求内容';

COMMENT ON COLUMN T_MSGLIST.RESPDATA IS
'消息应答内容';

COMMENT ON COLUMN T_MSGLIST.FUNCNO IS
'功能号';

COMMENT ON COLUMN T_MSGLIST.PFUNCNO IS
'父功能号';

COMMENT ON COLUMN T_MSGLIST.MAXSENDCNT IS
'最大发送次数';

COMMENT ON COLUMN T_MSGLIST.SENDCNT IS
'发送次数';

COMMENT ON COLUMN T_MSGLIST.RECVCNT IS
'接收次数';

COMMENT ON COLUMN T_MSGLIST.STATUS IS
'消息状态';

COMMENT ON COLUMN T_MSGLIST.SEQNO IS
'序号';

COMMENT ON COLUMN T_MSGLIST.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_MSGLIST.ERRCODE IS
'错误码';

COMMENT ON COLUMN T_MSGLIST.ERRMSG IS
'错误消息';

COMMENT ON COLUMN T_MSGLIST.DELFLAG IS
'删除标志';

ALTER TABLE T_MSGLIST
   ADD CONSTRAINT PK_T_MSGLIST PRIMARY KEY (MSGID);

/*==============================================================*/
/* Index: IDX_MSGLIST_DEVICEID                                  */
/*==============================================================*/
CREATE INDEX IDX_MSGLIST_DEVICEID ON T_MSGLIST (
   DEVICEID ASC
);

/*==============================================================*/
/* Table: T_NETACC                                              */
/*==============================================================*/
CREATE TABLE T_NETACC  (
   ACCNO                VARCHAR2(10)                    NOT NULL,
   ACCNAME              VARCHAR2(60),
   SUBJNO               VARCHAR2(10),
   ACCPWD               VARCHAR2(64),
   CUSTID               NUMBER(9),
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
'账号';

COMMENT ON COLUMN T_NETACC.ACCNAME IS
'帐户名';

COMMENT ON COLUMN T_NETACC.SUBJNO IS
'科目号';

COMMENT ON COLUMN T_NETACC.ACCPWD IS
'帐户密码';

COMMENT ON COLUMN T_NETACC.CUSTID IS
'客户号';

COMMENT ON COLUMN T_NETACC.STOPPAYFLAG IS
'止付标志';

COMMENT ON COLUMN T_NETACC.STATUS IS
'状态';

COMMENT ON COLUMN T_NETACC.YDAYBAL IS
'昨日余额';

COMMENT ON COLUMN T_NETACC.BALANCE IS
'帐户余额';

COMMENT ON COLUMN T_NETACC.AVAILBAL IS
'可用余额';

COMMENT ON COLUMN T_NETACC.FROZEBAL IS
'冻结余额';

COMMENT ON COLUMN T_NETACC.LASTTRANSDATE IS
'上次交易日期';

COMMENT ON COLUMN T_NETACC.LASTACCDATE IS
'上次清算日期';

COMMENT ON COLUMN T_NETACC.OPENDATE IS
'开户日期';

COMMENT ON COLUMN T_NETACC.CLOSEDATE IS
'销户日期';

ALTER TABLE T_NETACC
   ADD CONSTRAINT PK_T_NETACC PRIMARY KEY (ACCNO);

/*==============================================================*/
/* Table: T_NEWCARDCHANGE                                       */
/*==============================================================*/
CREATE TABLE T_NEWCARDCHANGE  (
   SHOWCARDNO           VARCHAR2(10)                    NOT NULL,
   STUEMPNO             VARCHAR2(20)                    NOT NULL,
   EXPIREDATE           VARCHAR2(8)                     NOT NULL,
   STATUS               NUMBER(1)                       NOT NULL,
   BATCHNO              VARCHAR2(20),
   SEQNO                NUMBER(9),
   CARDPHYID            VARCHAR2(16),
   OLDCARDPHYID         VARCHAR2(16),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_NEWCARDCHANGE.SHOWCARDNO IS
'显示卡号';

COMMENT ON COLUMN T_NEWCARDCHANGE.STUEMPNO IS
'学号';

COMMENT ON COLUMN T_NEWCARDCHANGE.EXPIREDATE IS
'卡有效期';

COMMENT ON COLUMN T_NEWCARDCHANGE.STATUS IS
'状态';

COMMENT ON COLUMN T_NEWCARDCHANGE.BATCHNO IS
'批次号';

COMMENT ON COLUMN T_NEWCARDCHANGE.SEQNO IS
'顺序号';

COMMENT ON COLUMN T_NEWCARDCHANGE.CARDPHYID IS
'卡物理ID';

COMMENT ON COLUMN T_NEWCARDCHANGE.OLDCARDPHYID IS
'旧卡物理ID';

COMMENT ON COLUMN T_NEWCARDCHANGE.LASTSAVED IS
'最后保存时间';

ALTER TABLE T_NEWCARDCHANGE
   ADD CONSTRAINT PK_T_NEWCARDCHANGE PRIMARY KEY (SHOWCARDNO);

/*==============================================================*/
/* Index: INDEX_NEWCARDCHG_BATCHNO                              */
/*==============================================================*/
CREATE INDEX INDEX_NEWCARDCHG_BATCHNO ON T_NEWCARDCHANGE (
   BATCHNO ASC,
   SEQNO ASC
);

/*==============================================================*/
/* Table: T_OPERATOR                                            */
/*==============================================================*/
CREATE TABLE T_OPERATOR  (
   OPERID               NUMBER(9)                       NOT NULL,
   OPERCODE             VARCHAR2(8)                     NOT NULL,
   OPERTYPE             NUMBER(1)                       NOT NULL,
   BRANCHNO             NUMBER(9),
   CARDNO               NUMBER(9),
   OPERNAME             VARCHAR2(60)                    NOT NULL,
   OPERSEQNO            NUMBER(9),
   TEL                  VARCHAR2(20),
   MOBILE               VARCHAR2(20),
   EMAIL                VARCHAR2(60),
   ADDR                 VARCHAR2(240),
   ZIPCODE              VARCHAR2(6),
   OPERPWD              VARCHAR2(32),
   STATUS               NUMBER(1)                       NOT NULL,
   CHECKNUM             NUMBER(9),
   IP                   VARCHAR2(15),
   MACADDR              VARCHAR2(17),
   PROGNAME             VARCHAR2(90),
   PROGVERNO            VARCHAR2(60),
   LASTACCDATE        VARCHAR2(8),
   RIGHTFLAG            NUMBER(1),
   SITELIMIT            NUMBER(1),
   LOGINFLAG            NUMBER(1),
   LOGINSITENO          NUMBER(9),
   LOGINTIME            VARCHAR2(30),
   LOGOUTTIME           VARCHAR2(30),
   FAILNUMBER           NUMBER(9),
   OPENDATE             VARCHAR2(8),
   CLOSEDATE            VARCHAR2(8)
);

COMMENT ON COLUMN T_OPERATOR.OPERID IS
'操作员ID';

COMMENT ON COLUMN T_OPERATOR.OPERCODE IS
'操作员代码';

COMMENT ON COLUMN T_OPERATOR.OPERTYPE IS
'操作员类型';

COMMENT ON COLUMN T_OPERATOR.BRANCHNO IS
'所属网点号';

COMMENT ON COLUMN T_OPERATOR.CARDNO IS
'操作员卡号';

COMMENT ON COLUMN T_OPERATOR.OPERNAME IS
'操作员姓名';

COMMENT ON COLUMN T_OPERATOR.OPERSEQNO IS
'操作员流水号';

COMMENT ON COLUMN T_OPERATOR.TEL IS
'电话';

COMMENT ON COLUMN T_OPERATOR.MOBILE IS
'手机';

COMMENT ON COLUMN T_OPERATOR.EMAIL IS
'电子邮箱';

COMMENT ON COLUMN T_OPERATOR.ADDR IS
'地址';

COMMENT ON COLUMN T_OPERATOR.ZIPCODE IS
'邮政编码';

COMMENT ON COLUMN T_OPERATOR.OPERPWD IS
'密码';

COMMENT ON COLUMN T_OPERATOR.STATUS IS
'状态:0-锁定1-正常2-注销';

COMMENT ON COLUMN T_OPERATOR.CHECKNUM IS
'校验码';

COMMENT ON COLUMN T_OPERATOR.IP IS
'IP';

COMMENT ON COLUMN T_OPERATOR.MACADDR IS
'MAC地址';

COMMENT ON COLUMN T_OPERATOR.PROGNAME IS
'程序名';

COMMENT ON COLUMN T_OPERATOR.PROGVERNO IS
'程序版本';

COMMENT ON COLUMN T_OPERATOR.LASTACCDATE IS
'最后解款日期';

COMMENT ON COLUMN T_OPERATOR.RIGHTFLAG IS
'权限标志';

COMMENT ON COLUMN T_OPERATOR.SITELIMIT IS
'是否有站点限制:0-无限制1-有限制';

COMMENT ON COLUMN T_OPERATOR.LOGINFLAG IS
'登录标志:0-未登录1-已登录';

COMMENT ON COLUMN T_OPERATOR.LOGINSITENO IS
'登录站点号';

COMMENT ON COLUMN T_OPERATOR.LOGINTIME IS
'登录时间';

COMMENT ON COLUMN T_OPERATOR.LOGOUTTIME IS
'签出时间';

COMMENT ON COLUMN T_OPERATOR.FAILNUMBER IS
'登录失败次数';

COMMENT ON COLUMN T_OPERATOR.OPENDATE IS
'注册日期';

COMMENT ON COLUMN T_OPERATOR.CLOSEDATE IS
'注销日期';

ALTER TABLE T_OPERATOR
   ADD CONSTRAINT PK_T_OPERATOR PRIMARY KEY (OPERID);

/*==============================================================*/
/* Table: T_OPERAUTH                                            */
/*==============================================================*/
CREATE TABLE T_OPERAUTH  (
   OPERCODE             VARCHAR2(8)                     NOT NULL,
   AUTHTYPE             NUMBER(9)                       NOT NULL,
   AUTHORIZER           VARCHAR2(8),
   AUTHDATE             VARCHAR2(8)
);

COMMENT ON COLUMN T_OPERAUTH.OPERCODE IS
'操作员';

COMMENT ON COLUMN T_OPERAUTH.AUTHTYPE IS
'权限代码';

COMMENT ON COLUMN T_OPERAUTH.AUTHORIZER IS
'授权人';

COMMENT ON COLUMN T_OPERAUTH.AUTHDATE IS
'授权日期';

ALTER TABLE T_OPERAUTH
   ADD CONSTRAINT PK_T_OPERAUTH PRIMARY KEY (OPERCODE, AUTHTYPE);

/*==============================================================*/
/* Table: T_OPERDTL                                             */
/*==============================================================*/
CREATE TABLE T_OPERDTL  (
   ID                   NUMBER(9)                       NOT NULL,
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   ACCTIME              VARCHAR2(6),
   OPERID               NUMBER(9)                       NOT NULL,
   OPERSEQNO            NUMBER(9)                      DEFAULT 0 NOT NULL,
   CHKOPERID            NUMBER(9),
   TRANSCODE            NUMBER(4),
   REFNO                VARCHAR2(20),
   TERMID               NUMBER(9),
   TERMDATE             VARCHAR2(8),
   TERMTIME             VARCHAR2(6),
   STATUS               NUMBER(1),
   TRANSINFO            VARCHAR2(480),
   REQDATA              VARCHAR2(1000)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_OPERDTL.ID IS
'记录ID';

COMMENT ON COLUMN T_OPERDTL.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_OPERDTL.ACCTIME IS
'记账时间';

COMMENT ON COLUMN T_OPERDTL.OPERID IS
'操作员ID';

COMMENT ON COLUMN T_OPERDTL.OPERSEQNO IS
'操作员流水号';

COMMENT ON COLUMN T_OPERDTL.CHKOPERID IS
'审核操作员ID';

COMMENT ON COLUMN T_OPERDTL.TRANSCODE IS
'交易码';

COMMENT ON COLUMN T_OPERDTL.REFNO IS
'参考号';

COMMENT ON COLUMN T_OPERDTL.TERMID IS
'终端号';

COMMENT ON COLUMN T_OPERDTL.TERMDATE IS
'终端日期';

COMMENT ON COLUMN T_OPERDTL.TERMTIME IS
'终端时间';

COMMENT ON COLUMN T_OPERDTL.STATUS IS
'流水状态1-未处理2-失败3-成功4-冲正';

COMMENT ON COLUMN T_OPERDTL.TRANSINFO IS
'交易信息';

COMMENT ON COLUMN T_OPERDTL.REQDATA IS
'请求数据';

ALTER TABLE T_OPERDTL
   ADD CONSTRAINT PK_T_OPERDTL PRIMARY KEY (ID);

/*==============================================================*/
/* Index: IDX_OPERDTL_REFNO                                     */
/*==============================================================*/
CREATE INDEX IDX_OPERDTL_REFNO ON T_OPERDTL (
   REFNO ASC
)
TABLESPACE TS_YKT_HIS;

/*==============================================================*/
/* Table: T_OPERROLE                                            */
/*==============================================================*/
CREATE TABLE T_OPERROLE  (
   OPERROLEID           NUMBER(9)                       NOT NULL,
   OPERID               NUMBER(9)                       NOT NULL,
   ROLEID               NUMBER(9)                       NOT NULL,
   CREATEDATE           NUMBER(8)
);

COMMENT ON COLUMN T_OPERROLE.OPERROLEID IS
'用户角色ID';

COMMENT ON COLUMN T_OPERROLE.OPERID IS
'用户ID';

COMMENT ON COLUMN T_OPERROLE.ROLEID IS
'角色ID';

COMMENT ON COLUMN T_OPERROLE.CREATEDATE IS
'创建日期';

ALTER TABLE T_OPERROLE
   ADD CONSTRAINT PK_T_OPERROLE PRIMARY KEY (OPERROLEID);

/*==============================================================*/
/* Index: UNIQ_OPERROLE                                         */
/*==============================================================*/
CREATE UNIQUE INDEX UNIQ_OPERROLE ON T_OPERROLE (
   OPERID ASC,
   ROLEID ASC
);

/*==============================================================*/
/* Table: T_OPERSEQNO                                           */
/*==============================================================*/
CREATE TABLE T_OPERSEQNO  (
   OPERID               NUMBER(9)                       NOT NULL,
   OPERSEQNO            NUMBER(9)                      DEFAULT 0 NOT NULL,
   CHECKNUM             NUMBER(9)                       NOT NULL,
   UPDTIME              VARCHAR2(14)
);

COMMENT ON COLUMN T_OPERSEQNO.OPERID IS
'操作员ID';

COMMENT ON COLUMN T_OPERSEQNO.OPERSEQNO IS
'操作员流水号';

COMMENT ON COLUMN T_OPERSEQNO.CHECKNUM IS
'校验码';

COMMENT ON COLUMN T_OPERSEQNO.UPDTIME IS
'最后保存时间';

ALTER TABLE T_OPERSEQNO
   ADD CONSTRAINT PK_T_OPERSEQNO PRIMARY KEY (OPERID, OPERSEQNO);

/*==============================================================*/
/* Table: T_OPERSITE                                            */
/*==============================================================*/
CREATE TABLE T_OPERSITE  (
   OPERID               NUMBER(9)                       NOT NULL,
   SITENO               NUMBER(9)                       NOT NULL,
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_OPERSITE.OPERID IS
'操作员号';

COMMENT ON COLUMN T_OPERSITE.SITENO IS
'站点号';

COMMENT ON COLUMN T_OPERSITE.LASTSAVED IS
'最后保存时间';

ALTER TABLE T_OPERSITE
   ADD CONSTRAINT PK_T_OPERSITE PRIMARY KEY (OPERID, SITENO);

/*==============================================================*/
/* Table: T_PAYMENTDTL                                          */
/*==============================================================*/
CREATE TABLE T_PAYMENTDTL  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   TERMID               NUMBER(9)                       NOT NULL,
   TERMSEQNO            NUMBER(9)                       NOT NULL,
   SHOPID               NUMBER(9),
   ACCNO                VARCHAR2(10),
   ACCNAME              VARCHAR2(90),
   TRANSDATE            VARCHAR2(8),
   TRANSTIME            VARCHAR2(6),
   AMOUNT               NUMBER(15,2),
   PAYBANKACCNO         VARCHAR2(20),
   PAYBANKACCNAME       VARCHAR2(90),
   PAYEEBANKACCNO       VARCHAR2(20),
   PAYEEBANKACCNAME     VARCHAR2(90),
   OPERCODE             VARCHAR2(8)
);

COMMENT ON COLUMN T_PAYMENTDTL.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_PAYMENTDTL.TERMID IS
'终端号';

COMMENT ON COLUMN T_PAYMENTDTL.TERMSEQNO IS
'终端流水号';

COMMENT ON COLUMN T_PAYMENTDTL.SHOPID IS
'商户号';

COMMENT ON COLUMN T_PAYMENTDTL.ACCNO IS
'账号';

COMMENT ON COLUMN T_PAYMENTDTL.ACCNAME IS
'账户名';

COMMENT ON COLUMN T_PAYMENTDTL.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_PAYMENTDTL.TRANSTIME IS
'交易时间';

COMMENT ON COLUMN T_PAYMENTDTL.AMOUNT IS
'金额';

COMMENT ON COLUMN T_PAYMENTDTL.PAYBANKACCNO IS
'付款方银行账号';

COMMENT ON COLUMN T_PAYMENTDTL.PAYBANKACCNAME IS
'付款方银行账户名';

COMMENT ON COLUMN T_PAYMENTDTL.PAYEEBANKACCNO IS
'收款方银行账号';

COMMENT ON COLUMN T_PAYMENTDTL.PAYEEBANKACCNAME IS
'收款方银行账户名';

COMMENT ON COLUMN T_PAYMENTDTL.OPERCODE IS
'操作员号';

ALTER TABLE T_PAYMENTDTL
   ADD CONSTRAINT PK_T_PAYMENTDTL PRIMARY KEY (ACCDATE, TERMID, TERMSEQNO);

/*==============================================================*/
/* Table: T_PAYPARA                                             */
/*==============================================================*/
CREATE TABLE T_PAYPARA  (
   PARANAME             VARCHAR2(60)                    NOT NULL,
   PAYCODE              NUMBER(9)                       NOT NULL,
   PARAVAL              VARCHAR2(60),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_PAYPARA.PARANAME IS
'PARANAME';

COMMENT ON COLUMN T_PAYPARA.PAYCODE IS
'PAYCODE';

COMMENT ON COLUMN T_PAYPARA.PARAVAL IS
'PARAVAL';

COMMENT ON COLUMN T_PAYPARA.REMARK IS
'REMARK';

ALTER TABLE T_PAYPARA
   ADD CONSTRAINT PK_T_PAYPARA PRIMARY KEY (PARANAME, PAYCODE);

/*==============================================================*/
/* Table: T_PHOTO                                               */
/*==============================================================*/
CREATE TABLE T_PHOTO  (
   CUSTID               NUMBER(9)                       NOT NULL,
   STUEMPNO             VARCHAR2(20),
   PHOTO                BLOB,
   MINPHOTO             BLOB,
   PHOTODATE            VARCHAR2(8),
   PHOTOTIME            VARCHAR2(6),
   IFCARD               CHAR(1),
   MAKECARDDATE         VARCHAR2(8),
   MAKECARDTIME         VARCHAR2(6),
   PHOTOEXACTTIME       VARCHAR2(30)
)
TABLESPACE TS_YKT_PHOTO;

COMMENT ON COLUMN T_PHOTO.CUSTID IS
'客户号';

COMMENT ON COLUMN T_PHOTO.STUEMPNO IS
'学工号';

COMMENT ON COLUMN T_PHOTO.PHOTO IS
'照片';

COMMENT ON COLUMN T_PHOTO.MINPHOTO IS
'小照片';

COMMENT ON COLUMN T_PHOTO.PHOTODATE IS
'拍照日期';

COMMENT ON COLUMN T_PHOTO.PHOTOTIME IS
'拍照时间';

COMMENT ON COLUMN T_PHOTO.IFCARD IS
'是否有卡';

COMMENT ON COLUMN T_PHOTO.MAKECARDDATE IS
'制卡日期';

COMMENT ON COLUMN T_PHOTO.MAKECARDTIME IS
'制卡时间';

COMMENT ON COLUMN T_PHOTO.PHOTOEXACTTIME IS
'更新时间';

ALTER TABLE T_PHOTO
   ADD CONSTRAINT PK_T_PHOTO PRIMARY KEY (CUSTID);

/*==============================================================*/
/* Index: IDX_STUEMPNO                                          */
/*==============================================================*/
CREATE INDEX IDX_STUEMPNO ON T_PHOTO (
   STUEMPNO ASC
);

/*==============================================================*/
/* Table: T_PHOTOLIMIT                                          */
/*==============================================================*/
CREATE TABLE T_PHOTOLIMIT  (
   OPERCODE             VARCHAR2(8)                     NOT NULL,
   OPERNAME             VARCHAR2(60),
   OPERPWD              VARCHAR2(64),
   OPERLIMIT            VARCHAR2(60),
   ENABLED              CHAR(1),
   BEGINDATE            VARCHAR2(8),
   ENDDATE              VARCHAR2(8),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_PHOTOLIMIT.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_PHOTOLIMIT.OPERNAME IS
'操作员名称';

COMMENT ON COLUMN T_PHOTOLIMIT.OPERPWD IS
'操作员密码';

COMMENT ON COLUMN T_PHOTOLIMIT.OPERLIMIT IS
'权限';

COMMENT ON COLUMN T_PHOTOLIMIT.ENABLED IS
'是否可用';

COMMENT ON COLUMN T_PHOTOLIMIT.BEGINDATE IS
'生效日期';

COMMENT ON COLUMN T_PHOTOLIMIT.ENDDATE IS
'失效日期';

COMMENT ON COLUMN T_PHOTOLIMIT.REMARK IS
'备注';

ALTER TABLE T_PHOTOLIMIT
   ADD CONSTRAINT PK_T_PHOTOLIMIT PRIMARY KEY (OPERCODE);

/*==============================================================*/
/* Table: T_PHYDEVICE                                           */
/*==============================================================*/
CREATE TABLE T_PHYDEVICE  (
   PHYTYPE              NUMBER(9)                       NOT NULL,
   DNAME                VARCHAR2(60),
   DTYPE                VARCHAR2(60),
   FACTORY              VARCHAR2(60),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_PHYDEVICE.PHYTYPE IS
'PHYTYPE';

COMMENT ON COLUMN T_PHYDEVICE.DNAME IS
'DNAME';

COMMENT ON COLUMN T_PHYDEVICE.DTYPE IS
'DTYPE';

COMMENT ON COLUMN T_PHYDEVICE.FACTORY IS
'FACTORY';

COMMENT ON COLUMN T_PHYDEVICE.REMARK IS
'REMARK';

ALTER TABLE T_PHYDEVICE
   ADD CONSTRAINT PK_T_PHYDEVICE PRIMARY KEY (PHYTYPE);

/*==============================================================*/
/* Table: T_PLANTASK                                            */
/*==============================================================*/
CREATE TABLE T_PLANTASK  (
   TASKNO               NUMBER(9)                       NOT NULL,
   SUMMARY              VARCHAR2(60),
   PROGNAME             VARCHAR2(60),
   PROGPATH             VARCHAR2(240),
   PROGARGV             VARCHAR2(240),
   DIALY                NUMBER(9),
   WEEKLY               NUMBER(9),
   MONTHLY              NUMBER(9),
   STARTTIME            VARCHAR2(6),
   ENDTIME              VARCHAR2(6),
   USEFLAG              CHAR(1)
);

COMMENT ON COLUMN T_PLANTASK.TASKNO IS
'任务编号,取最大值加1';

COMMENT ON COLUMN T_PLANTASK.SUMMARY IS
'任务说明';

COMMENT ON COLUMN T_PLANTASK.PROGNAME IS
'程序名';

COMMENT ON COLUMN T_PLANTASK.PROGPATH IS
'程序路径';

COMMENT ON COLUMN T_PLANTASK.PROGARGV IS
'命令行参数';

COMMENT ON COLUMN T_PLANTASK.DIALY IS
'每天一次,取值范围0-1,0表示禁用';

COMMENT ON COLUMN T_PLANTASK.WEEKLY IS
'每星期一次,取值范围0-7,0表示禁用';

COMMENT ON COLUMN T_PLANTASK.MONTHLY IS
'每月一次,取值范围0-31,0表示禁用';

COMMENT ON COLUMN T_PLANTASK.STARTTIME IS
'运行开始时间';

COMMENT ON COLUMN T_PLANTASK.ENDTIME IS
'运行结束时间';

COMMENT ON COLUMN T_PLANTASK.USEFLAG IS
'是否启用';

ALTER TABLE T_PLANTASK
   ADD CONSTRAINT PK_T_PLANTASK PRIMARY KEY (TASKNO);

/*==============================================================*/
/* Table: T_PLANTASKLOG                                         */
/*==============================================================*/
CREATE TABLE T_PLANTASKLOG  (
   TRANSDATE            VARCHAR2(8)                     NOT NULL,
   STARTTIME            VARCHAR2(6)                     NOT NULL,
   TASKNO               NUMBER(9)                       NOT NULL,
   PROGNAME             VARCHAR2(60),
   ENDTIME              VARCHAR2(30),
   RUNSTATUS            NUMBER(9),
   SUMMARY              VARCHAR2(240)
);

COMMENT ON COLUMN T_PLANTASKLOG.TRANSDATE IS
'运行日期';

COMMENT ON COLUMN T_PLANTASKLOG.STARTTIME IS
'运行时间';

COMMENT ON COLUMN T_PLANTASKLOG.TASKNO IS
'任务编号';

COMMENT ON COLUMN T_PLANTASKLOG.PROGNAME IS
'程序名';

COMMENT ON COLUMN T_PLANTASKLOG.ENDTIME IS
'运行结束时间，格式为yyyy-mm-dd hh:mm:ss';

COMMENT ON COLUMN T_PLANTASKLOG.RUNSTATUS IS
'运行状态:0-运行中,1-成功,2-失败';

COMMENT ON COLUMN T_PLANTASKLOG.SUMMARY IS
'运行结果说明';

ALTER TABLE T_PLANTASKLOG
   ADD CONSTRAINT PK_T_PLANTASKLOG PRIMARY KEY (TRANSDATE, STARTTIME, TASKNO);

/*==============================================================*/
/* Table: T_POSDATA                                             */
/*==============================================================*/
CREATE TABLE T_POSDATA  (
   ID                   NUMBER(9)                       NOT NULL,
   SENDERID             NUMBER(9),
   SENDERCODE           VARCHAR2(10),
   POSPHYID             VARCHAR2(20)                    NOT NULL,
   POSSEQNO             NUMBER(9)                       NOT NULL,
   MERCHNO              VARCHAR2(15),
   TERMNO               VARCHAR2(12),
   TERMSEQNO            NUMBER(9),
   TRANSDATE            NUMBER(8),
   TRANSTIME            NUMBER(6),
   CARDNO               NUMBER(9)                       NOT NULL,
   PAYCNT               NUMBER(9)                       NOT NULL,
   CARDBEFBAL           NUMBER(9),
   CARDAFTBAL           NUMBER(9),
   REVERSED             NUMBER(1),
   PAYAMT               NUMBER(9),
   FEEAMT               NUMBER(9),
   AMOUNT               NUMBER(9),
   DATATYPE             NUMBER(2),
   SENDTYPE             NUMBER(1),
   WITHPASSWD           NUMBER(1),
   UPDRESULT            NUMBER(1),
   TACVERIFIED          NUMBER(1),
   TAC                  VARCHAR2(8),
   MAC                  VARCHAR2(8),
   RECVTIME             VARCHAR2(14),
   REFNO                VARCHAR2(20),
   IGNTIME              NUMBER(1),
   IGNCNT               NUMBER(1),
   STATUS               NUMBER(1)                       NOT NULL,
   ERRCODE              NUMBER(9),
   REMARK               VARCHAR2(240)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_POSDATA.ID IS
'ID';

COMMENT ON COLUMN T_POSDATA.SENDERID IS
'发送方ID';

COMMENT ON COLUMN T_POSDATA.SENDERCODE IS
'POS厂商类别';

COMMENT ON COLUMN T_POSDATA.POSPHYID IS
'设备物理ID';

COMMENT ON COLUMN T_POSDATA.POSSEQNO IS
'设备流水号';

COMMENT ON COLUMN T_POSDATA.MERCHNO IS
'商户卡号';

COMMENT ON COLUMN T_POSDATA.TERMNO IS
'SAM卡终端编号';

COMMENT ON COLUMN T_POSDATA.TERMSEQNO IS
'SAM卡流水号';

COMMENT ON COLUMN T_POSDATA.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_POSDATA.TRANSTIME IS
'交易时间';

COMMENT ON COLUMN T_POSDATA.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_POSDATA.PAYCNT IS
'卡交易次数';

COMMENT ON COLUMN T_POSDATA.CARDBEFBAL IS
'交易前卡余额';

COMMENT ON COLUMN T_POSDATA.CARDAFTBAL IS
'交易后卡余额';

COMMENT ON COLUMN T_POSDATA.REVERSED IS
'冲正标志';

COMMENT ON COLUMN T_POSDATA.PAYAMT IS
'消费金额';

COMMENT ON COLUMN T_POSDATA.FEEAMT IS
'搭伙费/折扣费';

COMMENT ON COLUMN T_POSDATA.AMOUNT IS
'实际金额';

COMMENT ON COLUMN T_POSDATA.DATATYPE IS
'数据类型';

COMMENT ON COLUMN T_POSDATA.SENDTYPE IS
'数据上送类型';

COMMENT ON COLUMN T_POSDATA.WITHPASSWD IS
'是否通过密码消费';

COMMENT ON COLUMN T_POSDATA.UPDRESULT IS
'写卡结果';

COMMENT ON COLUMN T_POSDATA.TACVERIFIED IS
'0-未验证1已验证';

COMMENT ON COLUMN T_POSDATA.TAC IS
'TAC码';

COMMENT ON COLUMN T_POSDATA.MAC IS
'MAC';

COMMENT ON COLUMN T_POSDATA.RECVTIME IS
'采集时间';

COMMENT ON COLUMN T_POSDATA.REFNO IS
'参考号';

COMMENT ON COLUMN T_POSDATA.IGNTIME IS
'是否忽略消费时间';

COMMENT ON COLUMN T_POSDATA.IGNCNT IS
'是否忽略消费次数';

COMMENT ON COLUMN T_POSDATA.STATUS IS
'状态-1初始状态2-入账失败3-成功4-异常流水';

COMMENT ON COLUMN T_POSDATA.ERRCODE IS
'错误码';

COMMENT ON COLUMN T_POSDATA.REMARK IS
'备注';

ALTER TABLE T_POSDATA
   ADD CONSTRAINT PK_T_POSDATA PRIMARY KEY (ID);

/*==============================================================*/
/* Index: IDX_POSDATA_STATUS                                    */
/*==============================================================*/
CREATE INDEX IDX_POSDATA_STATUS ON T_POSDATA (
   STATUS ASC
)
TABLESPACE TS_YKT_HIS;

/*==============================================================*/
/* Index: UNIQ_POSDATA                                          */
/*==============================================================*/
CREATE UNIQUE INDEX UNIQ_POSDATA ON T_POSDATA (
   CARDNO ASC,
   PAYCNT ASC,
   POSPHYID ASC,
   POSSEQNO ASC
)
TABLESPACE TS_YKT_HIS;

/*==============================================================*/
/* Table: T_POSDATATMP                                          */
/*==============================================================*/
CREATE TABLE T_POSDATATMP  (
   BATCHNO              VARCHAR2(20)                    NOT NULL,
   ROWNO                NUMBER(9)                       NOT NULL,
   ROWDATA              VARCHAR2(240),
   FACTORYCODE          VARCHAR2(20),
   POSPHYID             VARCHAR2(20),
   POSSEQNO             NUMBER(9),
   MERCHNO              VARCHAR2(15),
   TERMNO               VARCHAR2(12),
   TERMSEQNO            NUMBER(9),
   TRANSDATE            NUMBER(8),
   TRANSTIME            NUMBER(6),
   CARDNO               NUMBER(9),
   PAYCNT               NUMBER(9),
   CARDBEFBAL           NUMBER(9),
   CARDAFTBAL           NUMBER(9),
   REVERSED             NUMBER(1),
   PAYAMT               NUMBER(9),
   FEEAMT               NUMBER(9),
   AMOUNT               NUMBER(9),
   DATATYPE             NUMBER(2),
   SENDTYPE             NUMBER(1),
   WITHPASSWD           NUMBER(1),
   UPDRESULT            NUMBER(1),
   TAC                  VARCHAR2(8),
   VALIDTYPE            NUMBER(1),
   STATUS               NUMBER(1)                       NOT NULL,
   REMARK               VARCHAR2(240),
   IMPOPERID            NUMBER(9),
   IMPTIME              VARCHAR2(14),
   CHKOPERID            NUMBER(9),
   CHKTIME              VARCHAR2(14)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_POSDATATMP.BATCHNO IS
'批次号';

COMMENT ON COLUMN T_POSDATATMP.ROWNO IS
'记录号';

COMMENT ON COLUMN T_POSDATATMP.ROWDATA IS
'记录数据';

COMMENT ON COLUMN T_POSDATATMP.FACTORYCODE IS
'POS厂商类别';

COMMENT ON COLUMN T_POSDATATMP.POSPHYID IS
'设备物理ID';

COMMENT ON COLUMN T_POSDATATMP.POSSEQNO IS
'设备流水号';

COMMENT ON COLUMN T_POSDATATMP.MERCHNO IS
'商户卡号';

COMMENT ON COLUMN T_POSDATATMP.TERMNO IS
'SAM卡终端编号';

COMMENT ON COLUMN T_POSDATATMP.TERMSEQNO IS
'SAM卡流水号';

COMMENT ON COLUMN T_POSDATATMP.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_POSDATATMP.TRANSTIME IS
'交易时间';

COMMENT ON COLUMN T_POSDATATMP.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_POSDATATMP.PAYCNT IS
'卡交易次数';

COMMENT ON COLUMN T_POSDATATMP.CARDBEFBAL IS
'交易前卡余额';

COMMENT ON COLUMN T_POSDATATMP.CARDAFTBAL IS
'交易后卡余额';

COMMENT ON COLUMN T_POSDATATMP.REVERSED IS
'冲正标志';

COMMENT ON COLUMN T_POSDATATMP.PAYAMT IS
'消费金额';

COMMENT ON COLUMN T_POSDATATMP.FEEAMT IS
'搭伙费/折扣费';

COMMENT ON COLUMN T_POSDATATMP.AMOUNT IS
'实际金额';

COMMENT ON COLUMN T_POSDATATMP.DATATYPE IS
'交易标记';

COMMENT ON COLUMN T_POSDATATMP.SENDTYPE IS
'数据上送类型';

COMMENT ON COLUMN T_POSDATATMP.WITHPASSWD IS
'是否通过密码消费';

COMMENT ON COLUMN T_POSDATATMP.UPDRESULT IS
'写卡结果';

COMMENT ON COLUMN T_POSDATATMP.TAC IS
'TAC码';

COMMENT ON COLUMN T_POSDATATMP.VALIDTYPE IS
'有效标志';

COMMENT ON COLUMN T_POSDATATMP.STATUS IS
'状态-1未审核2-审核失败3-成功4-异常流水';

COMMENT ON COLUMN T_POSDATATMP.REMARK IS
'备注';

COMMENT ON COLUMN T_POSDATATMP.IMPOPERID IS
'导入操作员ID';

COMMENT ON COLUMN T_POSDATATMP.IMPTIME IS
'数据导入时间';

COMMENT ON COLUMN T_POSDATATMP.CHKOPERID IS
'审核操作员ID';

COMMENT ON COLUMN T_POSDATATMP.CHKTIME IS
'审核时间';

ALTER TABLE T_POSDATATMP
   ADD CONSTRAINT PK_T_POSDATATMP PRIMARY KEY (BATCHNO, ROWNO);

/*==============================================================*/
/* Table: T_POSDPSDTL                                           */
/*==============================================================*/
CREATE TABLE T_POSDPSDTL  (
   TRANSDATE            VARCHAR2(8)                     NOT NULL,
   TRANSTIME            VARCHAR2(6),
   TERMID               NUMBER(9),
   DEVPHYID             VARCHAR2(20)                    NOT NULL,
   DEVSEQNO             NUMBER(9)                       NOT NULL,
   CARDNO               NUMBER(9)                       NOT NULL,
   PURSENO              NUMBER(1),
   CARDCNT              NUMBER(9),
   CARDBEFBAL           NUMBER(15,2),
   AMOUNT               NUMBER(15,2),
   CARDAFTBAL           NUMBER(15,2),
   MANAGEFEE            NUMBER(15,2),
   TRANSMARK            NUMBER(9),
   DATATYPE             NUMBER(1),
   TRANSCODE            NUMBER(9),
   SHOPID               NUMBER(9),
   SUBSIDYNO            NUMBER(9),
   BATCHNO              VARCHAR2(20),
   SYSID                NUMBER(9),
   COLDATE              VARCHAR2(8),
   COLTIME              VARCHAR2(6),
   ACCDATE              VARCHAR2(8),
   ACCTIME              VARCHAR2(6),
   TERMSEQNO            NUMBER(9),
   STATUS               NUMBER(1)                       NOT NULL,
   ERRCODE              NUMBER(9),
   ERRMSG               VARCHAR2(240),
   DELFLAG              NUMBER(1)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_POSDPSDTL.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_POSDPSDTL.TRANSTIME IS
'交易时间';

COMMENT ON COLUMN T_POSDPSDTL.TERMID IS
'终端号';

COMMENT ON COLUMN T_POSDPSDTL.DEVPHYID IS
'设备物理ID';

COMMENT ON COLUMN T_POSDPSDTL.DEVSEQNO IS
'设备流水号';

COMMENT ON COLUMN T_POSDPSDTL.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_POSDPSDTL.PURSENO IS
'钱包号';

COMMENT ON COLUMN T_POSDPSDTL.CARDCNT IS
'卡交易次数';

COMMENT ON COLUMN T_POSDPSDTL.CARDBEFBAL IS
'交易前卡余额';

COMMENT ON COLUMN T_POSDPSDTL.AMOUNT IS
'发生额-包含管理费';

COMMENT ON COLUMN T_POSDPSDTL.CARDAFTBAL IS
'交易后卡余额';

COMMENT ON COLUMN T_POSDPSDTL.MANAGEFEE IS
'管理费';

COMMENT ON COLUMN T_POSDPSDTL.TRANSMARK IS
'交易标记';

COMMENT ON COLUMN T_POSDPSDTL.DATATYPE IS
'数据类型';

COMMENT ON COLUMN T_POSDPSDTL.TRANSCODE IS
'交易码';

COMMENT ON COLUMN T_POSDPSDTL.SHOPID IS
'商户卡号';

COMMENT ON COLUMN T_POSDPSDTL.SUBSIDYNO IS
'补助批次号';

COMMENT ON COLUMN T_POSDPSDTL.BATCHNO IS
'导入批次号';

COMMENT ON COLUMN T_POSDPSDTL.SYSID IS
'子系统ID';

COMMENT ON COLUMN T_POSDPSDTL.COLDATE IS
'采集日期';

COMMENT ON COLUMN T_POSDPSDTL.COLTIME IS
'采集时间';

COMMENT ON COLUMN T_POSDPSDTL.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_POSDPSDTL.ACCTIME IS
'记账时间';

COMMENT ON COLUMN T_POSDPSDTL.TERMSEQNO IS
'终端流水号';

COMMENT ON COLUMN T_POSDPSDTL.STATUS IS
'状态-1初始状态2-入账失败3-成功4-异常流水';

COMMENT ON COLUMN T_POSDPSDTL.ERRCODE IS
'错误码';

COMMENT ON COLUMN T_POSDPSDTL.ERRMSG IS
'错误信息';

COMMENT ON COLUMN T_POSDPSDTL.DELFLAG IS
'删除标志';

ALTER TABLE T_POSDPSDTL
   ADD CONSTRAINT PK_T_POSDPSDTL PRIMARY KEY (TRANSDATE, DEVPHYID, DEVSEQNO, CARDNO);

/*==============================================================*/
/* Index: IDX_POSDPSDTL_STATUS                                  */
/*==============================================================*/
CREATE INDEX IDX_POSDPSDTL_STATUS ON T_POSDPSDTL (
   STATUS ASC
)
TABLESPACE TS_YKT_HIS;

/*==============================================================*/
/* Table: T_POSDTL                                              */
/*==============================================================*/
CREATE TABLE T_POSDTL  (
   CARDNO               NUMBER(9)                       NOT NULL,
   CARDCNT              NUMBER(9)                       NOT NULL,
   DEVPHYID             VARCHAR2(20)                    NOT NULL,
   DEVSEQNO             NUMBER(9)                       NOT NULL,
   TRANSDATE            VARCHAR2(8),
   TRANSTIME            VARCHAR2(6),
   TERMID               NUMBER(9),
   PURSENO              NUMBER(1),
   CARDBEFBAL           NUMBER(15,2),
   AMOUNT               NUMBER(15,2),
   CARDAFTBAL           NUMBER(15,2),
   MANAGEFEE            NUMBER(15,2),
   TRANSMARK            NUMBER(9),
   DATATYPE             NUMBER(1),
   TRANSCODE            NUMBER(9),
   SHOPID               NUMBER(9),
   SUBSIDYNO            NUMBER(9),
   BATCHNO              VARCHAR2(20),
   SYSID                NUMBER(9),
   COLDATE              VARCHAR2(8),
   COLTIME              VARCHAR2(6),
   ACCDATE              VARCHAR2(8),
   ACCTIME              VARCHAR2(6),
   TERMSEQNO            NUMBER(9),
   STATUS               NUMBER(1)                       NOT NULL,
   ERRCODE              NUMBER(9),
   ERRMSG               VARCHAR2(240),
   DELFLAG              NUMBER(1)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_POSDTL.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_POSDTL.CARDCNT IS
'卡交易次数';

COMMENT ON COLUMN T_POSDTL.DEVPHYID IS
'设备物理ID';

COMMENT ON COLUMN T_POSDTL.DEVSEQNO IS
'设备流水号';

COMMENT ON COLUMN T_POSDTL.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_POSDTL.TRANSTIME IS
'交易时间';

COMMENT ON COLUMN T_POSDTL.TERMID IS
'终端号';

COMMENT ON COLUMN T_POSDTL.PURSENO IS
'钱包号';

COMMENT ON COLUMN T_POSDTL.CARDBEFBAL IS
'交易前卡余额';

COMMENT ON COLUMN T_POSDTL.AMOUNT IS
'发生额-包含管理费';

COMMENT ON COLUMN T_POSDTL.CARDAFTBAL IS
'交易后卡余额';

COMMENT ON COLUMN T_POSDTL.MANAGEFEE IS
'管理费';

COMMENT ON COLUMN T_POSDTL.TRANSMARK IS
'交易标记';

COMMENT ON COLUMN T_POSDTL.DATATYPE IS
'数据类型';

COMMENT ON COLUMN T_POSDTL.TRANSCODE IS
'交易码';

COMMENT ON COLUMN T_POSDTL.SHOPID IS
'商户卡号';

COMMENT ON COLUMN T_POSDTL.SUBSIDYNO IS
'补助批次号';

COMMENT ON COLUMN T_POSDTL.BATCHNO IS
'导入批次号';

COMMENT ON COLUMN T_POSDTL.SYSID IS
'子系统ID';

COMMENT ON COLUMN T_POSDTL.COLDATE IS
'采集日期';

COMMENT ON COLUMN T_POSDTL.COLTIME IS
'采集时间';

COMMENT ON COLUMN T_POSDTL.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_POSDTL.ACCTIME IS
'记账时间';

COMMENT ON COLUMN T_POSDTL.TERMSEQNO IS
'终端流水号';

COMMENT ON COLUMN T_POSDTL.STATUS IS
'状态-1初始状态2-入账失败3-成功4-异常流水';

COMMENT ON COLUMN T_POSDTL.ERRCODE IS
'错误码';

COMMENT ON COLUMN T_POSDTL.ERRMSG IS
'错误信息';

COMMENT ON COLUMN T_POSDTL.DELFLAG IS
'删除标志';

ALTER TABLE T_POSDTL
   ADD CONSTRAINT PK_T_POSDTL PRIMARY KEY (CARDNO, CARDCNT, DEVPHYID, DEVSEQNO);

/*==============================================================*/
/* Index: IDX_POSDTL_STATUS                                     */
/*==============================================================*/
CREATE INDEX IDX_POSDTL_STATUS ON T_POSDTL (
   STATUS ASC
)
TABLESPACE TS_YKT_HIS;

/*==============================================================*/
/* Table: T_POSDTLTMP                                           */
/*==============================================================*/
CREATE TABLE T_POSDTLTMP  (
   TRANSDATE            VARCHAR2(8)                     NOT NULL,
   TRANSTIME            VARCHAR2(6),
   DEVPHYID             VARCHAR2(20)                    NOT NULL,
   DEVSEQNO             NUMBER(9)                       NOT NULL,
   SHOPID               NUMBER(9),
   TRANSCODE            NUMBER(4),
   CARDNO               NUMBER(9)                       NOT NULL,
   CARDCNT              NUMBER(9),
   PURSENO              NUMBER(2),
   CARDBEFBAL           NUMBER(15,2),
   AMOUNT               NUMBER(15,2),
   CARDAFTBAL           NUMBER(15,2),
   MANAGEFEE            NUMBER(15,2),
   TRANSMARK            NUMBER(9),
   BATCHNO              VARCHAR2(20),
   SEQNO                NUMBER(9),
   IMPDATE              VARCHAR2(8),
   IMPTIME              VARCHAR2(6),
   IMPOPER              VARCHAR2(8),
   TERMSEQNO            NUMBER(9),
   STATUS               CHAR(1),
   VALIDTYPE            NUMBER(1),
   ERRMSG               VARCHAR2(240),
   CHKOPER              VARCHAR2(8),
   CHKDATE              VARCHAR2(8)
);

COMMENT ON COLUMN T_POSDTLTMP.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_POSDTLTMP.TRANSTIME IS
'交易时间';

COMMENT ON COLUMN T_POSDTLTMP.DEVPHYID IS
'设备物理ID';

COMMENT ON COLUMN T_POSDTLTMP.DEVSEQNO IS
'设备流水号';

COMMENT ON COLUMN T_POSDTLTMP.SHOPID IS
'商户卡号';

COMMENT ON COLUMN T_POSDTLTMP.TRANSCODE IS
'交易码';

COMMENT ON COLUMN T_POSDTLTMP.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_POSDTLTMP.CARDCNT IS
'卡交易次数';

COMMENT ON COLUMN T_POSDTLTMP.PURSENO IS
'钱包号';

COMMENT ON COLUMN T_POSDTLTMP.CARDBEFBAL IS
'交易前卡余额';

COMMENT ON COLUMN T_POSDTLTMP.AMOUNT IS
'发生额-包含管理费';

COMMENT ON COLUMN T_POSDTLTMP.CARDAFTBAL IS
'交易后卡余额';

COMMENT ON COLUMN T_POSDTLTMP.MANAGEFEE IS
'管理费';

COMMENT ON COLUMN T_POSDTLTMP.TRANSMARK IS
'交易标记';

COMMENT ON COLUMN T_POSDTLTMP.BATCHNO IS
'导入批次号';

COMMENT ON COLUMN T_POSDTLTMP.SEQNO IS
'导入序号';

COMMENT ON COLUMN T_POSDTLTMP.IMPDATE IS
'录入日期';

COMMENT ON COLUMN T_POSDTLTMP.IMPTIME IS
'录入日期';

COMMENT ON COLUMN T_POSDTLTMP.IMPOPER IS
'录入操作员号';

COMMENT ON COLUMN T_POSDTLTMP.TERMSEQNO IS
'录入流水号';

COMMENT ON COLUMN T_POSDTLTMP.STATUS IS
'流水状态:1-录入2-审核失败3-已审核';

COMMENT ON COLUMN T_POSDTLTMP.VALIDTYPE IS
'有效状态:1-有效2无效';

COMMENT ON COLUMN T_POSDTLTMP.ERRMSG IS
'错误信息';

COMMENT ON COLUMN T_POSDTLTMP.CHKOPER IS
'审核操作员号';

COMMENT ON COLUMN T_POSDTLTMP.CHKDATE IS
'审核日期';

ALTER TABLE T_POSDTLTMP
   ADD CONSTRAINT PK_T_POSDTLTMP PRIMARY KEY (TRANSDATE, DEVPHYID, DEVSEQNO, CARDNO);

/*==============================================================*/
/* Table: T_POSSEQNO                                            */
/*==============================================================*/
CREATE TABLE T_POSSEQNO  (
   DEVICEID             NUMBER(9)                       NOT NULL,
   DEVSEQNO             NUMBER(9)                       NOT NULL,
   TRANSDATE            VARCHAR2(8)                     NOT NULL
);

COMMENT ON COLUMN T_POSSEQNO.DEVICEID IS
'设备ID';

COMMENT ON COLUMN T_POSSEQNO.DEVSEQNO IS
'设备流水号';

COMMENT ON COLUMN T_POSSEQNO.TRANSDATE IS
'交易日期';

ALTER TABLE T_POSSEQNO
   ADD CONSTRAINT PK_T_POSSEQNO PRIMARY KEY (DEVICEID, DEVSEQNO, TRANSDATE);

/*==============================================================*/
/* Table: T_PSAMCARD                                            */
/*==============================================================*/
CREATE TABLE T_PSAMCARD  (
   CARDNO               NUMBER(9)                       NOT NULL,
   CARDTYPE             NUMBER(2),
   CARDVER              NUMBER(9),
   TERMNO               VARCHAR2(12),
   STATUS               NUMBER(1),
   STARTDATE            VARCHAR2(8),
   EXPIREDATE           VARCHAR2(8),
   KEYINDEX             NUMBER(9),
   DEVICEID             NUMBER(9),
   DEVJOINTIME          VARCHAR2(30),
   PUBLISHID            VARCHAR2(8),
   USERID               VARCHAR2(8),
   OPENDATE             VARCHAR2(8),
   CLOSEDATE            VARCHAR2(8),
   DISABLEDATE          VARCHAR2(8),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_PSAMCARD.CARDNO IS
'卡号';

COMMENT ON COLUMN T_PSAMCARD.CARDTYPE IS
'卡类型';

COMMENT ON COLUMN T_PSAMCARD.CARDVER IS
'卡版本号';

COMMENT ON COLUMN T_PSAMCARD.TERMNO IS
'终端编号';

COMMENT ON COLUMN T_PSAMCARD.STATUS IS
'状态';

COMMENT ON COLUMN T_PSAMCARD.STARTDATE IS
'启用日期';

COMMENT ON COLUMN T_PSAMCARD.EXPIREDATE IS
'过期日期';

COMMENT ON COLUMN T_PSAMCARD.KEYINDEX IS
'密钥索引';

COMMENT ON COLUMN T_PSAMCARD.DEVICEID IS
'设备ID';

COMMENT ON COLUMN T_PSAMCARD.DEVJOINTIME IS
'设备绑定日期';

COMMENT ON COLUMN T_PSAMCARD.PUBLISHID IS
'发行方ID';

COMMENT ON COLUMN T_PSAMCARD.USERID IS
'用户ID';

COMMENT ON COLUMN T_PSAMCARD.OPENDATE IS
'注册日期';

COMMENT ON COLUMN T_PSAMCARD.CLOSEDATE IS
'关闭日期';

COMMENT ON COLUMN T_PSAMCARD.DISABLEDATE IS
'停用日期';

COMMENT ON COLUMN T_PSAMCARD.LASTSAVED IS
'最后保存时间';

ALTER TABLE T_PSAMCARD
   ADD CONSTRAINT PK_T_PSAMCARD PRIMARY KEY (CARDNO);

/*==============================================================*/
/* Table: T_PURSE                                               */
/*==============================================================*/
CREATE TABLE T_PURSE  (
   PURSENO              NUMBER(2)                       NOT NULL,
   PURSENAME            VARCHAR2(60),
   CARDMAXBAL           NUMBER(15,2),
   USEFLAG              CHAR(1)
);

COMMENT ON COLUMN T_PURSE.PURSENO IS
'钱包号';

COMMENT ON COLUMN T_PURSE.PURSENAME IS
'钱包名';

COMMENT ON COLUMN T_PURSE.CARDMAXBAL IS
'最大存款金额';

COMMENT ON COLUMN T_PURSE.USEFLAG IS
'使用标志0-未使用1-已使用';

ALTER TABLE T_PURSE
   ADD CONSTRAINT PK_T_PURSE PRIMARY KEY (PURSENO);

/*==============================================================*/
/* Table: T_PURSEPOSDTL                                         */
/*==============================================================*/
CREATE TABLE T_PURSEPOSDTL  (
   CARDNO               NUMBER(9)                       NOT NULL,
   CARDCNT              NUMBER(9)                       NOT NULL,
   DEVPHYID             VARCHAR2(20)                    NOT NULL,
   DEVSEQNO             NUMBER(9)                       NOT NULL,
   TRANSDATE            VARCHAR2(8),
   TRANSTIME            VARCHAR2(6),
   PURSETYPE            NUMBER(1),
   TERMID               NUMBER(9),
   CARDBEFBAL           NUMBER(15,2),
   AMOUNT               NUMBER(15,2),
   CARDAFTBAL           NUMBER(15,2),
   TRANSMARK            NUMBER(9),
   DATATYPE             NUMBER(1),
   SHOPID               NUMBER(9),
   BATCHNO              VARCHAR2(20),
   SYSID                NUMBER(9),
   COLDATE              VARCHAR2(8),
   COLTIME              VARCHAR2(6),
   ACCDATE              VARCHAR2(8),
   ACCTIME              VARCHAR2(6),
   TERMSEQNO            NUMBER(9),
   STATUS               CHAR(1)                         NOT NULL,
   ERRCODE              NUMBER(9),
   ERRMSG               VARCHAR2(240),
   DELFLAG              CHAR(1)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_PURSEPOSDTL.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_PURSEPOSDTL.CARDCNT IS
'卡交易次数';

COMMENT ON COLUMN T_PURSEPOSDTL.DEVPHYID IS
'设备物理ID';

COMMENT ON COLUMN T_PURSEPOSDTL.DEVSEQNO IS
'设备流水号';

COMMENT ON COLUMN T_PURSEPOSDTL.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_PURSEPOSDTL.TRANSTIME IS
'交易时间';

COMMENT ON COLUMN T_PURSEPOSDTL.PURSETYPE IS
'钱包类型';

COMMENT ON COLUMN T_PURSEPOSDTL.TERMID IS
'终端号';

COMMENT ON COLUMN T_PURSEPOSDTL.CARDBEFBAL IS
'交易前卡余额';

COMMENT ON COLUMN T_PURSEPOSDTL.AMOUNT IS
'发生额-包含管理费';

COMMENT ON COLUMN T_PURSEPOSDTL.CARDAFTBAL IS
'交易后卡余额';

COMMENT ON COLUMN T_PURSEPOSDTL.TRANSMARK IS
'交易标记';

COMMENT ON COLUMN T_PURSEPOSDTL.DATATYPE IS
'数据类型';

COMMENT ON COLUMN T_PURSEPOSDTL.SHOPID IS
'商户卡号';

COMMENT ON COLUMN T_PURSEPOSDTL.BATCHNO IS
'导入批次号';

COMMENT ON COLUMN T_PURSEPOSDTL.SYSID IS
'子系统ID';

COMMENT ON COLUMN T_PURSEPOSDTL.COLDATE IS
'采集日期';

COMMENT ON COLUMN T_PURSEPOSDTL.COLTIME IS
'采集时间';

COMMENT ON COLUMN T_PURSEPOSDTL.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_PURSEPOSDTL.ACCTIME IS
'记账时间';

COMMENT ON COLUMN T_PURSEPOSDTL.TERMSEQNO IS
'终端流水号';

COMMENT ON COLUMN T_PURSEPOSDTL.STATUS IS
'状态-1初始状态2-入账失败3-成功4-异常流水';

COMMENT ON COLUMN T_PURSEPOSDTL.ERRCODE IS
'错误码';

COMMENT ON COLUMN T_PURSEPOSDTL.ERRMSG IS
'错误信息';

COMMENT ON COLUMN T_PURSEPOSDTL.DELFLAG IS
'删除标志';

ALTER TABLE T_PURSEPOSDTL
   ADD CONSTRAINT PK_T_PURSEPOSDTL PRIMARY KEY (CARDNO, CARDCNT, DEVPHYID, DEVSEQNO);

/*==============================================================*/
/* Index: IDX_PURSEPOSDTL_STATUS                                */
/*==============================================================*/
CREATE INDEX IDX_PURSEPOSDTL_STATUS ON T_PURSEPOSDTL (
   STATUS ASC
)
TABLESPACE TS_YKT_HIS;

/*==============================================================*/
/* Table: T_PURSETRANSDTL                                       */
/*==============================================================*/
CREATE TABLE T_PURSETRANSDTL  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   ACCTIME              VARCHAR2(6),
   TERMID               NUMBER(9)                       NOT NULL,
   TERMSEQNO            NUMBER(9)                       NOT NULL,
   PURSETYPE            NUMBER(1)                       NOT NULL,
   TRANSDATE            VARCHAR2(8),
   TRANSTIME            VARCHAR2(6),
   REFNO                VARCHAR2(20),
   TRANSCODE            NUMBER(4),
   CUSTID               NUMBER(9),
   CUSTNAME             VARCHAR2(60),
   STUEMPNO             VARCHAR2(20),
   SHOWCARDNO           NUMBER(10),
   CARDNO               NUMBER(9),
   TRANSFLAG            NUMBER(1),
   CARDCNT              NUMBER(9),
   CARDBEFBAL           NUMBER(15,2),
   CARDAFTBAL           NUMBER(15,2),
   AMOUNT               NUMBER(15,2),
   OPERCODE             VARCHAR2(8),
   SYSID                NUMBER(9),
   DEVPHYID             VARCHAR2(20),
   DEVSEQNO             NUMBER(9),
   COLDATE              VARCHAR2(8),
   COLTIME              VARCHAR2(6),
   STATUS               CHAR(1),
   ERRCODE              NUMBER(9),
   REMARK               VARCHAR2(240)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_PURSETRANSDTL.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_PURSETRANSDTL.ACCTIME IS
'记账时间';

COMMENT ON COLUMN T_PURSETRANSDTL.TERMID IS
'终端编号';

COMMENT ON COLUMN T_PURSETRANSDTL.TERMSEQNO IS
'终端流水号';

COMMENT ON COLUMN T_PURSETRANSDTL.PURSETYPE IS
'钱包类型';

COMMENT ON COLUMN T_PURSETRANSDTL.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_PURSETRANSDTL.TRANSTIME IS
'交易时间';

COMMENT ON COLUMN T_PURSETRANSDTL.REFNO IS
'交易参考号';

COMMENT ON COLUMN T_PURSETRANSDTL.TRANSCODE IS
'交易码';

COMMENT ON COLUMN T_PURSETRANSDTL.CUSTID IS
'客户号';

COMMENT ON COLUMN T_PURSETRANSDTL.CUSTNAME IS
'客户名';

COMMENT ON COLUMN T_PURSETRANSDTL.STUEMPNO IS
'学工号';

COMMENT ON COLUMN T_PURSETRANSDTL.SHOWCARDNO IS
'显示卡号';

COMMENT ON COLUMN T_PURSETRANSDTL.CARDNO IS
'卡号';

COMMENT ON COLUMN T_PURSETRANSDTL.TRANSFLAG IS
'1充值标志2消费次数';

COMMENT ON COLUMN T_PURSETRANSDTL.CARDCNT IS
'卡交易次数';

COMMENT ON COLUMN T_PURSETRANSDTL.CARDBEFBAL IS
'交易前卡余额';

COMMENT ON COLUMN T_PURSETRANSDTL.CARDAFTBAL IS
'交易后卡余额';

COMMENT ON COLUMN T_PURSETRANSDTL.AMOUNT IS
'发生额';

COMMENT ON COLUMN T_PURSETRANSDTL.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_PURSETRANSDTL.SYSID IS
'子系统编号';

COMMENT ON COLUMN T_PURSETRANSDTL.DEVPHYID IS
'设备物理ID';

COMMENT ON COLUMN T_PURSETRANSDTL.DEVSEQNO IS
'设备流水号';

COMMENT ON COLUMN T_PURSETRANSDTL.COLDATE IS
'采集日期';

COMMENT ON COLUMN T_PURSETRANSDTL.COLTIME IS
'采集时间';

COMMENT ON COLUMN T_PURSETRANSDTL.STATUS IS
'记录状态1:未入账2-入账失败3-成功';

COMMENT ON COLUMN T_PURSETRANSDTL.ERRCODE IS
'错误码';

COMMENT ON COLUMN T_PURSETRANSDTL.REMARK IS
'备注';

ALTER TABLE T_PURSETRANSDTL
   ADD CONSTRAINT PK_T_PURSETRANSDTL PRIMARY KEY (ACCDATE, TERMID, TERMSEQNO, PURSETYPE);

/*==============================================================*/
/* Index: IDX_PURSETRANSDTL_CARDNO                              */
/*==============================================================*/
CREATE INDEX IDX_PURSETRANSDTL_CARDNO ON T_PURSETRANSDTL (
   CARDNO ASC
)
TABLESPACE TS_YKT_HIS;

/*==============================================================*/
/* Index: IDX_PURSETRANSDTL_CUSTID                              */
/*==============================================================*/
CREATE INDEX IDX_PURSETRANSDTL_CUSTID ON T_PURSETRANSDTL (
   CUSTID ASC
)
TABLESPACE TS_YKT_HIS;

/*==============================================================*/
/* Table: T_PURSETYPE                                           */
/*==============================================================*/
CREATE TABLE T_PURSETYPE  (
   PURSETYPE            NUMBER(1)                       NOT NULL,
   PURSETYPENAME        VARCHAR2(60),
   PURSEMAXBAL          NUMBER(15,2),
   ONLINEFLAG           NUMBER(1),
   SHOPID               NUMBER(9),
   REFUNDFLAG           NUMBER(1),
   PRIMARYFLAG          NUMBER(1),
   ENABLEFLAG           NUMBER(1),
   REMARK               VARCHAR2(240),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_PURSETYPE.PURSETYPE IS
'钱包类型';

COMMENT ON COLUMN T_PURSETYPE.PURSETYPENAME IS
'钱包类型名';

COMMENT ON COLUMN T_PURSETYPE.PURSEMAXBAL IS
'最大存款金额';

COMMENT ON COLUMN T_PURSETYPE.ONLINEFLAG IS
'联机标志';

COMMENT ON COLUMN T_PURSETYPE.SHOPID IS
'商户号';

COMMENT ON COLUMN T_PURSETYPE.REFUNDFLAG IS
'退款余额标志';

COMMENT ON COLUMN T_PURSETYPE.PRIMARYFLAG IS
'主钱包标志';

COMMENT ON COLUMN T_PURSETYPE.ENABLEFLAG IS
'启用标志';

COMMENT ON COLUMN T_PURSETYPE.REMARK IS
'备注';

COMMENT ON COLUMN T_PURSETYPE.LASTSAVED IS
'最后保存时间';

ALTER TABLE T_PURSETYPE
   ADD CONSTRAINT PK_T_PURSETYPE PRIMARY KEY (PURSETYPE);

/*==============================================================*/
/* Table: T_PUSHTASK                                            */
/*==============================================================*/
CREATE TABLE T_PUSHTASK  (
   TASKID               NUMBER(9)                       NOT NULL,
   TASKSEQ              NUMBER(9),
   FUNCNO               NUMBER(9),
   FUNCGROUP            NUMBER(9),
   SYSID                NUMBER(9),
   DEVICEID             NUMBER(9),
   ADDTIME              VARCHAR2(30),
   BEGINTIME            VARCHAR2(30),
   INVALIDTIME          VARCHAR2(30),
   EXECTIME             VARCHAR2(30),
   EXECCNT              NUMBER(9),
   MAXEXEC              NUMBER(9),
   NEXTINTERVAL         NUMBER(9),
   STATUS               NUMBER(9),
   FLAG                 VARCHAR2(10),
   SENDTYPE             NUMBER(9),
   ROUTEID              NUMBER(9),
   CONTENTSTR           VARCHAR2(1000),
   RETCODE              VARCHAR2(30),
   RETMSG               VARCHAR2(240)
);

COMMENT ON COLUMN T_PUSHTASK.TASKID IS
'任务号';

COMMENT ON COLUMN T_PUSHTASK.TASKSEQ IS
'任务序号';

COMMENT ON COLUMN T_PUSHTASK.FUNCNO IS
'FUNCNO';

COMMENT ON COLUMN T_PUSHTASK.FUNCGROUP IS
'FUNCGROUP';

COMMENT ON COLUMN T_PUSHTASK.SYSID IS
'SYSID';

COMMENT ON COLUMN T_PUSHTASK.DEVICEID IS
'设备编号';

COMMENT ON COLUMN T_PUSHTASK.ADDTIME IS
'ADDTIME';

COMMENT ON COLUMN T_PUSHTASK.BEGINTIME IS
'BEGINTIME';

COMMENT ON COLUMN T_PUSHTASK.INVALIDTIME IS
'INVALIDTIME';

COMMENT ON COLUMN T_PUSHTASK.EXECTIME IS
'EXECTIME';

COMMENT ON COLUMN T_PUSHTASK.EXECCNT IS
'EXECCNT';

COMMENT ON COLUMN T_PUSHTASK.MAXEXEC IS
'MAXEXEC';

COMMENT ON COLUMN T_PUSHTASK.NEXTINTERVAL IS
'NEXTINTERVAL';

COMMENT ON COLUMN T_PUSHTASK.STATUS IS
'STATUS';

COMMENT ON COLUMN T_PUSHTASK.FLAG IS
'FLAG';

COMMENT ON COLUMN T_PUSHTASK.SENDTYPE IS
'SENDTYPE';

COMMENT ON COLUMN T_PUSHTASK.ROUTEID IS
'ROUTEID';

COMMENT ON COLUMN T_PUSHTASK.CONTENTSTR IS
'CONTENTSTR';

COMMENT ON COLUMN T_PUSHTASK.RETCODE IS
'RETCODE';

COMMENT ON COLUMN T_PUSHTASK.RETMSG IS
'RETMSG';

ALTER TABLE T_PUSHTASK
   ADD CONSTRAINT PK_T_PUSHTASK PRIMARY KEY (TASKID);

/*==============================================================*/
/* Table: T_REFNO                                               */
/*==============================================================*/
CREATE TABLE T_REFNO  (
   REFNO                VARCHAR2(20)                    NOT NULL,
   MAC                  VARCHAR2(8),
   ACCDATE              VARCHAR2(8),
   TERMID               NUMBER(9),
   TERMSEQNO            NUMBER(9),
   REQREFNO             VARCHAR2(20),
   TRANSCODE            NUMBER(4),
   FUNDTYPE             NUMBER(1),
   AMOUNT               NUMBER(9),
   OPERID               NUMBER(9),
   CUSTID               NUMBER(9),
   CARDNO               NUMBER(9),
   STATUS               NUMBER(1)                       NOT NULL,
   LASTSAVED            VARCHAR2(14)
);

COMMENT ON COLUMN T_REFNO.REFNO IS
'交易参考号';

COMMENT ON COLUMN T_REFNO.MAC IS
'MAC码';

COMMENT ON COLUMN T_REFNO.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_REFNO.TERMID IS
'终端号';

COMMENT ON COLUMN T_REFNO.TERMSEQNO IS
'终端流水号';

COMMENT ON COLUMN T_REFNO.REQREFNO IS
'请求方参考号';

COMMENT ON COLUMN T_REFNO.TRANSCODE IS
'交易码';

COMMENT ON COLUMN T_REFNO.FUNDTYPE IS
'资金类型';

COMMENT ON COLUMN T_REFNO.AMOUNT IS
'发生额';

COMMENT ON COLUMN T_REFNO.OPERID IS
'操作员ID';

COMMENT ON COLUMN T_REFNO.CUSTID IS
'客户号';

COMMENT ON COLUMN T_REFNO.CARDNO IS
'卡号';

COMMENT ON COLUMN T_REFNO.STATUS IS
'1-发起2失败3成功4撤销';

COMMENT ON COLUMN T_REFNO.LASTSAVED IS
'最后保存时间';

ALTER TABLE T_REFNO
   ADD CONSTRAINT PK_T_REFNO PRIMARY KEY (REFNO);

/*==============================================================*/
/* Table: T_RENEWCARD                                           */
/*==============================================================*/
CREATE TABLE T_RENEWCARD  (
   CUSTID               NUMBER(9)                       NOT NULL,
   CARDTYPE             VARCHAR2(60),
   ISSUESTATUS          NUMBER(9)
);

COMMENT ON COLUMN T_RENEWCARD.CUSTID IS
'客户号';

COMMENT ON COLUMN T_RENEWCARD.CARDTYPE IS
'卡类型';

COMMENT ON COLUMN T_RENEWCARD.ISSUESTATUS IS
'状态';

ALTER TABLE T_RENEWCARD
   ADD CONSTRAINT PK_T_RENEWCARD PRIMARY KEY (CUSTID);

/*==============================================================*/
/* Table: T_ROLE                                                */
/*==============================================================*/
CREATE TABLE T_ROLE  (
   ROLEID               NUMBER(9)                       NOT NULL,
   ROLENAME             VARCHAR2(60)                    NOT NULL,
   ROLEDESC             VARCHAR2(240),
   CREATEDATE           NUMBER(8)                       NOT NULL,
   UPDTIME              VARCHAR2(14)                    NOT NULL,
   DELETED              NUMBER(1)                      DEFAULT 0 NOT NULL
);

COMMENT ON COLUMN T_ROLE.ROLEID IS
'角色ID';

COMMENT ON COLUMN T_ROLE.ROLENAME IS
'角色名称';

COMMENT ON COLUMN T_ROLE.ROLEDESC IS
'角色描述';

COMMENT ON COLUMN T_ROLE.CREATEDATE IS
'创建日期';

COMMENT ON COLUMN T_ROLE.UPDTIME IS
'更新时间';

COMMENT ON COLUMN T_ROLE.DELETED IS
'删除标志';

ALTER TABLE T_ROLE
   ADD CONSTRAINT PK_T_ROLE PRIMARY KEY (ROLEID);

/*==============================================================*/
/* Table: T_ROLEMODULE                                          */
/*==============================================================*/
CREATE TABLE T_ROLEMODULE  (
   ROLEID               NUMBER(9)                       NOT NULL,
   MODULECODE           VARCHAR2(10)                    NOT NULL,
   UPDTIME              VARCHAR2(14)
);

COMMENT ON COLUMN T_ROLEMODULE.ROLEID IS
'角色ID';

COMMENT ON COLUMN T_ROLEMODULE.MODULECODE IS
'模块代码';

COMMENT ON COLUMN T_ROLEMODULE.UPDTIME IS
'UPDTIME';

ALTER TABLE T_ROLEMODULE
   ADD CONSTRAINT PK_T_ROLEMODULE PRIMARY KEY (ROLEID, MODULECODE);

/*==============================================================*/
/* Table: T_RPTACCBAL                                           */
/*==============================================================*/
CREATE TABLE T_RPTACCBAL  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   SUBJNO               VARCHAR2(10)                    NOT NULL,
   ACCNO                VARCHAR2(10)                    NOT NULL,
   BALFLAG              NUMBER(1)                       NOT NULL,
   BALANCE              NUMBER(15,2)                    NOT NULL
);

COMMENT ON COLUMN T_RPTACCBAL.ACCDATE IS
'业务日期';

COMMENT ON COLUMN T_RPTACCBAL.SUBJNO IS
'科目号';

COMMENT ON COLUMN T_RPTACCBAL.ACCNO IS
'账号';

COMMENT ON COLUMN T_RPTACCBAL.BALFLAG IS
'余额方向';

COMMENT ON COLUMN T_RPTACCBAL.BALANCE IS
'余额';

ALTER TABLE T_RPTACCBAL
   ADD CONSTRAINT PK_T_RPTACCBAL PRIMARY KEY (ACCDATE, ACCNO);

/*==============================================================*/
/* Table: T_RPTACCLEDGER                                        */
/*==============================================================*/
CREATE TABLE T_RPTACCLEDGER  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   ACCNO                VARCHAR2(10)                    NOT NULL,
   TRANSTYPE            NUMBER(9)                       NOT NULL,
   SUMMARY              VARCHAR2(60)                    NOT NULL,
   TRANSCNT             NUMBER(9)                       NOT NULL,
   DRAMT                NUMBER(15,2)                   DEFAULT 0 NOT NULL,
   CRAMT                NUMBER(15,2)                   DEFAULT 0 NOT NULL,
   BALFLAG              NUMBER(1)                      DEFAULT 0 NOT NULL,
   BALANCE              NUMBER(15,2)                   DEFAULT 0 NOT NULL,
   PERSONCNT            NUMBER(9)                      DEFAULT 0 NOT NULL
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_RPTACCLEDGER.ACCDATE IS
'业务日期';

COMMENT ON COLUMN T_RPTACCLEDGER.ACCNO IS
'账号';

COMMENT ON COLUMN T_RPTACCLEDGER.TRANSTYPE IS
'交易类型';

COMMENT ON COLUMN T_RPTACCLEDGER.SUMMARY IS
'摘要';

COMMENT ON COLUMN T_RPTACCLEDGER.TRANSCNT IS
'交易次数';

COMMENT ON COLUMN T_RPTACCLEDGER.DRAMT IS
'借方发生额';

COMMENT ON COLUMN T_RPTACCLEDGER.CRAMT IS
'贷方发生额';

COMMENT ON COLUMN T_RPTACCLEDGER.BALFLAG IS
'余额方向';

COMMENT ON COLUMN T_RPTACCLEDGER.BALANCE IS
'余额';

COMMENT ON COLUMN T_RPTACCLEDGER.PERSONCNT IS
'人次';

ALTER TABLE T_RPTACCLEDGER
   ADD CONSTRAINT PK_T_RPTACCLEDGER PRIMARY KEY (ACCDATE, ACCNO, TRANSTYPE, SUMMARY);

/*==============================================================*/
/* Table: T_RPTDAILYACC                                         */
/*==============================================================*/
CREATE TABLE T_RPTDAILYACC  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   ACCNO                VARCHAR2(10)                    NOT NULL,
   TRANSCNT             NUMBER(9)                       NOT NULL,
   DRAMT                NUMBER(15,2)                    NOT NULL,
   CRAMT                NUMBER(15,2)                    NOT NULL,
   BALFLAG              NUMBER(1),
   BALANCE              NUMBER(15,2)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_RPTDAILYACC.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_RPTDAILYACC.ACCNO IS
'账号';

COMMENT ON COLUMN T_RPTDAILYACC.TRANSCNT IS
'交易次数';

COMMENT ON COLUMN T_RPTDAILYACC.DRAMT IS
'借方发生额';

COMMENT ON COLUMN T_RPTDAILYACC.CRAMT IS
'贷方发生额';

COMMENT ON COLUMN T_RPTDAILYACC.BALFLAG IS
'余额方向';

COMMENT ON COLUMN T_RPTDAILYACC.BALANCE IS
'余额';

ALTER TABLE T_RPTDAILYACC
   ADD CONSTRAINT PK_T_RPTDAILYACC PRIMARY KEY (ACCDATE, ACCNO);

/*==============================================================*/
/* Table: T_RPTDEPTLEDGER                                       */
/*==============================================================*/
CREATE TABLE T_RPTDEPTLEDGER  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   DEPTCODE             VARCHAR2(30)                    NOT NULL,
   SUBJNO               VARCHAR2(10)                    NOT NULL,
   TRANSTYPE            NUMBER(9)                       NOT NULL,
   SUMMARY              VARCHAR2(60)                    NOT NULL,
   TRANSCNT             NUMBER(9),
   DRAMT                NUMBER(15,2),
   CRAMT                NUMBER(15,2)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_RPTDEPTLEDGER.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_RPTDEPTLEDGER.DEPTCODE IS
'部门代码';

COMMENT ON COLUMN T_RPTDEPTLEDGER.SUBJNO IS
'科目号';

COMMENT ON COLUMN T_RPTDEPTLEDGER.TRANSTYPE IS
'交易类型';

COMMENT ON COLUMN T_RPTDEPTLEDGER.SUMMARY IS
'摘要';

COMMENT ON COLUMN T_RPTDEPTLEDGER.TRANSCNT IS
'交易次数';

COMMENT ON COLUMN T_RPTDEPTLEDGER.DRAMT IS
'借方发生额';

COMMENT ON COLUMN T_RPTDEPTLEDGER.CRAMT IS
'贷方发生额';

ALTER TABLE T_RPTDEPTLEDGER
   ADD CONSTRAINT PK_T_RPTDEPTLEDGER PRIMARY KEY (ACCDATE, DEPTCODE, SUBJNO, TRANSTYPE, SUMMARY);

/*==============================================================*/
/* Table: T_RPTOPERCARD                                         */
/*==============================================================*/
CREATE TABLE T_RPTOPERCARD  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   BRANCHNO             NUMBER(9),
   OPERCODE             VARCHAR2(8)                     NOT NULL,
   CARDTYPE             NUMBER(2)                       NOT NULL,
   USETYPE              NUMBER(9)                       NOT NULL,
   SUMMARY              VARCHAR2(60)                    NOT NULL,
   TRANSCNT             NUMBER(9)                       NOT NULL,
   INCNT                NUMBER(9)                       NOT NULL,
   OUTCNT               NUMBER(9)                       NOT NULL,
   REMAINCNT            NUMBER(9)                       NOT NULL
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_RPTOPERCARD.ACCDATE IS
'业务日期';

COMMENT ON COLUMN T_RPTOPERCARD.BRANCHNO IS
'网点号';

COMMENT ON COLUMN T_RPTOPERCARD.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_RPTOPERCARD.CARDTYPE IS
'卡类型';

COMMENT ON COLUMN T_RPTOPERCARD.USETYPE IS
'使用类型';

COMMENT ON COLUMN T_RPTOPERCARD.SUMMARY IS
'摘要';

COMMENT ON COLUMN T_RPTOPERCARD.TRANSCNT IS
'交易次数';

COMMENT ON COLUMN T_RPTOPERCARD.INCNT IS
'收入数量';

COMMENT ON COLUMN T_RPTOPERCARD.OUTCNT IS
'支出数量';

COMMENT ON COLUMN T_RPTOPERCARD.REMAINCNT IS
'库存数量';

ALTER TABLE T_RPTOPERCARD
   ADD CONSTRAINT PK_T_RPTOPERCARD PRIMARY KEY (ACCDATE, OPERCODE, CARDTYPE, USETYPE, SUMMARY);

/*==============================================================*/
/* Table: T_RPTOPERCASH                                         */
/*==============================================================*/
CREATE TABLE T_RPTOPERCASH  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   BRANCHNO             NUMBER(9),
   OPERCODE             VARCHAR2(8)                     NOT NULL,
   SUBJNO               VARCHAR2(10)                    NOT NULL,
   TRANSTYPE            NUMBER(9)                       NOT NULL,
   SUMMARY              VARCHAR2(60)                    NOT NULL,
   TRANSCNT             NUMBER(9)                       NOT NULL,
   INAMT                NUMBER(15,2)                    NOT NULL,
   OUTAMT               NUMBER(15,2)                    NOT NULL,
   AMOUNT               NUMBER(15,2)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_RPTOPERCASH.ACCDATE IS
'结算日期';

COMMENT ON COLUMN T_RPTOPERCASH.BRANCHNO IS
'网点号';

COMMENT ON COLUMN T_RPTOPERCASH.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_RPTOPERCASH.SUBJNO IS
'科目号';

COMMENT ON COLUMN T_RPTOPERCASH.TRANSTYPE IS
'交易类型';

COMMENT ON COLUMN T_RPTOPERCASH.SUMMARY IS
'摘要';

COMMENT ON COLUMN T_RPTOPERCASH.TRANSCNT IS
'交易次数';

COMMENT ON COLUMN T_RPTOPERCASH.INAMT IS
'收入发生额';

COMMENT ON COLUMN T_RPTOPERCASH.OUTAMT IS
'支出发生额';

COMMENT ON COLUMN T_RPTOPERCASH.AMOUNT IS
'结存金额';

ALTER TABLE T_RPTOPERCASH
   ADD CONSTRAINT PK_T_RPTOPERCASH PRIMARY KEY (ACCDATE, OPERCODE, SUBJNO, TRANSTYPE, SUMMARY);

/*==============================================================*/
/* Table: T_RPTOPERLEDGER                                       */
/*==============================================================*/
CREATE TABLE T_RPTOPERLEDGER  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   OPERCODE             VARCHAR2(8)                     NOT NULL,
   SUBJNO               VARCHAR2(10),
   ACCNO                VARCHAR2(10)                    NOT NULL,
   TRANSTYPE            NUMBER(9)                       NOT NULL,
   SUMMARY              VARCHAR2(60)                    NOT NULL,
   TRANSCNT             NUMBER(9)                       NOT NULL,
   DRAMT                NUMBER(15,2)                    NOT NULL,
   CRAMT                NUMBER(15,2)                    NOT NULL
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_RPTOPERLEDGER.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_RPTOPERLEDGER.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_RPTOPERLEDGER.SUBJNO IS
'科目号';

COMMENT ON COLUMN T_RPTOPERLEDGER.ACCNO IS
'账号';

COMMENT ON COLUMN T_RPTOPERLEDGER.TRANSTYPE IS
'交易类型';

COMMENT ON COLUMN T_RPTOPERLEDGER.SUMMARY IS
'摘要';

COMMENT ON COLUMN T_RPTOPERLEDGER.TRANSCNT IS
'交易次数';

COMMENT ON COLUMN T_RPTOPERLEDGER.DRAMT IS
'借方发生额';

COMMENT ON COLUMN T_RPTOPERLEDGER.CRAMT IS
'贷方发生额';

ALTER TABLE T_RPTOPERLEDGER
   ADD CONSTRAINT PK_T_RPTOPERLEDGER PRIMARY KEY (ACCDATE, OPERCODE, ACCNO, TRANSTYPE, SUMMARY);

/*==============================================================*/
/* Table: T_RPTPOSLEDGER                                        */
/*==============================================================*/
CREATE TABLE T_RPTPOSLEDGER  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   ACCNO                VARCHAR2(10)                    NOT NULL,
   DEVICEID             NUMBER(9)                       NOT NULL,
   TRANSTYPE            NUMBER(9)                       NOT NULL,
   SUMMARY              VARCHAR2(60)                    NOT NULL,
   TRANSDATE            VARCHAR2(8)                     NOT NULL,
   TRANSCNT             NUMBER(9)                       NOT NULL,
   DRAMT                NUMBER(15,2)                    NOT NULL,
   CRAMT                NUMBER(15,2)                    NOT NULL,
   AMOUNT               NUMBER(15,2)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_RPTPOSLEDGER.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_RPTPOSLEDGER.ACCNO IS
'商户账号';

COMMENT ON COLUMN T_RPTPOSLEDGER.DEVICEID IS
'设备编号';

COMMENT ON COLUMN T_RPTPOSLEDGER.TRANSTYPE IS
'交易类型';

COMMENT ON COLUMN T_RPTPOSLEDGER.SUMMARY IS
'摘要';

COMMENT ON COLUMN T_RPTPOSLEDGER.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_RPTPOSLEDGER.TRANSCNT IS
'交易次数';

COMMENT ON COLUMN T_RPTPOSLEDGER.DRAMT IS
'借方发生额';

COMMENT ON COLUMN T_RPTPOSLEDGER.CRAMT IS
'贷方发生额';

COMMENT ON COLUMN T_RPTPOSLEDGER.AMOUNT IS
'结存金额';

ALTER TABLE T_RPTPOSLEDGER
   ADD CONSTRAINT PK_T_RPTPOSLEDGER PRIMARY KEY (ACCDATE, ACCNO, DEVICEID, TRANSTYPE, SUMMARY, TRANSDATE);

/*==============================================================*/
/* Table: T_RPTPOSMEAL                                          */
/*==============================================================*/
CREATE TABLE T_RPTPOSMEAL  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   ACCNO                VARCHAR2(10)                    NOT NULL,
   DEVICEID             NUMBER(9)                       NOT NULL,
   TRANSTYPE            NUMBER(9)                       NOT NULL,
   SUMMARY              VARCHAR2(60)                    NOT NULL,
   TRANSDATE            VARCHAR2(8)                     NOT NULL,
   MEALTYPE             NUMBER(9)                       NOT NULL,
   MEALNAME             VARCHAR2(60)                    NOT NULL,
   TRANSCNT             NUMBER(9)                       NOT NULL,
   DRAMT                NUMBER(15,2)                    NOT NULL,
   CRAMT                NUMBER(15,2)                    NOT NULL,
   AMOUNT               NUMBER(15,2)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_RPTPOSMEAL.ACCDATE IS
'业务日期';

COMMENT ON COLUMN T_RPTPOSMEAL.ACCNO IS
'商户账号';

COMMENT ON COLUMN T_RPTPOSMEAL.DEVICEID IS
'设备编号';

COMMENT ON COLUMN T_RPTPOSMEAL.TRANSTYPE IS
'交易类型';

COMMENT ON COLUMN T_RPTPOSMEAL.SUMMARY IS
'摘要';

COMMENT ON COLUMN T_RPTPOSMEAL.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_RPTPOSMEAL.MEALTYPE IS
'餐次类型';

COMMENT ON COLUMN T_RPTPOSMEAL.MEALNAME IS
'餐次名称';

COMMENT ON COLUMN T_RPTPOSMEAL.TRANSCNT IS
'交易次数';

COMMENT ON COLUMN T_RPTPOSMEAL.DRAMT IS
'借方发生额';

COMMENT ON COLUMN T_RPTPOSMEAL.CRAMT IS
'贷方发生额';

COMMENT ON COLUMN T_RPTPOSMEAL.AMOUNT IS
'结存金额';

ALTER TABLE T_RPTPOSMEAL
   ADD CONSTRAINT PK_T_RPTPOSMEAL PRIMARY KEY (ACCDATE, ACCNO, DEVICEID, TRANSTYPE, SUMMARY, TRANSDATE, MEALTYPE, MEALNAME);

/*==============================================================*/
/* Table: T_RPTSHOPBOARD                                        */
/*==============================================================*/
CREATE TABLE T_RPTSHOPBOARD  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   ACCNO                VARCHAR2(10)                    NOT NULL,
   TRANSCNT             NUMBER(9)                       NOT NULL,
   TRANSAMT             NUMBER(15,2)                    NOT NULL
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_RPTSHOPBOARD.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_RPTSHOPBOARD.ACCNO IS
'账号';

COMMENT ON COLUMN T_RPTSHOPBOARD.TRANSCNT IS
'交易次数';

COMMENT ON COLUMN T_RPTSHOPBOARD.TRANSAMT IS
'发生额';

ALTER TABLE T_RPTSHOPBOARD
   ADD CONSTRAINT PK_T_RPTSHOPBOARD PRIMARY KEY (ACCDATE, ACCNO);

/*==============================================================*/
/* Table: T_RPTSHOPMEAL                                         */
/*==============================================================*/
CREATE TABLE T_RPTSHOPMEAL  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   ACCNO                VARCHAR2(10)                    NOT NULL,
   TRANSCNT1            NUMBER(9)                       NOT NULL,
   TRANSAMT1            NUMBER(15,2)                    NOT NULL,
   TRANSCNT2            NUMBER(9)                       NOT NULL,
   TRANSAMT2            NUMBER(15,2)                    NOT NULL,
   TRANSCNT3            NUMBER(9)                       NOT NULL,
   TRANSAMT3            NUMBER(15,2)                    NOT NULL,
   TRANSCNT4            NUMBER(9)                       NOT NULL,
   TRANSAMT4            NUMBER(15,2)                    NOT NULL
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_RPTSHOPMEAL.ACCDATE IS
'业务日期';

COMMENT ON COLUMN T_RPTSHOPMEAL.ACCNO IS
'商户账号';

COMMENT ON COLUMN T_RPTSHOPMEAL.TRANSCNT1 IS
'早餐交易次数';

COMMENT ON COLUMN T_RPTSHOPMEAL.TRANSAMT1 IS
'早餐金额';

COMMENT ON COLUMN T_RPTSHOPMEAL.TRANSCNT2 IS
'午餐交易次数';

COMMENT ON COLUMN T_RPTSHOPMEAL.TRANSAMT2 IS
'午餐金额';

COMMENT ON COLUMN T_RPTSHOPMEAL.TRANSCNT3 IS
'晚餐交易次数';

COMMENT ON COLUMN T_RPTSHOPMEAL.TRANSAMT3 IS
'晚餐金额';

COMMENT ON COLUMN T_RPTSHOPMEAL.TRANSCNT4 IS
'夜餐交易次数';

COMMENT ON COLUMN T_RPTSHOPMEAL.TRANSAMT4 IS
'夜餐金额';

ALTER TABLE T_RPTSHOPMEAL
   ADD CONSTRAINT PK_T_RPTSHOPMEAL PRIMARY KEY (ACCDATE, ACCNO);

/*==============================================================*/
/* Table: T_RPTSHOPRAKEOFF                                      */
/*==============================================================*/
CREATE TABLE T_RPTSHOPRAKEOFF  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   SHOPID               NUMBER(9),
   ACCNO                VARCHAR2(10)                    NOT NULL,
   ACCNAME              VARCHAR2(90),
   RAKEOFFRATE          NUMBER(4,4)                    DEFAULT 0 NOT NULL,
   TRANSCNT             NUMBER(9)                      DEFAULT 0 NOT NULL,
   TRANSAMT             NUMBER(15,2)                   DEFAULT 0 NOT NULL,
   RAKEOFFAMT           NUMBER(15,2)                   DEFAULT 0 NOT NULL,
   BOARDFEEAMT          NUMBER(15,2)                   DEFAULT 0,
   AMOUNT               NUMBER(15,2)                   DEFAULT 0 NOT NULL,
   BALANCE              NUMBER(15,2)                   DEFAULT 0 NOT NULL,
   PERSONCNT            NUMBER(9)                      DEFAULT 0 NOT NULL
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_RPTSHOPRAKEOFF.ACCDATE IS
'业务日期';

COMMENT ON COLUMN T_RPTSHOPRAKEOFF.SHOPID IS
'商户号';

COMMENT ON COLUMN T_RPTSHOPRAKEOFF.ACCNO IS
'商户账号';

COMMENT ON COLUMN T_RPTSHOPRAKEOFF.ACCNAME IS
'商户账户名';

COMMENT ON COLUMN T_RPTSHOPRAKEOFF.RAKEOFFRATE IS
'佣金费率';

COMMENT ON COLUMN T_RPTSHOPRAKEOFF.TRANSCNT IS
'交易次数';

COMMENT ON COLUMN T_RPTSHOPRAKEOFF.TRANSAMT IS
'营业金额';

COMMENT ON COLUMN T_RPTSHOPRAKEOFF.RAKEOFFAMT IS
'佣金金额';

COMMENT ON COLUMN T_RPTSHOPRAKEOFF.BOARDFEEAMT IS
'搭伙费金额';

COMMENT ON COLUMN T_RPTSHOPRAKEOFF.AMOUNT IS
'结算金额';

COMMENT ON COLUMN T_RPTSHOPRAKEOFF.BALANCE IS
'余额';

COMMENT ON COLUMN T_RPTSHOPRAKEOFF.PERSONCNT IS
'人次';

ALTER TABLE T_RPTSHOPRAKEOFF
   ADD CONSTRAINT PK_T_RPTSHOPRAKEOFF PRIMARY KEY (ACCDATE, ACCNO);

/*==============================================================*/
/* Table: T_RPTSUBJBAL                                          */
/*==============================================================*/
CREATE TABLE T_RPTSUBJBAL  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   SUBJNO               VARCHAR2(10)                    NOT NULL,
   BEGINBAL             NUMBER(15,2)                    NOT NULL,
   BEGINBALFLAG         NUMBER(1)                       NOT NULL,
   DRAMT                NUMBER(15,2)                    NOT NULL,
   CRAMT                NUMBER(15,2)                    NOT NULL,
   ENDBAL               NUMBER(15,2)                    NOT NULL,
   ENDBALFLAG           NUMBER(1)                       NOT NULL
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_RPTSUBJBAL.ACCDATE IS
'结算日期';

COMMENT ON COLUMN T_RPTSUBJBAL.SUBJNO IS
'科目号';

COMMENT ON COLUMN T_RPTSUBJBAL.BEGINBAL IS
'期初余额';

COMMENT ON COLUMN T_RPTSUBJBAL.BEGINBALFLAG IS
'期初余额方向';

COMMENT ON COLUMN T_RPTSUBJBAL.DRAMT IS
'借方发生额';

COMMENT ON COLUMN T_RPTSUBJBAL.CRAMT IS
'贷方发生额';

COMMENT ON COLUMN T_RPTSUBJBAL.ENDBAL IS
'期末余额';

COMMENT ON COLUMN T_RPTSUBJBAL.ENDBALFLAG IS
'期末余额方向';

ALTER TABLE T_RPTSUBJBAL
   ADD CONSTRAINT PK_T_RPTSUBJBAL PRIMARY KEY (ACCDATE, SUBJNO);

/*==============================================================*/
/* Table: T_RPTSUBJLEDGER                                       */
/*==============================================================*/
CREATE TABLE T_RPTSUBJLEDGER  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   SUBJNO               VARCHAR2(10)                    NOT NULL,
   TRANSTYPE            NUMBER(9)                       NOT NULL,
   SUMMARY              VARCHAR2(60)                    NOT NULL,
   TRANSCNT             NUMBER(9)                       NOT NULL,
   DRAMT                NUMBER(15,2)                    NOT NULL,
   CRAMT                NUMBER(15,2)                    NOT NULL,
   BALFLAG              NUMBER(1),
   BALANCE              NUMBER(15,2)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_RPTSUBJLEDGER.ACCDATE IS
'业务日期';

COMMENT ON COLUMN T_RPTSUBJLEDGER.SUBJNO IS
'科目号';

COMMENT ON COLUMN T_RPTSUBJLEDGER.TRANSTYPE IS
'交易类型';

COMMENT ON COLUMN T_RPTSUBJLEDGER.SUMMARY IS
'摘要';

COMMENT ON COLUMN T_RPTSUBJLEDGER.TRANSCNT IS
'交易次数';

COMMENT ON COLUMN T_RPTSUBJLEDGER.DRAMT IS
'借方发生额';

COMMENT ON COLUMN T_RPTSUBJLEDGER.CRAMT IS
'贷方发生额';

COMMENT ON COLUMN T_RPTSUBJLEDGER.BALFLAG IS
'余额方向';

COMMENT ON COLUMN T_RPTSUBJLEDGER.BALANCE IS
'余额';

ALTER TABLE T_RPTSUBJLEDGER
   ADD CONSTRAINT PK_T_RPTSUBJLEDGER PRIMARY KEY (ACCDATE, SUBJNO, TRANSTYPE, SUMMARY);

/*==============================================================*/
/* Table: T_RPTSYSSTAT                                          */
/*==============================================================*/
CREATE TABLE T_RPTSYSSTAT  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   ITEMID               NUMBER(9)                       NOT NULL,
   ITEMNAME             VARCHAR2(60),
   ITEMVAL              VARCHAR2(30)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_RPTSYSSTAT.ACCDATE IS
'结算日期';

COMMENT ON COLUMN T_RPTSYSSTAT.ITEMID IS
'统计项目编号';

COMMENT ON COLUMN T_RPTSYSSTAT.ITEMNAME IS
'统计项目名称';

COMMENT ON COLUMN T_RPTSYSSTAT.ITEMVAL IS
'统计数据';

ALTER TABLE T_RPTSYSSTAT
   ADD CONSTRAINT PK_T_RPTSYSSTAT PRIMARY KEY (ACCDATE, ITEMID);

/*==============================================================*/
/* Table: T_RPTTERMLEDGER                                       */
/*==============================================================*/
CREATE TABLE T_RPTTERMLEDGER  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   TERMID               NUMBER(9)                       NOT NULL,
   SUBJNO               VARCHAR2(10)                    NOT NULL,
   ACCNO                VARCHAR2(10)                    NOT NULL,
   TRANSTYPE            NUMBER(9)                       NOT NULL,
   SUMMARY              VARCHAR2(60)                    NOT NULL,
   TRANSCNT             NUMBER(9)                       NOT NULL,
   DRAMT                NUMBER(15,2)                    NOT NULL,
   CRAMT                NUMBER(15,2)                    NOT NULL
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_RPTTERMLEDGER.ACCDATE IS
'结算日期';

COMMENT ON COLUMN T_RPTTERMLEDGER.TERMID IS
'终端编号';

COMMENT ON COLUMN T_RPTTERMLEDGER.SUBJNO IS
'科目号';

COMMENT ON COLUMN T_RPTTERMLEDGER.ACCNO IS
'账号';

COMMENT ON COLUMN T_RPTTERMLEDGER.TRANSTYPE IS
'交易类型';

COMMENT ON COLUMN T_RPTTERMLEDGER.SUMMARY IS
'摘要';

COMMENT ON COLUMN T_RPTTERMLEDGER.TRANSCNT IS
'交易次数';

COMMENT ON COLUMN T_RPTTERMLEDGER.DRAMT IS
'借方发生额';

COMMENT ON COLUMN T_RPTTERMLEDGER.CRAMT IS
'贷方发生额';

ALTER TABLE T_RPTTERMLEDGER
   ADD CONSTRAINT PK_T_RPTTERMLEDGER PRIMARY KEY (ACCDATE, TERMID, SUBJNO, ACCNO, TRANSTYPE, SUMMARY);

/*==============================================================*/
/* Table: T_RPTTERMMEAL                                         */
/*==============================================================*/
CREATE TABLE T_RPTTERMMEAL  (
   SETTLEDATE           NUMBER(8)                       NOT NULL,
   ACCNO                VARCHAR2(10)                    NOT NULL,
   TERMID               NUMBER(9)                       NOT NULL,
   TRANSTYPE            NUMBER(9)                       NOT NULL,
   SUMMARY              VARCHAR2(60)                    NOT NULL,
   TRANSDATE            VARCHAR2(8)                     NOT NULL,
   MEALTYPE             NUMBER(9)                       NOT NULL,
   TRANSCNT             NUMBER(9)                       NOT NULL,
   DRAMT                NUMBER(15,2)                    NOT NULL,
   CRAMT                NUMBER(15,2)                    NOT NULL,
   AMOUNT               NUMBER(15,2)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_RPTTERMMEAL.SETTLEDATE IS
'业务日期';

COMMENT ON COLUMN T_RPTTERMMEAL.ACCNO IS
'商户账号';

COMMENT ON COLUMN T_RPTTERMMEAL.TERMID IS
'设备编号';

COMMENT ON COLUMN T_RPTTERMMEAL.TRANSTYPE IS
'交易类型';

COMMENT ON COLUMN T_RPTTERMMEAL.SUMMARY IS
'摘要';

COMMENT ON COLUMN T_RPTTERMMEAL.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_RPTTERMMEAL.MEALTYPE IS
'餐次类型';

COMMENT ON COLUMN T_RPTTERMMEAL.TRANSCNT IS
'交易次数';

COMMENT ON COLUMN T_RPTTERMMEAL.DRAMT IS
'借方发生额';

COMMENT ON COLUMN T_RPTTERMMEAL.CRAMT IS
'贷方发生额';

COMMENT ON COLUMN T_RPTTERMMEAL.AMOUNT IS
'结存金额';

ALTER TABLE T_RPTTERMMEAL
   ADD CONSTRAINT PK_T_RPTTERMMEAL PRIMARY KEY (SETTLEDATE, ACCNO, TERMID, TRANSTYPE, SUMMARY, TRANSDATE, MEALTYPE);

/*==============================================================*/
/* Table: T_SEQNOCTL                                            */
/*==============================================================*/
CREATE TABLE T_SEQNOCTL  (
   TERMID               NUMBER(9)                       NOT NULL,
   TERMSEQNO            NUMBER(9),
   ACCDATE              NUMBER(9)
);

COMMENT ON COLUMN T_SEQNOCTL.TERMID IS
'终端编号';

COMMENT ON COLUMN T_SEQNOCTL.TERMSEQNO IS
'终端流水号';

COMMENT ON COLUMN T_SEQNOCTL.ACCDATE IS
'记账日期';

ALTER TABLE T_SEQNOCTL
   ADD CONSTRAINT PK_T_SEQNOCTL PRIMARY KEY (TERMID);

/*==============================================================*/
/* Table: T_SERVICELOG                                          */
/*==============================================================*/
CREATE TABLE T_SERVICELOG  (
   SETTLEDATE           NUMBER(8)                       NOT NULL,
   SERVICENAME          VARCHAR2(60)                    NOT NULL,
   STARTTIME            VARCHAR2(14)                    NOT NULL
);

COMMENT ON COLUMN T_SERVICELOG.SETTLEDATE IS
'结算日期';

COMMENT ON COLUMN T_SERVICELOG.SERVICENAME IS
'服务名';

COMMENT ON COLUMN T_SERVICELOG.STARTTIME IS
'启动时间';

ALTER TABLE T_SERVICELOG
   ADD CONSTRAINT PK_T_SERVICELOG PRIMARY KEY (SERVICENAME, SETTLEDATE);

/*==============================================================*/
/* Table: T_SHOP                                                */
/*==============================================================*/
CREATE TABLE T_SHOP  (
   SHOPID               NUMBER(9)                       NOT NULL,
   FSHOPID              NUMBER(9),
   AREACODE             VARCHAR2(3),
   DEPTCODE             VARCHAR2(30),
   SHOPNAME             VARCHAR2(90),
   SHOPTYPE             NUMBER(1),
   ACCFLAG              CHAR(1),
   STATUS               CHAR(1),
   ACCNO                VARCHAR2(10),
   CONTACTMAN           VARCHAR2(60),
   IDTYPE               CHAR(1),
   IDNO                 VARCHAR2(60),
   TEL                  VARCHAR2(20),
   MOBILE               VARCHAR2(20),
   EMAIL                VARCHAR2(60),
   ADDR                 VARCHAR2(240),
   ZIPCODE              VARCHAR2(6),
   BOARDFEEFLAG         CHAR(1),
   RAKEOFFTYPE          CHAR(1),
   RAKEOFFRATE          NUMBER(4,4),
   DEPOSITAGIO          NUMBER(4,4),
   DEPOSITCNT           NUMBER(9),
   DEPOSITAMT           NUMBER(15,2),
   DISCOUNTAMT          NUMBER(15,2),
   BANKCODE             VARCHAR2(8),
   BANKACCNO            VARCHAR2(20),
   BANKACCNAME          VARCHAR2(90),
   OPENDATE             VARCHAR2(8),
   CLOSEDATE            VARCHAR2(8),
   USEFLAG              CHAR(1)
);

COMMENT ON COLUMN T_SHOP.SHOPID IS
'商户号';

COMMENT ON COLUMN T_SHOP.FSHOPID IS
'上级商户号';

COMMENT ON COLUMN T_SHOP.AREACODE IS
'区域代码';

COMMENT ON COLUMN T_SHOP.DEPTCODE IS
'部门代码';

COMMENT ON COLUMN T_SHOP.SHOPNAME IS
'商户名';

COMMENT ON COLUMN T_SHOP.SHOPTYPE IS
'商户类型1-收费商户2-充值商户';

COMMENT ON COLUMN T_SHOP.ACCFLAG IS
'是否独立核算：1-独立核算0-否';

COMMENT ON COLUMN T_SHOP.STATUS IS
'商户状态 1-正常2-销户';

COMMENT ON COLUMN T_SHOP.ACCNO IS
'商户账号';

COMMENT ON COLUMN T_SHOP.CONTACTMAN IS
'负责人';

COMMENT ON COLUMN T_SHOP.IDTYPE IS
'证件类型';

COMMENT ON COLUMN T_SHOP.IDNO IS
'证件号码';

COMMENT ON COLUMN T_SHOP.TEL IS
'电话';

COMMENT ON COLUMN T_SHOP.MOBILE IS
'手机';

COMMENT ON COLUMN T_SHOP.EMAIL IS
'电子信箱';

COMMENT ON COLUMN T_SHOP.ADDR IS
'地址';

COMMENT ON COLUMN T_SHOP.ZIPCODE IS
'邮政编码';

COMMENT ON COLUMN T_SHOP.BOARDFEEFLAG IS
'是否收搭伙费';

COMMENT ON COLUMN T_SHOP.RAKEOFFTYPE IS
'佣金类型';

COMMENT ON COLUMN T_SHOP.RAKEOFFRATE IS
'佣金费率';

COMMENT ON COLUMN T_SHOP.DEPOSITAGIO IS
'存款折扣率';

COMMENT ON COLUMN T_SHOP.DEPOSITCNT IS
'存款次数';

COMMENT ON COLUMN T_SHOP.DEPOSITAMT IS
'存款总金额';

COMMENT ON COLUMN T_SHOP.DISCOUNTAMT IS
'折扣总金额';

COMMENT ON COLUMN T_SHOP.BANKCODE IS
'银行代码';

COMMENT ON COLUMN T_SHOP.BANKACCNO IS
'银行帐号';

COMMENT ON COLUMN T_SHOP.BANKACCNAME IS
'银行帐户名';

COMMENT ON COLUMN T_SHOP.OPENDATE IS
'开户日期';

COMMENT ON COLUMN T_SHOP.CLOSEDATE IS
'销户日期';

COMMENT ON COLUMN T_SHOP.USEFLAG IS
'使用标志';

ALTER TABLE T_SHOP
   ADD CONSTRAINT PK_T_SHOP PRIMARY KEY (SHOPID);

/*==============================================================*/
/* Table: T_SHOPACC                                             */
/*==============================================================*/
CREATE TABLE T_SHOPACC  (
   ACCNO                VARCHAR2(10)                    NOT NULL,
   SHOPID               NUMBER(9)                       NOT NULL,
   ACCNAME              VARCHAR2(90),
   SUBJNO               VARCHAR2(10)                    NOT NULL,
   ACCPWD               VARCHAR2(64),
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

COMMENT ON COLUMN T_SHOPACC.ACCNO IS
'账号';

COMMENT ON COLUMN T_SHOPACC.SHOPID IS
'商户号';

COMMENT ON COLUMN T_SHOPACC.ACCNAME IS
'帐户名';

COMMENT ON COLUMN T_SHOPACC.SUBJNO IS
'科目号';

COMMENT ON COLUMN T_SHOPACC.ACCPWD IS
'帐户密码';

COMMENT ON COLUMN T_SHOPACC.STATUS IS
'状态';

COMMENT ON COLUMN T_SHOPACC.YDAYBAL IS
'昨日余额';

COMMENT ON COLUMN T_SHOPACC.BALANCE IS
'帐户余额';

COMMENT ON COLUMN T_SHOPACC.AVAILBAL IS
'可用余额';

COMMENT ON COLUMN T_SHOPACC.FROZEBAL IS
'冻结余额';

COMMENT ON COLUMN T_SHOPACC.LASTTRANSDATE IS
'上次交易日期';

COMMENT ON COLUMN T_SHOPACC.LASTACCDATE IS
'上次清算日期';

COMMENT ON COLUMN T_SHOPACC.OPENDATE IS
'开户日期';

COMMENT ON COLUMN T_SHOPACC.CLOSEDATE IS
'销户日期';

ALTER TABLE T_SHOPACC
   ADD CONSTRAINT PK_T_SHOPACC PRIMARY KEY (ACCNO);

/*==============================================================*/
/* Table: T_SHOPCARD                                            */
/*==============================================================*/
CREATE TABLE T_SHOPCARD  (
   CARDNO               NUMBER(9)                       NOT NULL,
   SHOPID               NUMBER(9),
   SHOWCARDNO           VARCHAR2(10),
   CARDPHYID            VARCHAR2(16),
   CARDPWD              VARCHAR2(32),
   EXPIREDATE           VARCHAR2(8),
   STATUS               CHAR(1)                         NOT NULL,
   LOSSFLAG             CHAR(1)                         NOT NULL,
   LOSSDATE             VARCHAR2(8),
   OPENDATE             VARCHAR2(8),
   CLOSEDATE            VARCHAR2(8),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_SHOPCARD.CARDNO IS
'卡号';

COMMENT ON COLUMN T_SHOPCARD.SHOPID IS
'商户号';

COMMENT ON COLUMN T_SHOPCARD.SHOWCARDNO IS
'显示卡号';

COMMENT ON COLUMN T_SHOPCARD.CARDPHYID IS
'卡物理ID';

COMMENT ON COLUMN T_SHOPCARD.CARDPWD IS
'卡密码';

COMMENT ON COLUMN T_SHOPCARD.EXPIREDATE IS
'到期日期';

COMMENT ON COLUMN T_SHOPCARD.STATUS IS
'记录状态1-正常2-注销';

COMMENT ON COLUMN T_SHOPCARD.LOSSFLAG IS
'1-挂失0-未挂失';

COMMENT ON COLUMN T_SHOPCARD.LOSSDATE IS
'挂失日期';

COMMENT ON COLUMN T_SHOPCARD.OPENDATE IS
'开卡日期';

COMMENT ON COLUMN T_SHOPCARD.CLOSEDATE IS
'注销日期';

COMMENT ON COLUMN T_SHOPCARD.LASTSAVED IS
'最后保存时间';

ALTER TABLE T_SHOPCARD
   ADD CONSTRAINT PK_T_SHOPCARD PRIMARY KEY (CARDNO);

/*==============================================================*/
/* Table: T_SHOPMEAL                                            */
/*==============================================================*/
CREATE TABLE T_SHOPMEAL  (
   SHOPID               NUMBER(9)                       NOT NULL,
   ACCNO                VARCHAR2(10),
   ENDTIME1             VARCHAR2(6),
   ENDTIME2             VARCHAR2(6),
   ENDTIME3             VARCHAR2(6),
   ENDTIME4             VARCHAR2(6),
   OPERCODE             VARCHAR2(8),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_SHOPMEAL.SHOPID IS
'商户号';

COMMENT ON COLUMN T_SHOPMEAL.ACCNO IS
'商户账号';

COMMENT ON COLUMN T_SHOPMEAL.ENDTIME1 IS
'早餐结束时间';

COMMENT ON COLUMN T_SHOPMEAL.ENDTIME2 IS
'午餐结束时间';

COMMENT ON COLUMN T_SHOPMEAL.ENDTIME3 IS
'晚餐结束时间';

COMMENT ON COLUMN T_SHOPMEAL.ENDTIME4 IS
'夜餐结束时间';

COMMENT ON COLUMN T_SHOPMEAL.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_SHOPMEAL.LASTSAVED IS
'最后保存时间';

ALTER TABLE T_SHOPMEAL
   ADD CONSTRAINT PK_T_SHOPMEAL PRIMARY KEY (SHOPID);

/*==============================================================*/
/* Table: T_SHOPPAYDTL                                          */
/*==============================================================*/
CREATE TABLE T_SHOPPAYDTL  (
   SHOPID               NUMBER(9)                       NOT NULL,
   BEGINDATE            VARCHAR2(8),
   ENDDATE              VARCHAR2(8)                     NOT NULL,
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   AMOUNT               NUMBER(15,2)                    NOT NULL,
   OPERID               NUMBER(9),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_SHOPPAYDTL.SHOPID IS
'商户号';

COMMENT ON COLUMN T_SHOPPAYDTL.BEGINDATE IS
'开始日期';

COMMENT ON COLUMN T_SHOPPAYDTL.ENDDATE IS
'截止日期';

COMMENT ON COLUMN T_SHOPPAYDTL.ACCDATE IS
'解款日期';

COMMENT ON COLUMN T_SHOPPAYDTL.AMOUNT IS
'金额';

COMMENT ON COLUMN T_SHOPPAYDTL.OPERID IS
'操作员ID';

COMMENT ON COLUMN T_SHOPPAYDTL.REMARK IS
'备注';

ALTER TABLE T_SHOPPAYDTL
   ADD CONSTRAINT PK_T_SHOPPAYDTL PRIMARY KEY (SHOPID, ENDDATE);

/*==============================================================*/
/* Table: T_SHOPPOS                                             */
/*==============================================================*/
CREATE TABLE T_SHOPPOS  (
   ID                   NUMBER(9)                       NOT NULL,
   DEVICEID             NUMBER(9)                       NOT NULL,
   DEVPHYID             VARCHAR2(20),
   SHOPID               NUMBER(9)                       NOT NULL,
   ENDTIME              VARCHAR2(6),
   REMARK               VARCHAR2(240),
   STARTDATE            VARCHAR2(8),
   ENDDATE              VARCHAR2(8),
   STATUS               CHAR(1),
   OPERCODE             VARCHAR2(8),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_SHOPPOS.ID IS
'记录编号';

COMMENT ON COLUMN T_SHOPPOS.DEVICEID IS
'设备ID';

COMMENT ON COLUMN T_SHOPPOS.DEVPHYID IS
'设备物理ID';

COMMENT ON COLUMN T_SHOPPOS.SHOPID IS
'商户号';

COMMENT ON COLUMN T_SHOPPOS.ENDTIME IS
'截止时间';

COMMENT ON COLUMN T_SHOPPOS.REMARK IS
'备注';

COMMENT ON COLUMN T_SHOPPOS.STARTDATE IS
'启用日期';

COMMENT ON COLUMN T_SHOPPOS.ENDDATE IS
'停用日期';

COMMENT ON COLUMN T_SHOPPOS.STATUS IS
'1-正常2-过期';

COMMENT ON COLUMN T_SHOPPOS.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_SHOPPOS.LASTSAVED IS
'最好保存时间';

ALTER TABLE T_SHOPPOS
   ADD CONSTRAINT PK_T_SHOPPOS PRIMARY KEY (ID);

/*==============================================================*/
/* Index: IDX_SHOPPOSDEVICE                                     */
/*==============================================================*/
CREATE INDEX IDX_SHOPPOSDEVICE ON T_SHOPPOS (
   DEVPHYID ASC
);

/*==============================================================*/
/* Table: T_SHOPPOSTMP                                          */
/*==============================================================*/
CREATE TABLE T_SHOPPOSTMP  (
   BATCHNO              VARCHAR2(20)                    NOT NULL,
   SEQNO                NUMBER(9)                       NOT NULL,
   TRANSDATE            VARCHAR2(8),
   TRANSTIME            VARCHAR2(6),
   OPERCODE             VARCHAR2(8),
   DEVICEID             NUMBER(9),
   DEVPHYID             VARCHAR2(20),
   SHOPID               NUMBER(9)                       NOT NULL,
   ENDTIME              VARCHAR2(6),
   STARTDATE            VARCHAR2(8),
   ENDDATE              VARCHAR2(8),
   ERRMSG               VARCHAR2(240)
);

COMMENT ON COLUMN T_SHOPPOSTMP.BATCHNO IS
'导入批次号';

COMMENT ON COLUMN T_SHOPPOSTMP.SEQNO IS
'导入顺序号';

COMMENT ON COLUMN T_SHOPPOSTMP.TRANSDATE IS
'导入日期';

COMMENT ON COLUMN T_SHOPPOSTMP.TRANSTIME IS
'导入时间';

COMMENT ON COLUMN T_SHOPPOSTMP.OPERCODE IS
'导入操作员';

COMMENT ON COLUMN T_SHOPPOSTMP.DEVICEID IS
'设备ID';

COMMENT ON COLUMN T_SHOPPOSTMP.DEVPHYID IS
'设备物理ID';

COMMENT ON COLUMN T_SHOPPOSTMP.SHOPID IS
'商户号';

COMMENT ON COLUMN T_SHOPPOSTMP.ENDTIME IS
'截止时间';

COMMENT ON COLUMN T_SHOPPOSTMP.STARTDATE IS
'启用日期';

COMMENT ON COLUMN T_SHOPPOSTMP.ENDDATE IS
'停用日期';

COMMENT ON COLUMN T_SHOPPOSTMP.ERRMSG IS
'错误信息';

ALTER TABLE T_SHOPPOSTMP
   ADD CONSTRAINT PK_T_SHOPPOSTMP PRIMARY KEY (BATCHNO, SEQNO);

/*==============================================================*/
/* Table: T_SHOWCARDNODTL                                       */
/*==============================================================*/
CREATE TABLE T_SHOWCARDNODTL  (
   ID                   NUMBER(9)                       NOT NULL,
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   BRANCHNO             NUMBER(9)                       NOT NULL,
   OPERCODE             VARCHAR2(8)                     NOT NULL,
   CARDTYPE             NUMBER(2)                       NOT NULL,
   USETYPE              NUMBER(9)                       NOT NULL,
   SUMMARY              VARCHAR2(60),
   INOUTFLAG            NUMBER(9),
   TRANSCNT             NUMBER(9),
   STARTNO              VARCHAR2(10),
   ENDNO                VARCHAR2(10)
);

COMMENT ON COLUMN T_SHOWCARDNODTL.ID IS
'ID';

COMMENT ON COLUMN T_SHOWCARDNODTL.ACCDATE IS
'业务日期';

COMMENT ON COLUMN T_SHOWCARDNODTL.BRANCHNO IS
'网点号';

COMMENT ON COLUMN T_SHOWCARDNODTL.OPERCODE IS
'操作员代码';

COMMENT ON COLUMN T_SHOWCARDNODTL.CARDTYPE IS
'卡类型';

COMMENT ON COLUMN T_SHOWCARDNODTL.USETYPE IS
'卡使用类型';

COMMENT ON COLUMN T_SHOWCARDNODTL.SUMMARY IS
'摘要';

COMMENT ON COLUMN T_SHOWCARDNODTL.INOUTFLAG IS
'1-收入2-支出';

COMMENT ON COLUMN T_SHOWCARDNODTL.TRANSCNT IS
'数量';

COMMENT ON COLUMN T_SHOWCARDNODTL.STARTNO IS
'开始号';

COMMENT ON COLUMN T_SHOWCARDNODTL.ENDNO IS
'截止号';

ALTER TABLE T_SHOWCARDNODTL
   ADD CONSTRAINT PK_T_SHOWCARDNODTL PRIMARY KEY (ID);

/*==============================================================*/
/* Index: IDX_SHOWCARDNODTL_ACCDATE                             */
/*==============================================================*/
CREATE INDEX IDX_SHOWCARDNODTL_ACCDATE ON T_SHOWCARDNODTL (
   ACCDATE ASC
);

/*==============================================================*/
/* Table: T_SITE                                                */
/*==============================================================*/
CREATE TABLE T_SITE  (
   SITENO               NUMBER(9)                       NOT NULL,
   SITENAME             VARCHAR2(60),
   IP                   VARCHAR2(15),
   MACHINECODE          VARCHAR2(60),
   LASTSAVED            VARCHAR2(30),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_SITE.SITENO IS
'站点号';

COMMENT ON COLUMN T_SITE.SITENAME IS
'站点名称';

COMMENT ON COLUMN T_SITE.IP IS
'IP地址';

COMMENT ON COLUMN T_SITE.MACHINECODE IS
'机器码';

COMMENT ON COLUMN T_SITE.LASTSAVED IS
'最后保存时间';

COMMENT ON COLUMN T_SITE.REMARK IS
'备注';

ALTER TABLE T_SITE
   ADD CONSTRAINT PK_T_SITE PRIMARY KEY (SITENO);

/*==============================================================*/
/* Table: T_SPECIALTY                                           */
/*==============================================================*/
CREATE TABLE T_SPECIALTY  (
   SPECIALTYCODE        VARCHAR2(30)                    NOT NULL,
   SPECIALTYNAME        VARCHAR2(60),
   USEFLAG              CHAR(1),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_SPECIALTY.SPECIALTYCODE IS
'专业代码';

COMMENT ON COLUMN T_SPECIALTY.SPECIALTYNAME IS
'专业名称';

COMMENT ON COLUMN T_SPECIALTY.USEFLAG IS
'使用标志';

COMMENT ON COLUMN T_SPECIALTY.LASTSAVED IS
'最后保存时间';

ALTER TABLE T_SPECIALTY
   ADD CONSTRAINT PK_T_SPECIALTY PRIMARY KEY (SPECIALTYCODE);

/*==============================================================*/
/* Table: T_STATCUSTTRANS                                       */
/*==============================================================*/
CREATE TABLE T_STATCUSTTRANS  (
   SETTLEDATE           NUMBER(8)                       NOT NULL,
   CUSTID               NUMBER(9)                       NOT NULL,
   TRANSDATE            NUMBER(8)                       NOT NULL,
   TRANSCNT             NUMBER(9)                       NOT NULL,
   TRANSAMT             NUMBER(15,2)                    NOT NULL
);

COMMENT ON COLUMN T_STATCUSTTRANS.SETTLEDATE IS
'结算日期';

COMMENT ON COLUMN T_STATCUSTTRANS.CUSTID IS
'客户号';

COMMENT ON COLUMN T_STATCUSTTRANS.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_STATCUSTTRANS.TRANSCNT IS
'刷卡次数';

COMMENT ON COLUMN T_STATCUSTTRANS.TRANSAMT IS
'刷卡金额';

ALTER TABLE T_STATCUSTTRANS
   ADD CONSTRAINT PK_T_STATCUSTTRANS PRIMARY KEY (SETTLEDATE, CUSTID, TRANSDATE);

/*==============================================================*/
/* Index: IDX_STATCUSTTRANS_TRANSDATE                           */
/*==============================================================*/
CREATE INDEX IDX_STATCUSTTRANS_TRANSDATE ON T_STATCUSTTRANS (
   TRANSDATE ASC
);

/*==============================================================*/
/* Table: T_STATTERMTIME                                        */
/*==============================================================*/
CREATE TABLE T_STATTERMTIME  (
   SETTLEDATE           NUMBER(8)                       NOT NULL,
   TERMID               NUMBER(9)                       NOT NULL,
   TRANSDATE            NUMBER(8)                       NOT NULL,
   TIMEID               NUMBER(2)                       NOT NULL,
   FEECNT               NUMBER(9)                       NOT NULL,
   FREECNT              NUMBER(9)                       NOT NULL,
   TOTALCNT             NUMBER(9)                       NOT NULL,
   TOTALAMT             NUMBER(15,2)                    NOT NULL
);

COMMENT ON COLUMN T_STATTERMTIME.SETTLEDATE IS
'结算日期';

COMMENT ON COLUMN T_STATTERMTIME.TERMID IS
'终端编号';

COMMENT ON COLUMN T_STATTERMTIME.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_STATTERMTIME.TIMEID IS
'时间ID';

COMMENT ON COLUMN T_STATTERMTIME.FEECNT IS
'收费次数';

COMMENT ON COLUMN T_STATTERMTIME.FREECNT IS
'记次次数';

COMMENT ON COLUMN T_STATTERMTIME.TOTALCNT IS
'总次数';

COMMENT ON COLUMN T_STATTERMTIME.TOTALAMT IS
'总金额';

ALTER TABLE T_STATTERMTIME
   ADD CONSTRAINT PK_T_STATTERMTIME PRIMARY KEY (SETTLEDATE, TERMID, TRANSDATE, TIMEID);

/*==============================================================*/
/* Table: T_SUBJECT                                             */
/*==============================================================*/
CREATE TABLE T_SUBJECT  (
   SUBJNO               VARCHAR2(10)                    NOT NULL,
   SUBJNAME             VARCHAR2(60)                    NOT NULL,
   SUBJTYPE             NUMBER(1),
   BALFLAG              NUMBER(1),
   FSUBJNO              VARCHAR2(10),
   SUBJLEVEL            NUMBER(1),
   ENDFLAG              NUMBER(1)
);

COMMENT ON COLUMN T_SUBJECT.SUBJNO IS
'科目号';

COMMENT ON COLUMN T_SUBJECT.SUBJNAME IS
'科目名称';

COMMENT ON COLUMN T_SUBJECT.SUBJTYPE IS
'科目类别';

COMMENT ON COLUMN T_SUBJECT.BALFLAG IS
'科目余额方向';

COMMENT ON COLUMN T_SUBJECT.FSUBJNO IS
'上级科目号';

COMMENT ON COLUMN T_SUBJECT.SUBJLEVEL IS
'科目级数';

COMMENT ON COLUMN T_SUBJECT.ENDFLAG IS
'末级标志';

ALTER TABLE T_SUBJECT
   ADD CONSTRAINT PK_T_SUBJECT PRIMARY KEY (SUBJNO);

/*==============================================================*/
/* Table: T_SUBSIDY                                             */
/*==============================================================*/
CREATE TABLE T_SUBSIDY  (
   BATCHNO              VARCHAR2(20)                    NOT NULL,
   SEQNO                NUMBER(9)                       NOT NULL,
   STUEMPNO             VARCHAR2(20),
   CUSTID               NUMBER(9),
   SUBSIDYNO            NUMBER(9),
   CARDNO               NUMBER(9),
   SUMMARY              VARCHAR2(60),
   BROKERNAME           VARCHAR2(60),
   BROKERIDNO           VARCHAR2(60),
   PAYTYPE              NUMBER(9),
   VOUCHERNO            VARCHAR2(20),
   AMOUNT               NUMBER(15,2),
   SUBSIDYTYPE          CHAR(1),
   SUBSIDYMODE          NUMBER(1),
   IMPDATE              VARCHAR2(8),
   IMPTIME              VARCHAR2(6),
   PUTDATE              VARCHAR2(8),
   PUTTIME              VARCHAR2(6),
   GETDATE              VARCHAR2(8),
   GETTIME              VARCHAR2(6),
   STATUS               CHAR(1),
   CHECKFLAG            NUMBER(1),
   ERRMSG               VARCHAR2(240),
   OPERCODE             VARCHAR2(8)
);

COMMENT ON COLUMN T_SUBSIDY.BATCHNO IS
'导入批次号';

COMMENT ON COLUMN T_SUBSIDY.SEQNO IS
'导入序号';

COMMENT ON COLUMN T_SUBSIDY.STUEMPNO IS
'学工号';

COMMENT ON COLUMN T_SUBSIDY.CUSTID IS
'客户号';

COMMENT ON COLUMN T_SUBSIDY.SUBSIDYNO IS
'补助批次号';

COMMENT ON COLUMN T_SUBSIDY.CARDNO IS
'交易卡号';

COMMENT ON COLUMN T_SUBSIDY.SUMMARY IS
'摘要';

COMMENT ON COLUMN T_SUBSIDY.BROKERNAME IS
'经办人姓名';

COMMENT ON COLUMN T_SUBSIDY.BROKERIDNO IS
'经办人身份证号';

COMMENT ON COLUMN T_SUBSIDY.PAYTYPE IS
'支付方式:1-现金2-支票3-经费本';

COMMENT ON COLUMN T_SUBSIDY.VOUCHERNO IS
'凭证号码';

COMMENT ON COLUMN T_SUBSIDY.AMOUNT IS
'发生额';

COMMENT ON COLUMN T_SUBSIDY.SUBSIDYTYPE IS
'补助类型';

COMMENT ON COLUMN T_SUBSIDY.SUBSIDYMODE IS
'补助模式';

COMMENT ON COLUMN T_SUBSIDY.IMPDATE IS
'交易日期';

COMMENT ON COLUMN T_SUBSIDY.IMPTIME IS
'交易时间';

COMMENT ON COLUMN T_SUBSIDY.PUTDATE IS
'下发日期';

COMMENT ON COLUMN T_SUBSIDY.PUTTIME IS
'下发时间';

COMMENT ON COLUMN T_SUBSIDY.GETDATE IS
'领取日期';

COMMENT ON COLUMN T_SUBSIDY.GETTIME IS
'领取时间';

COMMENT ON COLUMN T_SUBSIDY.STATUS IS
'状态:1-未下发2-已下发3-已领取-4-无效';

COMMENT ON COLUMN T_SUBSIDY.CHECKFLAG IS
'审核标志';

COMMENT ON COLUMN T_SUBSIDY.ERRMSG IS
'错误信息';

COMMENT ON COLUMN T_SUBSIDY.OPERCODE IS
'操作员号';

ALTER TABLE T_SUBSIDY
   ADD CONSTRAINT PK_T_SUBSIDY PRIMARY KEY (BATCHNO, SEQNO);

/*==============================================================*/
/* Index: UNIQ_SUBSIDY_SUBSIDYNO                                */
/*==============================================================*/
CREATE UNIQUE INDEX UNIQ_SUBSIDY_SUBSIDYNO ON T_SUBSIDY (
   SUBSIDYNO ASC
);

/*==============================================================*/
/* Index: IDX_SUBSIDY_STATUS                                    */
/*==============================================================*/
CREATE INDEX IDX_SUBSIDY_STATUS ON T_SUBSIDY (
   STATUS ASC
);

/*==============================================================*/
/* Table: T_SUBSYSPARA                                          */
/*==============================================================*/
CREATE TABLE T_SUBSYSPARA  (
   SYSID                NUMBER(9)                       NOT NULL,
   WORKMODE             CHAR(1),
   BEATINTERVAL         NUMBER(9),
   BEATCNTLIMIT         NUMBER(9),
   REQBEATFUNCNO        NUMBER(9),
   REQDEVFUNCNO         NUMBER(9),
   REQTASKFUNCNO        NUMBER(9),
   RESPFUNCNO           NUMBER(9),
   EXECTIMEOUT          NUMBER(9),
   COLINTERVAL          NUMBER(9),
   QRYINTERVAL          NUMBER(9),
   TASKMAXLIMIT         NUMBER(9),
   BCCDRTPNO            NUMBER(9),
   BCCDRTPIP            VARCHAR2(15),
   BCCDRTPPORT          NUMBER(9),
   BCCMAINFUNCNO        NUMBER(9),
   BCCINTERVAL          NUMBER(9)
);

COMMENT ON COLUMN T_SUBSYSPARA.SYSID IS
'子系统ID';

COMMENT ON COLUMN T_SUBSYSPARA.WORKMODE IS
'工作模式';

COMMENT ON COLUMN T_SUBSYSPARA.BEATINTERVAL IS
'心跳间隔';

COMMENT ON COLUMN T_SUBSYSPARA.BEATCNTLIMIT IS
'心跳次数限制';

COMMENT ON COLUMN T_SUBSYSPARA.REQBEATFUNCNO IS
'心跳发送功能号';

COMMENT ON COLUMN T_SUBSYSPARA.REQDEVFUNCNO IS
'请求设备信息功能号';

COMMENT ON COLUMN T_SUBSYSPARA.REQTASKFUNCNO IS
'请求任务功能号';

COMMENT ON COLUMN T_SUBSYSPARA.RESPFUNCNO IS
'应答功能号';

COMMENT ON COLUMN T_SUBSYSPARA.EXECTIMEOUT IS
'执行超时时间';

COMMENT ON COLUMN T_SUBSYSPARA.COLINTERVAL IS
'采集间隔';

COMMENT ON COLUMN T_SUBSYSPARA.QRYINTERVAL IS
'查询任务间隔';

COMMENT ON COLUMN T_SUBSYSPARA.TASKMAXLIMIT IS
'任务最大限制';

COMMENT ON COLUMN T_SUBSYSPARA.BCCDRTPNO IS
'BCCDRTPNO';

COMMENT ON COLUMN T_SUBSYSPARA.BCCDRTPIP IS
'BCCDRTPIP';

COMMENT ON COLUMN T_SUBSYSPARA.BCCDRTPPORT IS
'BCCDRTPPORT';

COMMENT ON COLUMN T_SUBSYSPARA.BCCMAINFUNCNO IS
'BCCMAINFUNCNO';

COMMENT ON COLUMN T_SUBSYSPARA.BCCINTERVAL IS
'BCCINTERVAL';

ALTER TABLE T_SUBSYSPARA
   ADD CONSTRAINT PK_T_SUBSYSPARA PRIMARY KEY (SYSID);

/*==============================================================*/
/* Table: T_SUBSYSSYNC                                          */
/*==============================================================*/
CREATE TABLE T_SUBSYSSYNC  (
   SYSID                NUMBER(9)                       NOT NULL,
   SYNCTYPE             NUMBER(9)                       NOT NULL,
   SYSVERNO             VARCHAR2(14),
   UPDATETIME           VARCHAR2(14)
);

COMMENT ON COLUMN T_SUBSYSSYNC.SYSID IS
'子系统ID';

COMMENT ON COLUMN T_SUBSYSSYNC.SYNCTYPE IS
'同步类型';

COMMENT ON COLUMN T_SUBSYSSYNC.SYSVERNO IS
'版本号';

COMMENT ON COLUMN T_SUBSYSSYNC.UPDATETIME IS
'更新时间';

ALTER TABLE T_SUBSYSSYNC
   ADD CONSTRAINT PK_T_SUBSYSSYNC PRIMARY KEY (SYSID, SYNCTYPE);

/*==============================================================*/
/* Table: T_SUBSYSTEM                                           */
/*==============================================================*/
CREATE TABLE T_SUBSYSTEM  (
   SYSID                NUMBER(9)                       NOT NULL,
   SYSNAME              VARCHAR2(60),
   SYSTYPE              NUMBER(9),
   AREACODE             VARCHAR2(3),
   SERVERID             NUMBER(9),
   MACADDR              VARCHAR2(17),
   IP                   VARCHAR2(15),
   PORT                 NUMBER(9),
   CARDVERNO            VARCHAR2(12)                   DEFAULT '000000000000',
   INITKEY              VARCHAR2(32),
   DYNAKEY              VARCHAR2(32),
   SYNCTIME             VARCHAR2(30),
   RUNSTATUS            NUMBER(9),
   STATUS               CHAR(1),
   OPENDATE             VARCHAR2(8),
   CLOSEDATE            VARCHAR2(8),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_SUBSYSTEM.SYSID IS
'SYSID';

COMMENT ON COLUMN T_SUBSYSTEM.SYSNAME IS
'SYSNAME';

COMMENT ON COLUMN T_SUBSYSTEM.SYSTYPE IS
'SYSTYPE';

COMMENT ON COLUMN T_SUBSYSTEM.AREACODE IS
'区域代码';

COMMENT ON COLUMN T_SUBSYSTEM.SERVERID IS
'SERVERID';

COMMENT ON COLUMN T_SUBSYSTEM.MACADDR IS
'MACADDR';

COMMENT ON COLUMN T_SUBSYSTEM.IP IS
'IP';

COMMENT ON COLUMN T_SUBSYSTEM.PORT IS
'PORT';

COMMENT ON COLUMN T_SUBSYSTEM.CARDVERNO IS
'卡版本号';

COMMENT ON COLUMN T_SUBSYSTEM.INITKEY IS
'INITKEY';

COMMENT ON COLUMN T_SUBSYSTEM.DYNAKEY IS
'DYNAKEY';

COMMENT ON COLUMN T_SUBSYSTEM.SYNCTIME IS
'SYNCTIME';

COMMENT ON COLUMN T_SUBSYSTEM.RUNSTATUS IS
'运行状态';

COMMENT ON COLUMN T_SUBSYSTEM.STATUS IS
'STATUS';

COMMENT ON COLUMN T_SUBSYSTEM.OPENDATE IS
'注册日期';

COMMENT ON COLUMN T_SUBSYSTEM.CLOSEDATE IS
'注销日期';

COMMENT ON COLUMN T_SUBSYSTEM.REMARK IS
'REMARK';

ALTER TABLE T_SUBSYSTEM
   ADD CONSTRAINT PK_T_SUBSYSTEM PRIMARY KEY (SYSID);

/*==============================================================*/
/* Table: T_SYSINFO                                             */
/*==============================================================*/
CREATE TABLE T_SYSINFO  (
   PARAID               NUMBER(9)                       NOT NULL,
   PARAVAL              VARCHAR2(60),
   PARANAME             VARCHAR2(240),
   SETFLAG              NUMBER(1),
   VALTYPE              NUMBER(1),
   DICTTYPE             NUMBER(9),
   DISPLAYFLAG          NUMBER(1),
   PARADESC             VARCHAR2(240)
);

COMMENT ON COLUMN T_SYSINFO.PARAID IS
'参数ID';

COMMENT ON COLUMN T_SYSINFO.PARAVAL IS
'参数值';

COMMENT ON COLUMN T_SYSINFO.PARANAME IS
'参数名称';

COMMENT ON COLUMN T_SYSINFO.SETFLAG IS
'SETFLAG';

COMMENT ON COLUMN T_SYSINFO.VALTYPE IS
'值类型';

COMMENT ON COLUMN T_SYSINFO.DICTTYPE IS
'字典类型';

COMMENT ON COLUMN T_SYSINFO.DISPLAYFLAG IS
'是否显示';

COMMENT ON COLUMN T_SYSINFO.PARADESC IS
'备注';

ALTER TABLE T_SYSINFO
   ADD CONSTRAINT PK_T_SYSINFO PRIMARY KEY (PARAID);

/*==============================================================*/
/* Table: T_SYSKEY                                              */
/*==============================================================*/
CREATE TABLE T_SYSKEY  (
   KEYCODE              VARCHAR2(60)                    NOT NULL,
   KEYNAME              VARCHAR2(60),
   KEYVAL               NUMBER(10),
   MAXVAL               NUMBER(9),
   KEYTYPE              CHAR(1)
);

COMMENT ON COLUMN T_SYSKEY.KEYCODE IS
'KEYCODE';

COMMENT ON COLUMN T_SYSKEY.KEYNAME IS
'KEYNAME';

COMMENT ON COLUMN T_SYSKEY.KEYVAL IS
'KEYVALUE';

COMMENT ON COLUMN T_SYSKEY.MAXVAL IS
'最大值';

COMMENT ON COLUMN T_SYSKEY.KEYTYPE IS
'KEYTYPE';

ALTER TABLE T_SYSKEY
   ADD CONSTRAINT PK_T_SYSKEY PRIMARY KEY (KEYCODE);

/*==============================================================*/
/* Table: T_SYSPARA                                             */
/*==============================================================*/
CREATE TABLE T_SYSPARA  (
   PARAID               NUMBER(9)                       NOT NULL,
   PARAVAL              VARCHAR2(60),
   PARANAME             VARCHAR2(60),
   PARAUNIT             VARCHAR2(30),
   DISPLAYFLAG          NUMBER(1),
   REMARK               VARCHAR2(240),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_SYSPARA.PARAID IS
'参数ID';

COMMENT ON COLUMN T_SYSPARA.PARAVAL IS
'参数值';

COMMENT ON COLUMN T_SYSPARA.PARANAME IS
'参数名称';

COMMENT ON COLUMN T_SYSPARA.PARAUNIT IS
'单位';

COMMENT ON COLUMN T_SYSPARA.DISPLAYFLAG IS
'是否显示';

COMMENT ON COLUMN T_SYSPARA.REMARK IS
'备注';

COMMENT ON COLUMN T_SYSPARA.LASTSAVED IS
'最后保存时间';

ALTER TABLE T_SYSPARA
   ADD CONSTRAINT PK_T_SYSPARA PRIMARY KEY (PARAID);

/*==============================================================*/
/* Table: T_TERM                                                */
/*==============================================================*/
CREATE TABLE T_TERM  (
   TERMID               NUMBER(9)                       NOT NULL,
   TERMSEQNO            NUMBER(9),
   CHECKNUM             NUMBER(9),
   SHOPID               NUMBER(9),
   REFNO                VARCHAR2(20)
);

COMMENT ON COLUMN T_TERM.TERMID IS
'终端ID';

COMMENT ON COLUMN T_TERM.TERMSEQNO IS
'终端流水号';

COMMENT ON COLUMN T_TERM.CHECKNUM IS
'校验码';

COMMENT ON COLUMN T_TERM.SHOPID IS
'所属商户';

COMMENT ON COLUMN T_TERM.REFNO IS
'参考号';

ALTER TABLE T_TERM
   ADD CONSTRAINT PK_T_TERM PRIMARY KEY (TERMID);

/*==============================================================*/
/* Table: T_TRANSCODE                                           */
/*==============================================================*/
CREATE TABLE T_TRANSCODE  (
   TRANSCODE            NUMBER(4)                       NOT NULL,
   TRANSNAME            VARCHAR2(60),
   LOGFLAG              NUMBER(9),
   LIMITFLAG            NUMBER(9),
   FEEFLAG              NUMBER(9),
   TRANSFLAG            NUMBER(9),
   DISABLEFLAG          NUMBER(9)
);

COMMENT ON COLUMN T_TRANSCODE.TRANSCODE IS
'交易码';

COMMENT ON COLUMN T_TRANSCODE.TRANSNAME IS
'交易名称';

COMMENT ON COLUMN T_TRANSCODE.LOGFLAG IS
'是否记录操作员日志:0-不记录1-只记录成功流水2-只记录失败3-成功失败都记录';

COMMENT ON COLUMN T_TRANSCODE.LIMITFLAG IS
'是否限制操作员:0不限制1-限制';

COMMENT ON COLUMN T_TRANSCODE.FEEFLAG IS
'收费标志';

COMMENT ON COLUMN T_TRANSCODE.TRANSFLAG IS
'交易标志';

COMMENT ON COLUMN T_TRANSCODE.DISABLEFLAG IS
'禁用标志';

ALTER TABLE T_TRANSCODE
   ADD CONSTRAINT PK_T_TRANSCODE PRIMARY KEY (TRANSCODE);

/*==============================================================*/
/* Table: T_TRANSDTL                                            */
/*==============================================================*/
CREATE TABLE T_TRANSDTL  (
   ACCDATE              VARCHAR2(8)                     NOT NULL,
   ACCTIME              VARCHAR2(6),
   REFNO                VARCHAR2(20),
   TERMID               NUMBER(9)                       NOT NULL,
   TERMSEQNO            NUMBER(9)                       NOT NULL,
   TRANSDATE            VARCHAR2(8),
   TRANSTIME            VARCHAR2(6),
   TRANSCODE            NUMBER(4),
   CUSTID               NUMBER(9),
   CUSTNAME             VARCHAR2(60),
   STUEMPNO             VARCHAR2(20),
   SHOWCARDNO           VARCHAR2(10),
   CARDNO               NUMBER(9),
   PURSENO              NUMBER(2),
   DPSCNT               NUMBER(9),
   PAYCNT               NUMBER(9),
   TRANSFLAG            NUMBER(1),
   CARDCNT              NUMBER(9),
   CARDBEFBAL           NUMBER(15,2),
   CARDAFTBAL           NUMBER(15,2),
   AMOUNT               NUMBER(15,2),
   ADDAMT               NUMBER(15,2),
   MANAGEFEE            NUMBER(15,2),
   PAYTYPE              NUMBER(9),
   VOUCHERNO            VARCHAR2(20),
   OPERCODE             VARCHAR2(8),
   OPERID               NUMBER(9),
   SYSID                NUMBER(9),
   DEVPHYID             VARCHAR2(20),
   DEVSEQNO             NUMBER(9),
   EXTTYPE              NUMBER(9),
   EXTDATA              VARCHAR2(30),
   COLDATE              VARCHAR2(8),
   COLTIME              VARCHAR2(6),
   OFFLINEFLAG          NUMBER(1),
   REVFLAG              NUMBER(1),
   STATUS               NUMBER(1),
   ERRCODE              NUMBER(9),
   REMARK               VARCHAR2(240)
)
TABLESPACE TS_YKT_HIS;

COMMENT ON COLUMN T_TRANSDTL.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_TRANSDTL.ACCTIME IS
'记账时间';

COMMENT ON COLUMN T_TRANSDTL.REFNO IS
'交易参考号';

COMMENT ON COLUMN T_TRANSDTL.TERMID IS
'终端编号';

COMMENT ON COLUMN T_TRANSDTL.TERMSEQNO IS
'终端流水号';

COMMENT ON COLUMN T_TRANSDTL.TRANSDATE IS
'交易日期';

COMMENT ON COLUMN T_TRANSDTL.TRANSTIME IS
'交易时间';

COMMENT ON COLUMN T_TRANSDTL.TRANSCODE IS
'交易码';

COMMENT ON COLUMN T_TRANSDTL.CUSTID IS
'客户号';

COMMENT ON COLUMN T_TRANSDTL.CUSTNAME IS
'客户名';

COMMENT ON COLUMN T_TRANSDTL.STUEMPNO IS
'学工号';

COMMENT ON COLUMN T_TRANSDTL.SHOWCARDNO IS
'显示卡号';

COMMENT ON COLUMN T_TRANSDTL.CARDNO IS
'卡号';

COMMENT ON COLUMN T_TRANSDTL.PURSENO IS
'钱包号';

COMMENT ON COLUMN T_TRANSDTL.DPSCNT IS
'充值次数';

COMMENT ON COLUMN T_TRANSDTL.PAYCNT IS
'消费次数';

COMMENT ON COLUMN T_TRANSDTL.TRANSFLAG IS
'1充值标志2消费次数';

COMMENT ON COLUMN T_TRANSDTL.CARDCNT IS
'卡交易次数';

COMMENT ON COLUMN T_TRANSDTL.CARDBEFBAL IS
'交易前卡余额';

COMMENT ON COLUMN T_TRANSDTL.CARDAFTBAL IS
'交易后卡余额';

COMMENT ON COLUMN T_TRANSDTL.AMOUNT IS
'发生额';

COMMENT ON COLUMN T_TRANSDTL.ADDAMT IS
'正为加负为减';

COMMENT ON COLUMN T_TRANSDTL.MANAGEFEE IS
'管理费';

COMMENT ON COLUMN T_TRANSDTL.PAYTYPE IS
'支付方式';

COMMENT ON COLUMN T_TRANSDTL.VOUCHERNO IS
'凭证号码';

COMMENT ON COLUMN T_TRANSDTL.OPERCODE IS
'操作员号';

COMMENT ON COLUMN T_TRANSDTL.OPERID IS
'操作员ID';

COMMENT ON COLUMN T_TRANSDTL.SYSID IS
'子系统编号';

COMMENT ON COLUMN T_TRANSDTL.DEVPHYID IS
'设备物理ID';

COMMENT ON COLUMN T_TRANSDTL.DEVSEQNO IS
'设备流水号';

COMMENT ON COLUMN T_TRANSDTL.EXTTYPE IS
'附加数据类型';

COMMENT ON COLUMN T_TRANSDTL.EXTDATA IS
'附加数据';

COMMENT ON COLUMN T_TRANSDTL.COLDATE IS
'采集日期';

COMMENT ON COLUMN T_TRANSDTL.COLTIME IS
'采集时间';

COMMENT ON COLUMN T_TRANSDTL.OFFLINEFLAG IS
'脱机标志';

COMMENT ON COLUMN T_TRANSDTL.REVFLAG IS
'冲正标志0-未冲正1-已冲正';

COMMENT ON COLUMN T_TRANSDTL.STATUS IS
'记录状态1:未入账2-入账失败3-成功';

COMMENT ON COLUMN T_TRANSDTL.ERRCODE IS
'错误码';

COMMENT ON COLUMN T_TRANSDTL.REMARK IS
'备注';

ALTER TABLE T_TRANSDTL
   ADD CONSTRAINT PK_T_TRANSDTL PRIMARY KEY (ACCDATE, TERMID, TERMSEQNO);

/*==============================================================*/
/* Index: IDX_TRANSDTL_CARDNO                                   */
/*==============================================================*/
CREATE INDEX IDX_TRANSDTL_CARDNO ON T_TRANSDTL (
   CARDNO ASC
)
TABLESPACE TS_YKT_HIS;

/*==============================================================*/
/* Index: IDX_TRANSDTL_CUSTID                                   */
/*==============================================================*/
CREATE INDEX IDX_TRANSDTL_CUSTID ON T_TRANSDTL (
   CUSTID ASC
)
TABLESPACE TS_YKT_HIS;

/*==============================================================*/
/* Index: IDX_TRANSDTL_TRANSCODE                                */
/*==============================================================*/
CREATE INDEX IDX_TRANSDTL_TRANSCODE ON T_TRANSDTL (
   TRANSCODE ASC
)
TABLESPACE TS_YKT_HIS;

/*==============================================================*/
/* Index: IDX_TRANSDTL_REFNO                                    */
/*==============================================================*/
CREATE INDEX IDX_TRANSDTL_REFNO ON T_TRANSDTL (
   REFNO ASC
)
TABLESPACE TS_YKT_HIS;

/*==============================================================*/
/* Table: T_TRANSPACK                                           */
/*==============================================================*/
CREATE TABLE T_TRANSPACK  (
   PACKETID             VARCHAR2(20)                    NOT NULL,
   REQID                VARCHAR2(20)                    NOT NULL,
   REQSNO               NUMBER(9)                       NOT NULL,
   FUNCNO               NUMBER(9),
   TRANSDATE            VARCHAR2(8)                     NOT NULL,
   TRANSTIME            VARCHAR2(6)                     NOT NULL,
   REVFLAG              NUMBER(1)                       NOT NULL,
   RETRYCNT             NUMBER(9)                       NOT NULL,
   STATUS               CHAR(1)                         NOT NULL,
   ERRCODE              NUMBER(9)                       NOT NULL,
   ERRMSG               VARCHAR2(240),
   DATALEN              NUMBER(9)                       NOT NULL,
   REQDATA              VARCHAR2(2000),
   ACCDATE              VARCHAR2(8),
   TERMID               NUMBER(9),
   TERMSEQNO            NUMBER(9),
   LASTUPDTIME          VARCHAR2(30)                    NOT NULL
);

COMMENT ON COLUMN T_TRANSPACK.PACKETID IS
'请求包ID:请求方发送的日期时间（YYYYMMDDHHMMSS）+（请求方流水号后3位）';

COMMENT ON COLUMN T_TRANSPACK.REQID IS
'请求方ID:POS机使用设备物理ID，操作员使用操作员代码';

COMMENT ON COLUMN T_TRANSPACK.REQSNO IS
'请求流水号:POS机就使用POS的流水号';

COMMENT ON COLUMN T_TRANSPACK.FUNCNO IS
'功能号';

COMMENT ON COLUMN T_TRANSPACK.TRANSDATE IS
'主机日期';

COMMENT ON COLUMN T_TRANSPACK.TRANSTIME IS
'主机时间';

COMMENT ON COLUMN T_TRANSPACK.REVFLAG IS
'冲正标志:0表示正常记录1表示冲正记录';

COMMENT ON COLUMN T_TRANSPACK.RETRYCNT IS
'重试次数';

COMMENT ON COLUMN T_TRANSPACK.STATUS IS
'处理状态:N未处理S成功R否决F失败D过期C撤销B退票V拒绝';

COMMENT ON COLUMN T_TRANSPACK.ERRCODE IS
'错误码';

COMMENT ON COLUMN T_TRANSPACK.ERRMSG IS
'错误消息';

COMMENT ON COLUMN T_TRANSPACK.DATALEN IS
'请求包长度';

COMMENT ON COLUMN T_TRANSPACK.REQDATA IS
'请求数据包';

COMMENT ON COLUMN T_TRANSPACK.ACCDATE IS
'记账日期';

COMMENT ON COLUMN T_TRANSPACK.TERMID IS
'终端号';

COMMENT ON COLUMN T_TRANSPACK.TERMSEQNO IS
'终端流水号';

COMMENT ON COLUMN T_TRANSPACK.LASTUPDTIME IS
'最后更新时间';

ALTER TABLE T_TRANSPACK
   ADD CONSTRAINT PK_T_TRANSPACK PRIMARY KEY (PACKETID, REQID);

/*==============================================================*/
/* Index: IDX_TRANSPACK_STATUS                                  */
/*==============================================================*/
CREATE INDEX IDX_TRANSPACK_STATUS ON T_TRANSPACK (
   STATUS ASC
);

/*==============================================================*/
/* Table: T_TRANSTYPE                                           */
/*==============================================================*/
CREATE TABLE T_TRANSTYPE  (
   TRANSTYPE            NUMBER(9)                       NOT NULL,
   TRANSNAME            VARCHAR2(60),
   DISPLAYFLAG          CHAR(1),
   USEFLAG              CHAR(1)
);

COMMENT ON COLUMN T_TRANSTYPE.TRANSTYPE IS
'交易类别';

COMMENT ON COLUMN T_TRANSTYPE.TRANSNAME IS
'交易名称';

COMMENT ON COLUMN T_TRANSTYPE.DISPLAYFLAG IS
'显示标志1-显示0-不显示';

COMMENT ON COLUMN T_TRANSTYPE.USEFLAG IS
'使用标志';

ALTER TABLE T_TRANSTYPE
   ADD CONSTRAINT PK_T_TRANSTYPE PRIMARY KEY (TRANSTYPE);

/*==============================================================*/
/* Table: T_USER                                                */
/*==============================================================*/
CREATE TABLE T_USER  (
   USERID               NUMBER(9)                       NOT NULL,
   USERNAME             VARCHAR2(60)                    NOT NULL,
   DEPTID               NUMBER(9),
   REMARK               VARCHAR2(240)
);

COMMENT ON COLUMN T_USER.USERID IS
'用户ID';

COMMENT ON COLUMN T_USER.USERNAME IS
'用户名称';

COMMENT ON COLUMN T_USER.DEPTID IS
'部门ID';

COMMENT ON COLUMN T_USER.REMARK IS
'备注';

ALTER TABLE T_USER
   ADD CONSTRAINT PK_T_USER PRIMARY KEY (USERID);

/*==============================================================*/
/* Table: T_WATERFEECFG                                         */
/*==============================================================*/
CREATE TABLE T_WATERFEECFG  (
   FEEID                NUMBER(9)                       NOT NULL,
   FEENAME              VARCHAR2(60),
   PURSENO              NUMBER(2),
   FEEMODE              NUMBER(9),
   FEETYPECNT           NUMBER(9)
);

COMMENT ON COLUMN T_WATERFEECFG.FEEID IS
'费率ID';

COMMENT ON COLUMN T_WATERFEECFG.FEENAME IS
'费率名称';

COMMENT ON COLUMN T_WATERFEECFG.PURSENO IS
'钱包号';

COMMENT ON COLUMN T_WATERFEECFG.FEEMODE IS
'费率模式';

COMMENT ON COLUMN T_WATERFEECFG.FEETYPECNT IS
'卡权限类别数量';

ALTER TABLE T_WATERFEECFG
   ADD CONSTRAINT PK_T_WATERFEECFG PRIMARY KEY (FEEID);

/*==============================================================*/
/* Table: T_WATERFEETYPE                                        */
/*==============================================================*/
CREATE TABLE T_WATERFEETYPE  (
   FEEID                NUMBER(9)                       NOT NULL,
   FEETYPE              NUMBER(9)                       NOT NULL,
   FEECNT               NUMBER(9),
   STARTTIME1           NUMBER(9),
   FEETIME1             NUMBER(9),
   FEEAMT1              NUMBER(9),
   STARTTIME2           NUMBER(9),
   FEETIME2             NUMBER(9),
   FEEAMT2              NUMBER(9),
   STARTTIME3           NUMBER(9),
   FEETIME3             NUMBER(9),
   FEEAMT3              NUMBER(9)
);

COMMENT ON COLUMN T_WATERFEETYPE.FEEID IS
'费率ID';

COMMENT ON COLUMN T_WATERFEETYPE.FEETYPE IS
'收费类别';

COMMENT ON COLUMN T_WATERFEETYPE.FEECNT IS
'费率数量';

COMMENT ON COLUMN T_WATERFEETYPE.STARTTIME1 IS
'计费开始时间1';

COMMENT ON COLUMN T_WATERFEETYPE.FEETIME1 IS
'计费时间1';

COMMENT ON COLUMN T_WATERFEETYPE.FEEAMT1 IS
'计费金额1';

COMMENT ON COLUMN T_WATERFEETYPE.STARTTIME2 IS
'计费开始时间2';

COMMENT ON COLUMN T_WATERFEETYPE.FEETIME2 IS
'计费时间2';

COMMENT ON COLUMN T_WATERFEETYPE.FEEAMT2 IS
'计费金额2';

COMMENT ON COLUMN T_WATERFEETYPE.STARTTIME3 IS
'计费开始时间3';

COMMENT ON COLUMN T_WATERFEETYPE.FEETIME3 IS
'计费时间3';

COMMENT ON COLUMN T_WATERFEETYPE.FEEAMT3 IS
'计费金额3';

ALTER TABLE T_WATERFEETYPE
   ADD CONSTRAINT PK_T_WATERFEETYPE PRIMARY KEY (FEEID, FEETYPE);

/*==============================================================*/
/* Table: T_WATERRATE                                           */
/*==============================================================*/
CREATE TABLE T_WATERRATE  (
   FEETYPE              NUMBER(3)                       NOT NULL,
   RATE1                NUMBER(9),
   RATE2                NUMBER(9),
   RATE3                NUMBER(9),
   LASTSAVED            VARCHAR2(30)
);

COMMENT ON COLUMN T_WATERRATE.FEETYPE IS
'收费类别';

COMMENT ON COLUMN T_WATERRATE.RATE1 IS
'水价1';

COMMENT ON COLUMN T_WATERRATE.RATE2 IS
'水价2';

COMMENT ON COLUMN T_WATERRATE.RATE3 IS
'水价3';

COMMENT ON COLUMN T_WATERRATE.LASTSAVED IS
'保存时间';

ALTER TABLE T_WATERRATE
   ADD CONSTRAINT PK_T_WATERRATE PRIMARY KEY (FEETYPE);

