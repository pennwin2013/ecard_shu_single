#ifndef  __T_keycards_H_
#define  __T_keycards_H_
typedef struct 
{
		int	cardid;
		char	cardphyid[16+1];
		char	pin[16+1];
		int	keygroup;
		char	issuedate[8+1];
		char	issuetime[6+1];
		char	opercode[10+1];
		int	delflag;
		char	remark[240+1];
}T_t_keycards;
int DB_t_keycards_add(T_t_keycards *pt_keycards);
int DB_t_keycards_read_by_cardid(int v_cardid,T_t_keycards *pt_keycards);
int DB_t_keycards_update_by_cardid(int v_cardid,T_t_keycards *pt_keycards);
#endif
