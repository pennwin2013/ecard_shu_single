#ifndef  __T_role_H_
#define  __T_role_H_
typedef struct 
{
		int	roleid;
		char	rolename[60+1];
		char	roledesc[240+1];
		int	createdate;
		char	updtime[14+1];
		int	deleted;
}T_t_role;
int DB_t_role_add(T_t_role *pt_role);
int DB_t_role_read_by_roleid(int v_roleid,T_t_role *pt_role);
int DB_t_role_update_by_roleid(int v_roleid,T_t_role *pt_role);
int DB_t_role_del_by_roleid(int v_roleid);
int DB_t_role_read_lock_by_c0_and_roleid(int v_roleid,T_t_role *pt_role);
int DB_t_role_update_lock_by_c0(T_t_role *pt_role);
int DB_t_role_del_lock_by_c0();
int DB_t_role_free_lock_by_c0();
#endif
