/* --------------------------------------------
 * ��������: 2010-06-17
 * ��������: �Ž�
 * �汾��Ϣ: 3.0.0.0
 * ������: �����״�����ģ��
 * --------------------------------------------*/
#ifndef TRANSFUNC_H_
#define TRANSFUNC_H_
#include "pubdb.h"
int StopBalance();
int Startup();
int CheckCardCntExist(int cardno,int cardcnt,char *transdate);
int UpdateCardBitmap(int cardno,int cardcnt,char type);
//int Cpack2Posdtl(ST_PACK *rPack,T_t_posdtl& posdtl);
int UpdPosdtlStatusByRowid(char *rowid,int errcode,char *status);
int UpdBusdtlStatusByRowid(char *rowid,int errcode,char *status);
int UpdPosdtlInvalidStatusByRowid(char *rowid,int errcode);
int UpdPosdtlStatus(char *transdate,char *devphyid,int devseqno,int errcode,char *status);
int UpdCardBalByAccno(char *accno,double cardbal,int transflag,int cardcnt,int revflag,int offlineflag);
int UpdateTransdtlCurRevFlag(char *accdate,int termid,int termseqno);
int UpdateTransdtlHisRevFlag(const char *transdtlname,const char *accdate, int termid, int termseqno);
int UpdateTransdtlRevFlag(char *accdate,int termid,int termseqno);
//����ʧ����ˮ
//������;�ο�����ʧ����ˮ
int SaveConsumeFailTransdtl(T_t_posdtl& posdtl);
//����������ˮ
int SaveLockCardTransdtl(T_t_posdtl& posdtl);
//��������ȡ��
int PosTransCancelProcess(T_t_posdtl& posdtl);
//�ѻ�����
int PosOfflineTransProcess(T_t_posdtl& posdtl);
int UpdAllUnGetSubsidy(int cardno);

int OnlineTransRev(char *oldaccdate,int oldtermid,int oldtermseqno);
int AccTransRev(const char *oldaccdate, const char *oldrefno,const char* remark );
int GetTransPackStatus(char *packetid,char *reqid,T_t_transpack* transpack);
int UpdTranspackStatus(char *packetid,char *reqid,const T_t_transpack& transpack);
int SaveCardTransInfo();
int CalcPrestoreFee(int feetype, int transamt, int* feeamt);
int MoveAccBal2Frozebal(char* accno,int amount);
int CalcTransFee(int feetype, int cardtype,int transcode,int freefeeflag,int& feeamt,char *feeinfo);
int MoveAccForegift(const char* outaccno,const char* inaccno);
int CalcDpsFee(int feetype,int amount, int& dpsfee);
#endif
