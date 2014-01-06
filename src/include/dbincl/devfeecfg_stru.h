#ifndef  __T_devfeecfg_H_
#define  __T_devfeecfg_H_
typedef struct 
{
		int	deviceid;
		int	feecfgid;
		int	cfgverno;
		int	devcfgverno;
		char	devupdtime[14+1];
}T_t_devfeecfg;
int DB_t_devfeecfg_add(T_t_devfeecfg *pt_devfeecfg);
int DB_t_devfeecfg_del_by_deviceid(int v_deviceid);
int DB_t_devfeecfg_read_lock_by_c0_and_deviceid(int v_deviceid,T_t_devfeecfg *pt_devfeecfg);
int DB_t_devfeecfg_update_lock_by_c0(T_t_devfeecfg *pt_devfeecfg);
int DB_t_devfeecfg_free_lock_by_c0();
int DB_t_devfeecfg_read_by_deviceid(int v_deviceid,T_t_devfeecfg *pt_devfeecfg);
int DB_t_devfeecfg_update_by_deviceid(int v_deviceid,T_t_devfeecfg *pt_devfeecfg);
#endif
