#ifndef  __T_term_H_
#define  __T_term_H_
typedef struct 
{
		int	termid;
		int	termseqno;
		int	checknum;
		int	shopid;
		char	refno[20+1];
}T_t_term;
int DB_t_term_add(T_t_term *pt_term);
int DB_t_term_read_by_termid(int v_termid,T_t_term *pt_term);
int DB_t_term_read_lock_by_c0_and_termid(int v_termid,T_t_term *pt_term);
int DB_t_term_update_lock_by_c0(T_t_term *pt_term);
int DB_t_term_free_lock_by_c0();
int DB_t_term_update_by_termid(int v_termid,T_t_term *pt_term);
int DB_t_term_del_by_termid(int v_termid);
#endif
