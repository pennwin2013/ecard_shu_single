#ifndef  __T_wctrldtl_H_
#define  __T_wctrldtl_H_
typedef struct 
{
		int	id;
		char	devphyid[20+1];
		int	shopid;
		int	sumamt;
		int	amount;
		char	batchno[20+1];
		char	accdate[8+1];
		char	acctime[6+1];
		int	termid;
		int	termseqno;
		int	status;
		int	errcode;
		char	remark[240+1];
}T_t_waterctrldtl;
int DB_t_waterctrldtl_add(T_t_waterctrldtl *pt_waterctrldtl);
int DB_t_waterctrldtl_read_by_id(int v_id,T_t_waterctrldtl *pt_waterctrldtl);
int DB_t_waterctrldtl_update_by_id(int v_id,T_t_waterctrldtl *pt_waterctrldtl);
int DB_t_waterctrldtl_del_by_id(int v_id);
int DB_t_waterctrldtl_read_lock_by_c0_and_id(int v_id,T_t_waterctrldtl *pt_waterctrldtl);
int DB_t_waterctrldtl_update_lock_by_c0(T_t_waterctrldtl *pt_waterctrldtl);
int DB_t_waterctrldtl_del_lock_by_c0();
int DB_t_waterctrldtl_free_lock_by_c0();
#endif
