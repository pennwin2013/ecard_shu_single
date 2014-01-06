#include <sstream>
#include "config_imp.h"
#include "ConfigFile.h"
#include "pubfunc.h"
#include "banktrans.h"
#include "logger_imp.h"


ST_BANK_CONFIG g_Bank;

namespace banktrans
{
///////////////////////////////////////////////////////////////////////////

static int read_bankbu_cfg( ConfigFile& config, ST_BANK_CONFIG& t_bank, const string& buname )
{
  int i = t_bank.BankCount;
  LOG( DEBUG, "load bank config name[" << buname << "]" );
  string bankip;
  bankip = config.read<string>( buname + ".BANK_IP", "127.0.0.1" );
  des2src( t_bank.BankUnit[i].szBankIP, bankip.c_str() );
  t_bank.BankUnit[i].iBankID = config.read<int>( buname + ".BANK_ID", 1 );
  t_bank.BankUnit[i].iBankPort = config.read<int>( buname + ".BANK_PORT", 5301 );
  t_bank.BankUnit[i].iBankTimeout = config.read<int>( buname + ".BANK_DELAY_TIME", 5000 );
  t_bank.BankUnit[i].iAuthMode = config.read<int>( buname + ".AUTH_MODE", 1 );
  string bank_account_no;
  bank_account_no = config.read<string>( buname + ".BANK_ACCOUNT_NO", "2011" );
  des2src( t_bank.BankUnit[i].szBankAccountNO, bank_account_no.c_str() );

  string bank_card_range = config.read<string>( buname + ".BANK_CARD_RANGE" );

  istringstream cardlist( bank_card_range );
  int j = 0;
  while( !cardlist.eof() && cardlist.str().find( ',' ) >=0  )
  {
    string bankheader;
    getline( cardlist, bankheader, ',' );
    if(bankheader.empty())
    	break;
    des2src( t_bank.BankUnit[i].szBankCardRange[j], bankheader.c_str() );
    ++j;
    LOG(DEBUG,"bank["<<buname<<"]card header :"<<bankheader.c_str());
    if( j >= MAX_RANGE )
      return 0;
  }
  return 0;
}

static int ReadIni_bank( ST_BANK_CONFIG* p_bankini )
{
  ST_BANK_CONFIG t_bank;

  memset( &t_bank, 0, sizeof t_bank );

  try
  {
    ConfigFile config( "./trans.ini" );
    t_bank.TIMEOUT = config.read<int>( "TIMEOUT", 5 );
    t_bank.AUTH_MODE = config.read<int>( "AUTH_MODE", 1 );
    string compacc_time = config.read<string>( "COMPACC_TIME", "06" );
    des2src( t_bank.COMPACC_TIME, compacc_time.c_str() );
    t_bank.LOGIN_MODE = config.read<int>( "LOGIN_MODE", 1 );
    t_bank.LOG_MODE = config.read<int>( "LOG_MODE", 0 );
    string serv_time = config.read<string>( "SERV_TIME", "060000-235959" );
    des2src( t_bank.SERV_TIME, serv_time.c_str() );

    string bank_bu;
    config.readInto( bank_bu, "BANK_UNIT" );
    istringstream bulist( bank_bu );
    t_bank.BankCount = 0;
    LOG( DEBUG, "bank list : " << bank_bu );
    while( !bulist.eof() && bulist.str().find( ',' ) >= 0 )
    {
      string buname;
      getline( bulist, buname, ',' );
      if(buname.empty())
      	break;
      if( read_bankbu_cfg( config, t_bank, buname ) )
      {
        LOG( ERROR, "read trans.ini error" );
        return -1;
      }
      t_bank.BankCount++;
    }

  }
  catch( ... )
  {
    LOG( ERROR, "cannot read trans.ini" );
    return -1;
  }
  memcpy( p_bankini, &t_bank, sizeof( t_bank ) );
  return 0;
}

static int b_load_cfg = 0;

static int LoadBankConfig()
{

  memset( &g_Bank, 0, sizeof g_Bank );
  int ret = ReadIni_bank( &g_Bank );
  if( ret )
  {
    LOG( ERROR, "加载圈存配置失败" );
    return -1;
  }
  LOG( DEBUG, "加载圈存配置成功，BankCount=" << g_Bank.BankCount );
  b_load_cfg = 1;
  return 0;
}

int BankQuery( INNER_TRANS_REQUEST* pNode )
{
  if( !b_load_cfg )
  {
    LoadBankConfig();
  }
  int ret = 0;
  double bank_balance = 0;
  char device_id[10 + 1] = "";
  char card_id[12 + 1] = "";
  char bankcard_no[30 + 1] = "";
  char card_pwd[6 + 1] = "";

  //判断设备是否登录
  des2src( card_id, pNode->CardNo );
  des2src( device_id, pNode->TerminalId );
  des2src( bankcard_no, pNode->BankCardNo );
  des2src( card_pwd, pNode->AccountPwd );


  //发送银行查询余额申请包
  ret = Bank_QueryBalance( pNode, &bank_balance );
  if( ret )
  {
    LOG( INFO, "Bank_QueryBalance error!card_id=[" << card_id << "],bankcard_id=[" << bankcard_no << "]" );
    return ret;
  }
  //sprintf(pNode->Balance,"%.2f",bank_balance);

  LOG( INFO, "Query bank card balance succeed!Balance=[" << pNode->Balance << "]" );
  return 0;
}
int BankTransfer( INNER_TRANS_REQUEST* pNode )
{
  if( !b_load_cfg )
  {
    LoadBankConfig();
  }
  int ret = 0;
  //	double bank_balance=0;
  char device_id[10 + 1] = "";
  char card_id[12 + 1] = "";
  char bankcard_no[30 + 1] = "";
  char card_pwd[6 + 1] = "";
  int	cur_serial_no = 0;
  des2src( card_id, pNode->CardNo );
  des2src( device_id, pNode->TerminalId );
  des2src( bankcard_no, pNode->BankCardNo );
  des2src( card_pwd, pNode->AccountPwd );
	LOG(DEBUG,"BankTransfer bankcardno="<<bankcard_no);

  //循环操作，从配置文件中判断上传银行卡号对应的银行以及对应的银行科目帐号
  int flag = 0;
  for( int i = 0; i <= g_Bank.BankCount; i++ )
  {

    if( i == g_Bank.BankCount )
    {
      LOG( ERROR, "E_TRANS_BANK_CARD_NONSUPPORT,i=[" << i << "]!g_Bank.BankCount=[" << g_Bank.BankCount << "]" );
      return E_TRANS_BANK_CARD_NONSUPPORT;
    }
    for( int j = 0; j < MAX_RANGE; j++ )
    {
      //printf("i=[%d],j=[%d],bankcard=[%s],range=[%s],len=[%d]]\n",i,j,pNode->BankCardNo,g_Bank.BankUnit[i].szBankCardRange[j],strlen(g_Bank.BankUnit[i].szBankCardRange[j]));
      if( 0 == strlen( g_Bank.BankUnit[i].szBankCardRange[j] ) )	break;
      if( 0 == memcmp( pNode->BankCardNo, g_Bank.BankUnit[i].szBankCardRange[j]
                       , strlen( g_Bank.BankUnit[i].szBankCardRange[j] ) ) )
      {
        flag = 1;
        g_Bank.cur_bankid = i;
        break;
      }
    }
    if( flag == 1 )
      break;
  }



  //调用银行接口函数,按照不同的银行转帐接口发送报文并接受应答
  //该函数为通用结构,不同银行接口按照该函数名进行封装转帐报文
  //
  cur_serial_no = pNode->SendNo;
  ret = Bank_Transfer( pNode, cur_serial_no );
  if( ret )
  {
    LOG( ERROR, "Bank_Transfer error,errcode=[" << ret << "]" );
    if( E_TRANS_BANK_NOANSWER == ret )			//如果银行没有返回包，进行冲正处理
    {

      return E_TRANS_BANK_NOANSWER;
    }
    else
    {
      return ret;
    }
  }

  pNode->MngFeeFlag = 1;
  //writelog(LOG_INFO,"transfer succeed!");
  return 0;
}



///////////////////////////////////////////////////////////////////////////
}

