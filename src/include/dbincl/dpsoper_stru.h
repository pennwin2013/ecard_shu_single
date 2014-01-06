#ifndef  __T_dpsoper_H_
#define  __T_dpsoper_H_
typedef struct 
{
		int	operid;
		char	status[1+1];
		char	devlimitflag[1+1];
		char	shopoperflag[1+1];
		char	opendate[8+1];
		char	closedate[8+1];
		double	maxdepositamt;
		int	depositcnt;
		double	depositamt;
		char	lasttransdate[8+1];
		char	lastdevphyid[30+1];
		int	lastdevseqno;
		char	lastsaved[30+1];
		int	batchno;
		int	authcode;
		char	devphyid[20+1];
}T_t_dpsoper;
int DB_t_dpsoper_add(T_t_dpsoper *pt_dpsoper);
int DB_t_dpsoper_read_by_operid(int v_operid,T_t_dpsoper *pt_dpsoper);
int DB_t_dpsoper_update_by_operid(int v_operid,T_t_dpsoper *pt_dpsoper);
int DB_t_dpsoper_del_by_operid(int v_operid);
int DB_t_dpsoper_read_lock_by_c0_and_operid(int v_operid,T_t_dpsoper *pt_dpsoper);
int DB_t_dpsoper_update_lock_by_c0(T_t_dpsoper *pt_dpsoper);
int DB_t_dpsoper_free_lock_by_c0();
#endif
