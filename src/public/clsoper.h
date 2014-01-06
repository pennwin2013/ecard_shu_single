#ifndef CLSOPER_H_
#define CLSOPER_H_
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "errdef.h"
#include "pubdb.h"
#include "pubdef.h"
#include "pubfunc.h"
#include "dbfunc.h"

namespace ekingstar
{
  typedef struct
  {
	int  branchno;	//����Ա�����
  	int	 operid;
    int  operseqno; 	//����Ա��ˮ��
    char opercode[21];	//����Ա��
    int  transcode; 	//������
    char refno[21]; 	//���ײο���
    int  checknum;		//У���
    int  revflag;		//0-��������1-��������
    int  termid;		//�ն˱��
    int  termsno;		//�ն˷��ͷ���ˮ��
    int  termseqno; 	//�ն�������ˮ��
	char termdate[9];
	char termtime[7];
    char reqflag[2];
    char chkopercode[21];//��˲���Ա
    int  offlineflag;	//�Ƿ���������1-�ѻ�����0-��������
    int  usecardflag;	//1�뿨�й�ϵ�Ľ���0-�뿨�޹�ϵ�Ľ���
    int  cardtype;		//������
    int  cardphytype;	//����������
    int  cardphytypecode;//���������ʹ���
    char cardphyid[17]; //������
    char cardpwd[9];	//������
    char expiredate[9];	//��Ч��
    int  cardno;		//����
    int  amount;		//�ܽ��
    int  dpscnt;		//����ֵ����
    int  paycnt;		//�����Ѵ���
    int  aftdpscnt; 	//����ֵ�����
    int  aftpaycnt; 	//�����Ѻ����
    int  transflag; 	//�������ͣ�1��ֵ2����
    int  dpsamt;		//��ֵ���
    int  feeamt;
    int  cardbefbal;	//����ǰ�����
    int  cardaftbal;	//���׺����
    char showcardno[11];//��ʾ����
    int  feetype;		//���շ�����
    int  custid;		//�ͻ���
    char custname[61];	//�ͻ���
    char stuempno[21];	//ѧ����
    char deptcode[31];	//���ź�
    int  shopid;		//�̻���
    char cardaccno[11]; //���ʻ���
    char eaccno[11];	//����Ǯ���˺�
    char shopaccno[11]; //�̻��˺�
    char draccno[21];	//����ֵ:�跽�˺�
    char craccno[21];	//����ֵ:�����˺�
    int  fundtype;		//�ʽ����� 1-�ֽ�2-֧Ʊ3-���ѱ�4-�����ʻ����5-���д��
    char voucherno[21]; //ƾ֤��
    char drsubjno[21];	//���ֵ:�跽��Ŀ
    char crsubjno[21];	//���ֵ:������Ŀ
    char draccname[61]; //���ֵ:�跽�˻���
    char craccname[61]; //���ֵ:�����˻���
    int  transtype; 		//��������
    int  subseqno;			//����ˮ��
    double	inputamt;		//������
    double	transamt;		//���׽��
    double	addamt; 		//��д���
    double	unusedamt;		//ʣ����
    double	totalfeeamt;	//���շѽ��(���)
    double	totaltransamt;	//�ܽ��׽��(���)
    double	forgift;		//Ѻ����
    char summary[61];		//ժҪ
    int  errcode;			//������
    char remark[241];		//��ע
  } REQPACK;
  class COper
  {
  private:
    T_t_operator oper;
    bool bLock;
    bool bLoad;
//    const TRANS& m_req;	
	T_t_operdtl  m_operdtl;
  public:  	
	COper();
    ~COper();
    int loadOper(bool update = false);
    T_t_operator& getOper();
	void attach(const REQPACK& req);
    int getOperid();
    int check(bool unlimited = false);
    int update();
	int setOffline();
    int confirmOK();
    int confirmCancel();
    int confirmFailed();
	int  saveOperdtl(int transstatus=TRANSTATUS_INIT);
	int findOrgiOperdtl();	
	T_t_operdtl& getOperdtl();
  };
}
#endif
