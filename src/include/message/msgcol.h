// ���� ifdef ���Ǵ���ʹ�� DLL �������򵥵�
// ��ı�׼�������� DLL �е������ļ��������������϶���� MESSAGE_EXPORTS
// ���ű���ġ���ʹ�ô� DLL ��
// �κ�������Ŀ�ϲ�Ӧ����˷��š�������Դ�ļ��а������ļ����κ�������Ŀ���Ὣ
// MESSAGE_API ������Ϊ�Ǵ� DLL ����ģ����� DLL ���ô˺궨���
// ������Ϊ�Ǳ������ġ�
#ifndef MSGCOL_H_
#define MSGCOL_H_
#include "message.h"
class MESSAGE_API CMsgCol:public  Cmessage
{
private:
	string	_colName;
	Json::Value* _jvRow;
	Json::Value* _jvColName;
	Json::Value* _jvColDesc;
  int getIndex(const char* colName);
public:
	CMsgCol(Json::Value& jvColName,Json::Value& jvColDesc,Json::Value& jvRow);
	CMsgCol& operator[](const char* colName);
	int operator=(const char* colVal);
	int operator=(const string& colVal);
	int operator=(int colVal);
  int operator=(char colVal);
	int operator=(unsigned int colVal);
	int operator=(double colVal);
	void clear();
	int setValStr(const char* colName,const char* colVal);
	int setValInt(const char* colName,int colVal);
	int setValUint(const char* colName,unsigned int colVal);
	int setValDbl(const char* colName,double colVal);
	int setDesc(const char* colName,const char* colDesc);
};
#endif
