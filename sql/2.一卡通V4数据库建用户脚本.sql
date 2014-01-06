create user ecard
  identified by "kingstar"
  default tablespace TS_YKT_CUR
  temporary tablespace TEMP
  profile DEFAULT
  quota unlimited on ts_ykt_cur
  quota unlimited on ts_ykt_his;
 
-- Grant/Revoke role privileges 
grant connect to ecard with admin option;
grant dba to ecard;
grant resource to ecard with admin option;
-- Grant/Revoke system privileges 
grant create any synonym to ecard with admin option;
grant create procedure to ecard with admin option;
grant create public synonym to ecard with admin option;
grant create table to ecard with admin option;
grant create view to ecard with admin option;
grant drop any procedure to ecard with admin option;
grant drop any synonym to ecard with admin option;
grant drop any table to ecard with admin option;
grant drop any view to ecard with admin option;
grant drop public synonym to ecard with admin option;
grant select any dictionary to ecard with admin option;
grant unlimited tablespace to ecard with admin option;