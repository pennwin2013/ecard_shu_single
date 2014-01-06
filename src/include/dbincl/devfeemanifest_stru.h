#ifndef  __T_devfeemanifest_H_
#define  __T_devfeemanifest_H_
typedef struct 
{
		int	feecfgid;
		char	feecfgname[255+1];
		int	cfgverno;
		char	crttime[14+1];
		char	updtime[14+1];
		int	globalflag;
}T_t_devfeemanifest;
int DB_t_devfeemanifest_add(T_t_devfeemanifest *pt_devfeemanifest);
int DB_t_devfeemanifest_del_by_feecfgid(int v_feecfgid);
int DB_t_devfeemanifest_read_lock_by_c0_and_feecfgid(int v_feecfgid,T_t_devfeemanifest *pt_devfeemanifest);
int DB_t_devfeemanifest_update_lock_by_c0(T_t_devfeemanifest *pt_devfeemanifest);
int DB_t_devfeemanifest_free_lock_by_c0();
int DB_t_devfeemanifest_read_by_feecfgid(int v_feecfgid,T_t_devfeemanifest *pt_devfeemanifest);
#endif
