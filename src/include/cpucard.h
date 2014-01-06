#ifndef _CPUCARD_H_
#define _CPUCARD_H_

#include <sys/types.h>

#define uint32 unsigned int
#define uint16 unsigned short
#define int32 int
#define int16 short
#define uint8 unsigned char

typedef struct
{
  int trade_type; // 0 Ȧ�� 1����
  size_t befcardbal; // �뿨ֵ
  size_t tradeamt; // ���׽��
  size_t tradecnt; // ���״���
  char tx_datetime[15]; // ��������+ʱ��
  char random_key[9]; // �����
  char  termno[13]; // �ն˺�
  size_t termsno; // �ն˽������
  char  cardphyid[17];  //������
  unsigned char sk[9];  // ������Կ
  char mac1[9]; // mac1
  char mac2[9]; // mac2
  int card_type; // ������M1 , CPU , SIM
} cpu_trade_t;

size_t cpu_hex2str(const uint8* hex, size_t len, char* str);
size_t cpu_str2hex(const char* str, size_t len, uint8* hex);
size_t cpu_str2bcd(const char* str, size_t len, uint8* bcd);

/**
 * @brief ���������Կ
 *
 * @param key - ����Կ
 * @param trade - ������Ϣ
 *
 * @return - 0 ��ʾ�ɹ�
 */
int cpu_calc_sk(const char* key, cpu_trade_t* trade);
/**
 * @brief ���� MAC1
 *
 * @param trade
 *
 * @return - 0 ��ʾ�ɹ�
 */

unsigned char* pboc_diver_key(unsigned char cardno[9], unsigned char key_in[17], unsigned char key_out[17]);
int cpu_calc_mac(cpu_trade_t* trade);

int encrypt_workkey(unsigned char* text, unsigned char* mtext);
int decrypt_workkey(unsigned char* mtext, unsigned char* text);
int delivery_key(unsigned char* key, unsigned char* out_key);


class pboc_trans_mac
{
public:
  pboc_trans_mac();
  ~pboc_trans_mac();
  int calc_trans_mac(cpu_trade_t& trade);
private:
  pboc_trans_mac(const pboc_trans_mac&);
  pboc_trans_mac& operator=(const pboc_trans_mac&);

  int calc_sk(cpu_trade_t& trade, unsigned char* sk);
  int calc_mac1(cpu_trade_t& trade,char* mac1);
  int check_mac1(cpu_trade_t& trade);
  int calc_mac2(cpu_trade_t& trade);

  char card_key_[33];
};

//int cpu_calc_mac1(cpu_trade_t *trade);
#endif //  _CPUCARD_H_

