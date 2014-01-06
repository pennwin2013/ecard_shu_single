create or replace procedure p_recreateindex(owner varchar2,v_tabname varchar2) is
 idxname varchar2(60);
 create_index_sql varchar2(2000);
 create_index_tmpl varchar2(2000);
 row_cnt number:=0;
begin
  for idxcur in (select index_name into idxname from user_indexes where table_name =upper(v_tabname) and index_name like 'IDX_%' ) loop
   SELECT DBMS_METADATA.GET_DDL('INDEX',idxcur.index_name,upper(owner)) into create_index_tmpl FROM dual;
   for tabcur in (select table_name from user_tables  where regexp_like(table_name,upper(v_tabname)||'20\d{4}$') order by table_name) loop 
     select count(*) into row_cnt from user_indexes where  table_name=tabcur.table_name and index_name = replace(idxcur.index_name,substr(upper(v_tabname),3),substr(tabcur.table_name,3));  
     if row_cnt<1 then
          select replace(create_index_tmpl,substr(upper(v_tabname),3),substr(tabcur.table_name,3)) into  create_index_sql from dual;
		  select replace(create_index_sql,'TS_YKT_CUR','TS_YKT_HIS') into  create_index_sql from dual;
          dbms_output.put_line(create_index_sql);    
          execute immediate create_index_sql;           
     end if;
   end loop;
  end loop;
end p_recreateindex;
/
create or replace procedure p_recreatekey(owner varchar2,v_tabname varchar2) is
 pkeyname varchar2(60);
 create_pkey_sql varchar2(2000);
 create_pkey_tmpl varchar2(2000);
 row_cnt number:=0;
begin
   select constraint_name into pkeyname from user_constraints where  table_name=upper(v_tabname) and constraint_type='P';
   SELECT DBMS_METADATA.GET_DDL('CONSTRAINT',pkeyname,upper(owner)) into create_pkey_tmpl FROM dual;
   for tabcur in (select table_name from user_tables  where regexp_like(table_name,upper(v_tabname)||'20\d{4}$') order by table_name) loop 
     select count(*) into row_cnt from user_constraints where  table_name=tabcur.table_name and constraint_type='P';  
     if row_cnt<1 then
          select replace(create_pkey_tmpl,upper(v_tabname),tabcur.table_name) into  create_pkey_sql from dual;
		  select replace(create_pkey_sql,'TS_YKT_CUR','TS_YKT_HIS') into  create_pkey_sql from dual;
          dbms_output.put_line(create_pkey_sql);    
          execute immediate create_pkey_sql;           
     end if;
   end loop;
end p_recreatekey;
/
create or replace procedure p_rebuildview(v_tabname varchar2) is
 create_view_sql varchar2(2000);
 curyear varchar2(4);
 row_cnt number:=0;
begin
   create_view_sql:='create or replace view V'||substr(upper(v_tabname),2)||' as '|| CHR(10) ;
   for tabcur in (select table_name from user_tables  where regexp_like(table_name,upper(v_tabname)||'20\d{4}$') order by table_name) loop 
     if row_cnt=0 then
        create_view_sql:=create_view_sql||' select * from '||tabcur.table_name||CHR(10) ;
        row_cnt:=row_cnt+1;
     else
        create_view_sql:=create_view_sql||' union all select * from '||tabcur.table_name||CHR(10) ;
     end if;
   end loop;
   if row_cnt <1 then
      create_view_sql:=create_view_sql||' select * from '||upper(v_tabname)||CHR(10) ;
   else
      create_view_sql:=create_view_sql||' union all select * from '||upper(v_tabname)||CHR(10) ;
   end if;
   dbms_output.put_line(create_view_sql);
   execute immediate create_view_sql;
   select to_char(sysdate,'YYYY') into curyear from dual;
     --创建年视图
   for yearcur in (select distinct  regexp_substr(table_name,'\d\d\d\d') year from user_tables  
   where regexp_like(table_name,upper(v_tabname)||'20\d{4}$')) loop
     row_cnt:=0;   
     create_view_sql:='create or replace view V'||substr(upper(v_tabname),2)||'YEAR'||yearcur.year||' as '||CHR(10) ; 
     for montabcur in (select table_name from user_tables  where  table_name like upper(v_tabname)||yearcur.year||'%' order by table_name) loop 
        if row_cnt=0 then
           create_view_sql:=create_view_sql||' select * from '||montabcur.table_name||CHR(10) ;
           row_cnt:=row_cnt+1;
        else
           create_view_sql:=create_view_sql||' union all select * from '||montabcur.table_name||CHR(10) ;
        end if;
     end loop;
     if yearcur.year = curyear then
       if row_cnt<1 then
        create_view_sql:=create_view_sql||' select * from '||upper(v_tabname)||CHR(10) ;
       else
        create_view_sql:=create_view_sql||' union all select * from '||upper(v_tabname)||CHR(10) ;
       end if;
     end if;
     dbms_output.put_line(create_view_sql);
     execute immediate create_view_sql;     
   end loop;
end p_rebuildview;
/
create or replace procedure p_rebuildallindex(user_name in varchar2) is  
  s_sql   varchar2(500);  
  account number := 0;  
begin  
  
  for line2 in (select t.owner, t.index_name  
                  from all_indexes t  
                 where t.owner = upper(user_name)  
                   and t.table_type = 'TABLE'  
                   and t.temporary = 'N'
                   and t.index_type = 'NORMAL') loop  
    s_sql   := 'alter index ' || line2.owner || '.' || line2.index_name ||  
               ' rebuild';  
    account := account + 1;  
    execute immediate s_sql;  
  end loop;  
  dbms_output.put_line(account);  
exception  
  when others then  
    dbms_output.put_line(sqlerrm);  
end p_rebuildallindex;  
/