--操作员表
delete from T_OPERATOR where opertype='0';
insert into T_OPERATOR (OPERID,OPERCODE, OPERTYPE, BRANCHNO, CARDNO, OPERNAME, TEL, MOBILE, EMAIL, ADDR, ZIPCODE, OPERPWD, STATUS, SITELIMIT, LOGINFLAG, LOGINSITENO, LOGINTIME, LOGOUTTIME, FAILNUMBER, OPENDATE, CLOSEDATE)
values (1,'system', '0', 100, 0, '系统管理员', null, null, null, null, null, '24E5566019FFEDAD', '1', '0', '0', 0, '2008-11-28 12:27:19', '2008-11-28 12:28:26', 0, null, null);
commit;
delete from t_role where roleid=1;
insert into T_ROLE (ROLEID, ROLENAME, ROLEDESC, CREATEDATE, UPDTIME, DELETED)
values (1, '系统操作员', '系统操作员', 20111219, '20111219100935', 0);
commit;
insert into T_OPERROLE (OPERROLEID, OPERID, ROLEID, CREATEDATE)
values (1, 1, 1, 20111219);
commit;
insert into T_ROLEMODULE (ROLEID, MODULECODE)
values (1, '10');
insert into T_ROLEMODULE (ROLEID, MODULECODE)
values (1, '1010');
insert into T_ROLEMODULE (ROLEID, MODULECODE)
values (1, '101010');
insert into T_ROLEMODULE (ROLEID, MODULECODE)
values (1, '10101010');
insert into T_ROLEMODULE (ROLEID, MODULECODE)
values (1, '10101011');
insert into T_ROLEMODULE (ROLEID, MODULECODE)
values (1, '10101012');
insert into T_ROLEMODULE (ROLEID, MODULECODE)
values (1, '10101013');
insert into T_ROLEMODULE (ROLEID, MODULECODE)
values (1, '10101014');
insert into T_ROLEMODULE (ROLEID, MODULECODE)
values (1, '10101015');
insert into T_ROLEMODULE (ROLEID, MODULECODE)
values (1, '10101016');
insert into T_ROLEMODULE (ROLEID, MODULECODE)
values (1, '10101017');
insert into T_ROLEMODULE (ROLEID, MODULECODE)
values (1, '10101018');
commit;