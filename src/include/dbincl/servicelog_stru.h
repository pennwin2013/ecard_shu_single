#ifndef  __T_servicelog_H_
#define  __T_servicelog_H_
typedef struct 
{
		int	settledate;
		char	servicename[60+1];
		char	starttime[14+1];
}T_t_servicelog;
int DB_t_servicelog_add(T_t_servicelog *pt_servicelog);
int DB_t_servicelog_read_by_settledate_and_servicename(int v_settledate,const char *v_servicename,T_t_servicelog *pt_servicelog);
int DB_t_servicelog_update_by_settledate_and_servicename(int v_settledate,char *v_servicename,T_t_servicelog *pt_servicelog);
int DB_t_servicelog_del_by_settledate_and_servicename(int v_settledate,const char *v_servicename);
int DB_t_servicelog_read_lock_by_c0_and_settledate_and_servicename(int v_settledate,const char *v_servicename,T_t_servicelog *pt_servicelog);
int DB_t_servicelog_update_lock_by_c0(T_t_servicelog *pt_servicelog);
int DB_t_servicelog_del_lock_by_c0();
int DB_t_servicelog_free_lock_by_c0();
#endif
