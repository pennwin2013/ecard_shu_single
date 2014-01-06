#ifndef  __T_posdata_H_
#define  __T_posdata_H_
typedef struct 
{
		int	id;
		int	senderid;
		char	sendercode[10+1];
		char	posphyid[20+1];
		int	posseqno;
		char	merchno[15+1];
		char	termno[12+1];
		int	transdate;
		int	transtime;
		int	cardno;
		int	paycnt;
		int	cardbefbal;
		int	cardaftbal;
		int	reversed;
		int	payamt;
		int	feeamt;
		int	amount;
		int	datatype;
		int	sendtype;
		int	withpasswd;
		int	updresult;
		char	tac[8+1];
		char	mac[8+1];
		char	recvtime[14+1];
		char	refno[20+1];
		int	igntime;
		int	igncnt;
		int	status;
		int	errcode;
		char	remark[240+1];
}T_t_posdata;
int DB_t_posdata_add(T_t_posdata *pt_posdata);
int DB_t_posdata_read_by_id(int v_id,T_t_posdata *pt_posdata);
int DB_t_posdata_update_by_id(int v_id,T_t_posdata *pt_posdata);
int DB_t_posdata_del_by_id(int v_id);
int DB_t_posdata_read_lock_by_c0_and_id(int v_id,T_t_posdata *pt_posdata);
int DB_t_posdata_update_lock_by_c0(T_t_posdata *pt_posdata);
int DB_t_posdata_del_lock_by_c0();
int DB_t_posdata_free_lock_by_c0();
#endif
