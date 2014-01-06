#ifndef  __T_wctrlamt_H_
#define  __T_wctrlamt_H_
typedef struct 
{
		char	devphyid[20+1];
		int	lastamt;
		char	lastdate[8+1];
		int	sumamt;
		char	upddate[8+1];
}T_t_waterctrlamt;
int DB_t_waterctrlamt_add(T_t_waterctrlamt *pt_waterctrlamt);
int DB_t_waterctrlamt_read_by_devphyid(const char *v_devphyid,T_t_waterctrlamt *pt_waterctrlamt);
int DB_t_waterctrlamt_update_by_devphyid(char *v_devphyid,T_t_waterctrlamt *pt_waterctrlamt);
int DB_t_waterctrlamt_del_by_devphyid(const char *v_devphyid);
int DB_t_waterctrlamt_read_lock_by_c0_and_devphyid(const char *v_devphyid,T_t_waterctrlamt *pt_waterctrlamt);
int DB_t_waterctrlamt_update_lock_by_c0(T_t_waterctrlamt *pt_waterctrlamt);
int DB_t_waterctrlamt_del_lock_by_c0();
int DB_t_waterctrlamt_free_lock_by_c0();
#endif
