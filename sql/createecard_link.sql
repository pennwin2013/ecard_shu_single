----------------------------------------------------------------------------------------------------
create snapshot log on t_customer;
create snapshot log on t_custtype;
create snapshot log on t_feetype;
create snapshot log on t_dept;
create snapshot log on v_dictionary;
create snapshot log on t_card;
create snapshot log on t_syskey;
create snapshot log on t_specialty;
create snapshot log on t_syspara;
----------------------------------------------------------------------------------------------------
create public database link photodb connect to ecard identified by kingstar using 'PHOTODB';

-- urp_customer
create snapshot sn_urp_customer as select * from urp_customer@photodb;
alter snapshot sn_urp_customer refresh fast Start with sysdate+1/(24*60) next sysdate+1/(24*60);

CREATE SEQUENCE seq_custtmp
  START WITH 0
  MAXVALUE 999999999
  MINVALUE 0
  NOCYCLE
  CACHE 20
  NOORDER;

create or replace trigger tr_urp_customer
  after  insert or update on sn_urp_customer
  for each row
declare
  i_custtype integer;
  i_feetype  integer;
  s_batchno varchar2(20);
  i_seqno integer;
  i_dutycode integer;
  s_errmsg varchar(1024);
  s_outdate varchar(8);
begin

    select to_number(:new.reserve_2) into i_dutycode from dual;
    select custtype,feetype into i_custtype, i_feetype from t_custtype where custtypename=:new.CUT_TYPE;
    /* 如果职务代码最后一位是 1 ，表示正高级，收费类别使用教授
    */
    if i_dutycode mod 10 = 1 then
       i_feetype := 13;
    end if;
    s_batchno := to_char(sysdate,'YYYYMMDDHH24MISS');
    s_outdate := to_char(:new.OUT_DATE + INTERVAL '15' DAY,'YYYYMMDD');
    select seq_custtmp.nextval into i_seqno from dual;

    INSERT INTO T_CUSTOMERTMP (
      CUSTTYPE,FEETYPE,BATCHNO, SEQNO, TRANSDATE, OPERCODE, STUEMPNO,  CUSTTYPENAME,
      CUSTNAME,AREACODE, DEPTCODE,DEPTNAME,SPECIALTYCODE, CLASSNAME, IDTYPE, IDNO, SEX,
      COUNTRY, NATION, EMAIL, TEL, MOBILE, ADDR, ZIPCODE,INDATE, OUTDATE, SYNCFLAG,
      CHKFLAG, ERRMSG, INSCHOOL, STATUSCODE )
    VALUES ( i_custtype, i_feetype,s_batchno,i_seqno,substr(s_batchno,1,4),'',:new.STUEMP_NO,:new.CUT_TYPE,
      :new.STUEMP_NAME,:new.AREA,:new.DEPT_CODE,'',:new.S_CODE,:new.CLASS_NO,1,:new.ID_NO,
      :new.SEX,'',:new.NATION,:new.EMAIL,substr(:new.TEL,1,30),:new.MOBILE,:new.ADDRESS,'',
      to_char(:new.in_date,'YYYYMMDD'),s_outdate,1,0,'',:new.is_inschool, substr(:new.reserve_1,1,8));
exception
  when OTHERS then
    select seq_syncusterr.nextval into i_seqno from dual;
    s_errmsg := 'sqlcode : ' ||sqlcode || ' -- sqlerrm : ' ||sqlerrm;
    insert into t_synccusterr(syncid,stuempno,errmsg)values(i_seqno,:new.STUEMP_NO,substr(s_errmsg,1,255));

    dbms_output.put_line('处理数据失败，stuemp=' || :new.STUEMP_NO);
    DBMS_OUTPUT.put_line('sqlcode : ' ||sqlcode);
    DBMS_OUTPUT.put_line('sqlerrm : ' ||sqlerrm);
end tr_urp_customer;



-----------------------------------------------------------------------------------------
create snapshot t_photo as select * from t_photo@photodb;
alter snapshot sn_urp_customer refresh fast Start with sysdate+20/(24*60) next sysdate+20/(24*60);
-------------------------------------------------------------------------
create public database link hisdb connect to ecard identified by kingstar using 'HISDB';

------------------------------------------------------------------------------