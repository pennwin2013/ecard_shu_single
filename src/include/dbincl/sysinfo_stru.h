#ifndef  __T_sysinfo_H_
#define  __T_sysinfo_H_
typedef struct 
{
		int	paraid;
		char	paraname[256+1];
		char	paraval[2048+1];
		int	setflag;
		int	displayflag;
		int	valtype;
		int	dicttype;
		char	paradesc[1000+1];
}T_t_sysinfo;
int DB_t_sysinfo_add(T_t_sysinfo *pt_sysinfo);
int DB_t_sysinfo_del_by_paraid(int v_paraid);
int DB_t_sysinfo_read_by_paraid(int v_paraid,T_t_sysinfo *pt_sysinfo);
int DB_t_sysinfo_read_lock_by_cur_and_paraid(int v_paraid,T_t_sysinfo *pt_sysinfo);
int DB_t_sysinfo_update_by_paraid(int v_paraid,T_t_sysinfo *pt_sysinfo);
int DB_t_sysinfo_update_lock_by_cur(T_t_sysinfo *pt_sysinfo);
int DB_t_sysinfo_free_lock_cur();
#endif
