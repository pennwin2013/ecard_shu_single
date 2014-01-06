
#include <fstream>
#include <iostream>
#include <iomanip>
#include "gnudes.h"
#include "ecarddbcfg.h"
#include "ConfigFile.h"

using namespace std;

#ifdef HEX_FMT
#undef HEX_FMT
#endif

#define HEX_FMT(w) std::hex<<std::uppercase<<std::setw(w)<<std::setfill('0')
#define HEX_BYTE_FMT HEX_FMT(2)


#ifdef WIN32
#define PATH_SEP '\\'
#else
#define PATH_SEP '/'
#endif

#define DBCFG_FILE ".ecarddbcfg"

#define DBCFG_KEY "93lgva93i3gbvxhd"

static std::string join_path(const std::string& path1,const std::string& path2)
{
	string result = path1;
	if(result.length() > 0)
	{
		if(result[result.length()-1] != PATH_SEP)
		{
			result += PATH_SEP;
		}
	}
	result += path2;
	//std::cout<<"path : "<<result<<std::endl;
	return result;
}

static void encode_hex(const unsigned char* data, size_t datalen, std::string& hexstr)
{
  size_t i;
  std::stringstream ss;
  for(i = 0; i < datalen; ++i)
  {
    ss << HEX_BYTE_FMT << static_cast<size_t>(data[i]);
  }
  hexstr = ss.str();
}
static size_t decode_hex(const std::string& hexstr, unsigned char* data)
{
  size_t i;
  for(i = 0; i < hexstr.length(); i += 2)
  {
    std::istringstream ss(hexstr.substr(i, 2));
    size_t d;
    ss >> std::hex >> d;
    data[i >> 1] = (unsigned char)d;
  }
  return i >> 1;
}

bool edb_get_db_url(const char* startpath,const char* signkey,char* url,char errmsg[512])
{
	string cfgpath;
	if(signkey == NULL)
	{
		strcpy(errmsg,"传入参数错误");
		return false;
	}
	
	if(startpath != NULL)
	{
		cfgpath = startpath;
	}
	else
	{
		cfgpath = ".";
	}
	cfgpath = join_path(cfgpath,DBCFG_FILE);

	{
#if MSC_VER >= 1400
#endif

		ifstream cfg(cfgpath.c_str());
#if MSC_VER >= 1400
#endif

		if(!cfg.is_open())
		{
			strcpy(errmsg,"无法读取配置文件");
			return false;
		}
	}

	ConfigFile cfg(cfgpath);

	if(!cfg.keyExists(signkey))
	{
		strcpy(errmsg,"指定数据库配置不存在");
		return false;
	}
	string dbcfg;
	if(!cfg.readInto(dbcfg,signkey))
	{
		strcpy(errmsg,"指定数据库配置不存在");
		return false;
	}

	unsigned char enc_dbcfg[128];
	char dec_dbcfg[128];
	if( dbcfg.length() > sizeof(enc_dbcfg) * 2)
	{
		strcpy(errmsg,"URL串长度错误");
		return false;
	}
	memset(enc_dbcfg,0,sizeof enc_dbcfg);
	size_t cfglen = decode_hex(dbcfg,enc_dbcfg);

	// 解压URL串
	des3_context ctx;
	memset(&ctx,0,sizeof ctx);
	unsigned char seed_key[16];
	memcpy(seed_key,DBCFG_KEY,16);
	size_t signkey_len = strlen(signkey);
	for(size_t i = 0;i < sizeof seed_key; ++i)
	{
		seed_key[i] ^= signkey[i % signkey_len];
	}
	for( size_t block = 0; block < cfglen; block+=8)
	{
		memset(&ctx,0,sizeof ctx);
		des3_set_2keys(&ctx,seed_key,seed_key+8);
		des3_decrypt(&ctx,enc_dbcfg+block,(unsigned char*)dec_dbcfg+block);
	}
	size_t urllen;
	{
		std::istringstream is(string(dec_dbcfg,2));
		is>>std::hex>>urllen;
	}
	if(urllen > cfglen - 2)
	{
		strcpy(errmsg,"URL校验错误");
		return false;
	}
	strcpy(url,dec_dbcfg+2);
	return true;
}



