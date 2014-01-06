#include "cpucard.h"
#include "gnudes.h"
#include "errdef.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "pubfunc.h"
#include "logger_imp.h"
#include "pubdb.h"
#include "pubdef.h"
#include "pubfunc.h"
#include "dbfunc.h"
#include "dbfunc_foo.h"
#include "acctrans.h"
#include "gnudes.h"


size_t cpu_str2hex(const char* str, size_t len, uint8* hex)
{
  char temp[3];
  size_t i;
  memset(temp, 0, sizeof temp);
  for(i = 0; i < len; i += 2)
  {
    memcpy(temp, str + i, 2);
    hex[i / 2] = (uint8)strtoul(temp, NULL, 16);
  }
  return i / 2;
}
size_t cpu_hex2str(const uint8* hex, size_t len, char* str)
{
  size_t i, j;
  for(i = 0, j = 0; i < len; ++i)
    j += sprintf(str + j, "%02X", hex[i]);
  return j;
}
size_t cpu_str2bcd(const char* str, size_t len, uint8* bcd)
{
  size_t i;
  for(i = 0; i < len; i += 2)
  {
    bcd[i / 2] = ((str[i] - 0x30) << 4) & 0xF0;
    bcd[i / 2] |= (str[i + 1] - 0x30) & 0xF0;
  }
  return len / 2;
}
unsigned char* pboc_diver_key(unsigned char cardno[9], unsigned char key_in[17], unsigned char key_out[17])
{
  int i;
  unsigned char tmp1[20], tmp2[20];
  unsigned char ret1[20], ret2[20];

  memset(tmp1, 0x00, sizeof tmp1);
  memset(tmp2, 0x00, sizeof tmp2);
  memset(ret1, 0x00, sizeof ret1);
  memset(ret2, 0x00, sizeof ret2);

  memcpy(tmp1, cardno, 8);
  for(i = 0; i < 8; i++)
  {
    tmp2[i] = ~tmp1[i];
  }
  des3_context d3ctx;
  des3_set_2keys(&d3ctx, key_in, key_in + 8);
  des3_encrypt(&d3ctx, tmp1, ret1);
  des3_encrypt(&d3ctx, tmp2, ret2);
  memcpy(key_out,   ret1, 8);
  memcpy(key_out + 8, ret2, 8);
  return key_out;
}

int cpu_calc_sk(const char* key, cpu_trade_t* trade)
{
  char des_data[16];
  uint8 hexkey[16], hexdata[8];
  int i;
  size_t key_len;
  des_context dctx;
  des3_context d3ctx;
  if(trade->tradecnt > 0xFFFF)
  {
    return E_INPUT_ERROR;
  }
  if(trade->termsno > 0xFFFF)
    return E_INPUT_ERROR;
  //LOG(INFO,"key["<<key<<"]");
  key_len = strlen(key);
  if(key_len != 32 && key_len != 16)
  {
    LOG(ERROR, "key[" << key << "]keylen[" << key_len << "]");
    return E_INPUT_ERROR;
  }
  if(trade->trade_type == 0)
  {
    i = sprintf(des_data, "%s%04X8000", trade->random_key, trade->tradecnt);
  }
  else
  {
    i = sprintf(des_data, "%s%04X%04X", trade->random_key, trade->tradecnt, (0xFFFF & trade->termsno));
  }
  LOG(DEBUG, "sk data[" << des_data << "]");
  cpu_str2hex(des_data, i, hexdata);
  key_len = cpu_str2hex(key, key_len, hexkey);
  if(key_len == 16)
  {
    memset(&d3ctx, 0, sizeof d3ctx);
    des3_set_2keys(&d3ctx, hexkey, hexkey + 8);
    des3_encrypt(&d3ctx, hexdata, trade->sk);
    //memset( des_data, 0, sizeof des_data );
    //cpu_hex2str( trade->sk, 8, des_data );
    //  LOG(ERROR,"des data["<<des_data<<"]");
  }
  else
  {
    memset(&dctx, 0, sizeof dctx);
    des_set_key(&dctx, hexkey);
    des_encrypt(&dctx, hexdata, trade->sk);
  }
  return 0;
}

static void cpu_pboc_calc_mac(const char* mac_data, unsigned char* sk, char* sMac)
{
  unsigned char cipher_data[8], xor_data[8];
  unsigned char hex_data[256];
  int i, j, pack;
  des_context ctx;

  memset(cipher_data, 0, sizeof cipher_data);
  i = strlen(mac_data);
  pack = i / 16;
  cpu_str2hex(mac_data, i, hex_data);
  // 3 round des encrypt
  for(j = 0; j < pack; ++j)
  {
    for(i = 0; i < 8; ++i)
    {
      xor_data[i] = cipher_data[i] ^ hex_data[j * 8 + i];
    }
    memset(&ctx, 0, sizeof ctx);
    des_set_key(&ctx, sk);
    des_encrypt(&ctx, xor_data, cipher_data);
  }
  cpu_hex2str(cipher_data, 4, sMac);
}

int cpu_calc_mac(cpu_trade_t* trade)
{
  char mac_data[64];
  char mac1[16] = {0};
  int i;
  char termno[13] = {0};
  i = 0;
  int len = strlen(trade->termno);
  if(len <= 12)
  {
    //����
    memset(termno, '0', 12);
    memcpy(termno + 12 - len, trade->termno, len);
  }
  else
  {
    LOG(ERROR, "termno[" << trade->termno << "]");
    return E_INPUT_ERROR;
  }

  if(strlen(trade->mac1) == 8)
  {
    if(trade->trade_type == 0)
      i = sprintf(mac_data, "%08X%08X02%s80", trade->befcardbal, trade->tradeamt, termno);
    else
      i = sprintf(mac_data, "%08X%08X06%s80", trade->befcardbal, trade->tradeamt, termno);
    cpu_pboc_calc_mac(mac_data, trade->sk, mac1);
    if(strncasecmp(trade->mac1, mac1, 8) != 0)
    {
      LOG(ERROR, "trans mac1 error");
      return E_INPUT_ERROR;
    }
    // ���MAC
  }

  if(trade->trade_type == 0)
    i = sprintf(mac_data, "%08X02%s%s800000000000", trade->tradeamt, termno, trade->tx_datetime);
  else
    i = sprintf(mac_data, "%08X06%s%s800000000000", trade->tradeamt, termno, trade->tx_datetime);


  //  LOG(ERROR,"mac data["<<mac_data<<"]");
  //if(i != 48)
  //  return E_INPUT_ERROR;

  /*
  memset(cipher_data,0,sizeof cipher_data);
  cpu_str2hex(mac_data,i,hex_data);
  // 3 round des encrypt
  for(j = 0;j < 3;++j)
  {
    for(i = 0;i < 8;++i)
    {
      xor_data[i] = cipher_data[i] ^ hex_data[j*8+i];
    }
    memset(&ctx,0,sizeof ctx);
    des_set_key(&ctx,trade->sk);
    des_encrypt(&ctx,xor_data,cipher_data);
  }
  cpu_hex2str(cipher_data,4,trade->mac2);
  */
  cpu_pboc_calc_mac(mac_data, trade->sk, trade->mac2);
  return 0;
}

int cpu_calc_mac1(cpu_trade_t* trade)
{
  return 0;
}

int encrypt_workkey(unsigned char* text, unsigned char* mtext)
{
  static unsigned char statickey[17] = "3230303530313331";
  unsigned int  i;
  unsigned long ul;
  char temp[3];
  unsigned char plain[9];
  unsigned char statkey[9];
  unsigned char outkey[8];

  memset(temp, 0, sizeof(temp));
  memset(plain, 0, sizeof(plain));
  memset(statkey, 0, sizeof(statkey));
  memcpy(plain, text, 8);
  for(i = 0; i < 8; i++)
  {
    memcpy(temp, &statickey[2 * i], 2);
    ul = strtoul(temp, NULL, 16);
    statkey[i] = ul;
    plain[i] = ~plain[i];
    outkey[i] = plain[i] ^ statkey[i];
  }
  memcpy(mtext, outkey, 8);
  return 0;
}
int decrypt_workkey(unsigned char* mtext, unsigned char* text)
{
  static unsigned char statickey[17] = "3230303530313331";
  unsigned int  i;
  unsigned long ul;
  char temp[3];
  unsigned char plain[9];
  unsigned char statkey[9];

  memset(temp, 0, sizeof(temp));
  memset(plain, 0, sizeof(plain));
  memset(statkey, 0, sizeof(statkey));
  memcpy(plain, mtext, 8);
  for(i = 0; i < 8; i++)
  {
    memcpy(temp, &statickey[2 * i], 2);
    ul = strtoul(temp, NULL, 16);
    statkey[i] = ul;
    plain[i] = plain[i] ^ statkey[i];
    text[i] = ~plain[i] ;
  }
  return 0;
}
int delivery_key(unsigned char* key, unsigned char* out_key)
{
  static unsigned char statickey[17] = "3230303530313331";
  des_context des;
  memset(&des, 0, sizeof des);
  des_set_key(&des, key);
  des_encrypt(&des, statickey, out_key);
  return 0;
}

/////////////////////////////////////////////////////////////////////////////////
pboc_trans_mac::pboc_trans_mac()
{
}
pboc_trans_mac::~pboc_trans_mac()
{
}
int pboc_trans_mac::calc_trans_mac(cpu_trade_t& trade)
{
  // 1 ��ȡ����Կ
  int ret;
  char factor[8];
  int phylen = strlen(trade.cardphyid);
  if(phylen < 16)
  {
    // pad 80 00 00
    strcat(trade.cardphyid, "80");
    while(strlen(trade.cardphyid) < 16)
    {
      strcat(trade.cardphyid, "00");
    }
  }
  str2hex(trade.cardphyid, 16, factor);
  memset(card_key_, 0, sizeof card_key_);
  T_t_keys tKeys;
  memset(&tKeys, 0, sizeof tKeys);
  int nKeyID;
  if(trade.card_type < 1)
  {
    ERRTIP("����MAC2ʱ��������������Ϊ��");
    return E_COMMON_ERR;
  }
  if(trade.card_type == CARDPHYTYPE_CPU || trade.card_type == CARDPHYTYPE_CPUMF1)
  {
    if(trade.trade_type == 0)
    {
      //Ȧ��
      nKeyID = DLK1;
    }
    else
    {
      //����
      nKeyID = DPK1;
    }
    ret = DB_t_keys_read_by_keygroup_and_keyid(1, nKeyID, &tKeys);
    if(ret)
    {
      LOG(ERROR, "DB_t_keys_read_by_keyid err[" << ret << "]KeyID[" << nKeyID << "]");
      return ret;
    }
    if(strlen(tKeys.keyval) != 32)
    {
      return E_CARDKEY;
    }
    unsigned char inkey[16], outkey[16];
    str2hex(tKeys.keyval, 32, (char*)inkey);

    // 2 ���㿨��ɢ��Կ

    pboc_diver_key((unsigned char*)factor, inkey, outkey);
    hex2str((char*)outkey, 16, card_key_);
    card_key_[32] = 0;
  }
  else if(trade.card_type == CARDPHYTYPE_RFID)
  {
    // pboc 2 level delivery
    char szUserCode[64] = {0}, temp[64] = {0};
    char szData[256];
    unsigned char uData[256] = {0};
    des3_context ctx;
    int ctAppID, nRet;
    nRet = DB_t_keys_read_by_keygroup_and_keyid(1, DAMK, &tKeys);
    if(nRet)
    {
      LOG(ERROR, "DB_t_keys_read_by_keyid err[" << nRet << "]KeyID[" << DAMK << "]");
      return nRet;
    }
    if(strlen(tKeys.keyval) != 32)
    {
      return E_CARDKEY;
    }
    unsigned char inkey[16], outkey[16];
    str2hex(tKeys.keyval, 32, (char*)inkey);
    nRet = GetSysParaVal(SYSPARA_CMCCENTERPRICECODE, szUserCode);
    if(nRet)
    {
      ERRTIP("δ���ò���[�û����]");
      return E_SYSPARAM_ERROR;
    }
    if(strlen(szUserCode) != 12)
    {
      ERRTIP("����[�û����]���ô���");
      return E_SYSPARAM_ERROR;
    }
    nRet = GetSysParaVal(SYSPARA_CMCCSUBAPPID, temp);
    if(nRet)
    {
      ERRTIP("δ���ò���[Ӧ��ID��]");
      return E_SYSPARAM_ERROR;
    }
    ctAppID = atoi(temp);
    sprintf(szData, "%s%02X00", szUserCode, ctAppID);
    cpu_str2hex(szData, strlen(szData), uData);
    pboc_diver_key(uData, inkey, outkey);
    memcpy(inkey, outkey, 16);
    memset(&ctx, 0 , sizeof ctx);
    des3_set_2keys(&ctx, inkey, inkey + 8);
    memset(outkey, 0, sizeof outkey);
    des3_encrypt(&ctx, (unsigned char*)factor, outkey);

    memcpy(factor, outkey, 8);
    str2hex(tKeys.keyval, 32, (char*)inkey);
    pboc_diver_key(uData, inkey, outkey);
    memcpy(inkey, outkey, 16);
    memset(&ctx, 0 , sizeof ctx);
    des3_set_2keys(&ctx, inkey, inkey + 8);
    memset(outkey, 0, sizeof outkey);
    des3_encrypt(&ctx, (unsigned char*)factor, outkey);

    hex2str((char*)outkey, 16, card_key_);
    card_key_[16] = 0;
    LOG(INFO, "Card key:" << card_key_);
  }
  else if(trade.card_type == CARDPHYTYPE_MF1)
  {
    // ����2006 ��Կ
    char keyhex[64];
    ret = GetSysParaVal(GLOBLE_SYSPARA_STATIC_KEY, keyhex);
    if(ret)
    {
      LOG(ERROR, "GetSysParaVal error,ret=" << ret);
      return ret;
    }
    unsigned char mkey[8], key[8];
    str2hex(keyhex, 16, (char*)mkey);
    decrypt_workkey(mkey, key);

    // 2 ���㿨��ɢ��Կ
    des_context ctx;
    memset(&ctx, 0, sizeof ctx);
    des_set_key(&ctx, key);
    unsigned char outkey[8];
    des_encrypt(&ctx, (unsigned char*)factor, outkey);
    hex2str((char*)outkey, 8, card_key_);
    card_key_[16] = 0;
    //LOG(DEBUG, "cardkey["<<card_key_<<"]");

  }
  else
  {
    LOG(ERROR, "��֧�ֵĿ�����" << trade.card_type << "�㷨");
    return E_COMMON_ERR;
  }

  // 3 ���ݿ��������ͼ�����Կ
  unsigned char sk[8];
  memset(sk, 0, sizeof sk);
  ret = calc_sk(trade, sk);
  if(ret)
  {
    return E_CARDKEY;
  }
  if(trade.trade_type == 0) // load
  {
    // 4 ��֤MAC1
    ret = check_mac1(trade);
    if(ret)
    {
      ERRTIP("��֤MAC1ʧ��!");
      LOG(ERROR, "��֤MAC1ʧ��!ret=" << ret);
      return E_COMMON_ERR;
    }

    // 5 ����MAC2
    ret = calc_mac2(trade);
    if(ret)
    {
      LOG(ERROR, "����MAC2ʧ��");
      return -1;
    }
  }
  else 
  {
    ret = calc_mac1(trade, trade.mac1);
    if(ret)
    {
      LOG(ERROR, "����MAC1ʧ��");
      return -1;
    }
  }
  return 0;

}

int pboc_trans_mac::calc_sk(cpu_trade_t& trade, unsigned char* sk)
{
  int ret = cpu_calc_sk(card_key_, &trade);
  if(ret)
  {
    return -1;
  }
  memcpy(sk, trade.sk, 8);
  char sk_hex[32] = {0};
  hex2str((char*)sk, 8, sk_hex);
  //LOG( DEBUG, "sk is : " << sk_hex );
  return 0;
}

int pboc_trans_mac::check_mac1(cpu_trade_t& trade)
{
  char mac_data[64];
  int mac_data_len = 0;
  if(trade.trade_type == 0)
    mac_data_len = sprintf(mac_data, "%08X%08X02%s80", trade.befcardbal, trade.tradeamt, trade.termno);
  else
    mac_data_len = sprintf(mac_data, "%08X%08X06%s80", trade.befcardbal, trade.tradeamt, trade.termno);
  char mac1[9] = {0};
  cpu_pboc_calc_mac(mac_data, trade.sk, mac1);
  //LOG( DEBUG, "MAC DATA[" << mac_data << "]" << mac1 );
  if(strncasecmp(trade.mac1, mac1, 8) != 0)
  {
    LOG(ERROR, "trans mac1 error");
    return E_INPUT_ERROR;
  }
  return 0;
}
int pboc_trans_mac::calc_mac1(cpu_trade_t& trade, char* mac1)
{
  char mac_data[64];
  int mac_data_len = 0;
  if(trade.trade_type == 0)
    mac_data_len = sprintf(mac_data, "%08X%08X02%s80", trade.befcardbal, trade.tradeamt, trade.termno);
  else
  {
    mac_data_len = sprintf(mac_data, "%08X06%s%s800000000000", trade.tradeamt, trade.termno, trade.tx_datetime);
    LOG(ERROR,"Mac1 Data:[" << mac_data << "]");
  }
  cpu_pboc_calc_mac(mac_data, trade.sk, mac1);
  return 0;
}
int pboc_trans_mac::calc_mac2(cpu_trade_t& trade)
{
  char mac_data[64];
  int mac_data_len = 0;
  if(trade.trade_type == 0)
    mac_data_len = sprintf(mac_data, "%08X02%s%s800000000000",
                           trade.tradeamt, trade.termno, trade.tx_datetime);
  else
    mac_data_len = sprintf(mac_data, "%08X06%s%s800000000000",
                           trade.tradeamt, trade.termno, trade.tx_datetime);

  cpu_pboc_calc_mac(mac_data, trade.sk, trade.mac2);
  return 0;
}


