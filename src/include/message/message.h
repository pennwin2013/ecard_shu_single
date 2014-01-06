// ���� ifdef ���Ǵ���ʹ�� DLL �������򵥵�
// ��ı�׼�������� DLL �е������ļ��������������϶���� MESSAGE_EXPORTS
// ���ű���ġ���ʹ�ô� DLL ��
// �κ�������Ŀ�ϲ�Ӧ����˷��š�������Դ�ļ��а������ļ����κ�������Ŀ���Ὣ
// MESSAGE_API ������Ϊ�Ǵ� DLL ����ģ����� DLL ���ô˺궨���
// ������Ϊ�Ǳ������ġ�
#ifndef MESSAGE_H_
#define MESSAGE_H_
#include "json/json.h"
#include<string>
#include<map>
using namespace std;
#ifdef WIN32
#ifdef MESSAGE_EXPORTS
#define MESSAGE_API __declspec(dllexport)
#define toLowerCase tolower
#else
#define MESSAGE_API __declspec(dllimport)
#endif
#else 
#define toLowerCase ::tolower
#define MESSAGE_API
#endif
#define ATTR_COLCNT   "colcnt"
#define ATTR_COLNAME	"colname"
#define ATTR_COLDESC	"coldesc"
#define ATTR_ROWCNT	  "rowcnt"
#define ATTR_ROWDATA  "rowdata"


#define MESSAGE_READER_ASSERT( condition, message ) if (!( condition )) throw std::runtime_error( message );
typedef map<string,int> COLMAP;

class MESSAGE_API Cmessage {
protected:
	int iRowCnt;
	COLMAP colIndexMap;
  bool bIgnoreCase;
public:
	Cmessage(void);
void setIgnoreCase(bool ignorecase=true);
int getColIndex(const char* colName);
int hasCol(const char* colName);
int getColCnt();
int getRowCnt();
int jsonVal2Str(const Json::Value& jsonVal,string& val);
int jsonVal2Int(const Json::Value& jsonVal,int& val);
int jsonVal2Uint(const Json::Value& jsonVal,unsigned int& val);
int jsonVal2Dbl(const Json::Value& jsonVal,double& val);
string jsonValAsStr(const Json::Value& jsonVal);
int jsonValAsInt(const Json::Value& jsonVal);
unsigned int jsonValAsUint(const Json::Value& jsonVal);
double jsonValAsDbl(const Json::Value& jsonVal);
};
#endif
