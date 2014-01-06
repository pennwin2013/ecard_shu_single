create public database link ecarddb connect to ecard identified by kingstar using 'ECARDDB';

-- create snapshot log on t_photo;
-- t_customer
create or replace view t_customer as select * from t_customer@ecarddb;

-- t_custtype
create snapshot t_custtype as select * from t_custtype@ecarddb;
alter snapshot t_custtype refresh fast Start with sysdate+1/(24*60) next sysdate+5/(24*60);

-- t_feetype
create snapshot t_feetype as select * from t_feetype@ecarddb;
alter snapshot t_feetype refresh fast Start with sysdate+1/(24*60) next sysdate+5/(24*60);

-- t_dept
create snapshot t_dept as select * from t_dept@ecarddb;
alter snapshot t_dept refresh fast Start with sysdate+1/(24*60) next sysdate+5/(24*60);

-- v_dictionary
create or replace view v_dictionary as select * from v_dictionary@ecarddb;
create or replace view t_dictionary as select * from v_dictionary@ecarddb;

-- t_card
create snapshot t_card as select * from t_card@ecarddb;
alter snapshot t_card refresh fast Start with sysdate+1/(24*60) next sysdate+5/(24*60);

-- t_area
create snapshot t_area as select * from t_area@ecarddb;
alter snapshot t_area refresh fast Start with sysdate+1/(24*60) next sysdate+5/(24*60);

-- t_syskey
create snapshot t_syskey as select * from t_syskey@ecarddb;
alter snapshot t_syskey refresh fast Start with sysdate+1/(24*60) next sysdate+5/(24*60);


-- t_specialty
create snapshot t_specialty as select * from t_specialty@ecarddb;
alter snapshot t_specialty refresh fast Start with sysdate+1/(24*60) next sysdate+5/(24*60);

-- t_syspara
create snapshot t_syspara as select * from t_syspara@ecarddb;
alter snapshot t_syspara refresh fast Start with sysdate+1/(24*60) next sysdate+5/(24*60);

