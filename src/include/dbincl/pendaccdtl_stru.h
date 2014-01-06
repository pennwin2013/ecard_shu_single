#ifndef  __T_pendaccdtl_H_
#define  __T_pendaccdtl_H_
typedef struct 
{
		char	refno[20+1];
		int	seqno;
		char	accdate[8+1];
		char	subjno[10+1];
		char	oppsubjno[10+1];
		char	draccno[10+1];
		char	craccno[10+1];
		double	amount;
		char	summary[60+1];
		int	posted;
}T_t_pendaccdtl;
int DB_t_pendaccdtl_add(T_t_pendaccdtl *pt_pendaccdtl);
int DB_t_pendaccdtl_read_by_refno_and_seqno(const char *v_refno,int v_seqno,T_t_pendaccdtl *pt_pendaccdtl);
int DB_t_pendaccdtl_update_by_refno_and_seqno(char *v_refno,int v_seqno,T_t_pendaccdtl *pt_pendaccdtl);
int DB_t_pendaccdtl_del_by_refno_and_seqno(const char *v_refno,int v_seqno);
int DB_t_pendaccdtl_read_lock_by_c0_and_refno_and_seqno(const char *v_refno,int v_seqno,T_t_pendaccdtl *pt_pendaccdtl);
int DB_t_pendaccdtl_update_lock_by_c0(T_t_pendaccdtl *pt_pendaccdtl);
int DB_t_pendaccdtl_del_lock_by_c0();
int DB_t_pendaccdtl_free_lock_by_c0();
int DB_t_pendaccdtl_open_select_by_c1_and_refno(const char *v_refno);
int DB_t_pendaccdtl_fetch_select_by_c1(T_t_pendaccdtl *pt_pendaccdtl);
int DB_t_pendaccdtl_close_select_by_c1();
#endif
