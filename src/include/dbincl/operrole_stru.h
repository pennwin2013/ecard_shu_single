#ifndef  __T_operrole_H_
#define  __T_operrole_H_
typedef struct 
{
		int	operroleid;
		int	operid;
		int	roleid;
		int	createdate;
}T_t_operrole;
int DB_t_operrole_add(T_t_operrole *pt_operrole);
int DB_t_operrole_read_by_operroleid(int v_operroleid,T_t_operrole *pt_operrole);
int DB_t_operrole_update_by_operroleid(int v_operroleid,T_t_operrole *pt_operrole);
int DB_t_operrole_del_by_operroleid(int v_operroleid);
int DB_t_operrole_read_lock_by_c0_and_operroleid(int v_operroleid,T_t_operrole *pt_operrole);
int DB_t_operrole_update_lock_by_c0(T_t_operrole *pt_operrole);
int DB_t_operrole_del_lock_by_c0();
int DB_t_operrole_free_lock_by_c0();
int DB_t_operrole_read_lock_by_c1_and_operid_and_roleid(int v_operid,int v_roleid,T_t_operrole *pt_operrole);
int DB_t_operrole_update_lock_by_c1(T_t_operrole *pt_operrole);
int DB_t_operrole_del_lock_by_c1();
int DB_t_operrole_free_lock_by_c1();
int DB_t_operrole_del_by_operid(int v_operid);
int DB_t_operrole_del_by_operid_and_roleid(int v_operid,int v_roleid);
int DB_t_operrole_del_by_roleid(int v_roleid);
#endif
