// ���� ifdef ���Ǵ���ʹ�� DLL �������򵥵�
// ��ı�׼�������� DLL �е������ļ��������������϶���� MESSAGE_EXPORTS
// ���ű���ġ���ʹ�ô� DLL ��
// �κ�������Ŀ�ϲ�Ӧ����˷��š�������Դ�ļ��а������ļ����κ�������Ŀ���Ὣ
// MESSAGE_API ������Ϊ�Ǵ� DLL ����ģ����� DLL ���ô˺궨���
// ������Ϊ�Ǳ������ġ�
#ifndef MSGWRITER_H_
#define MSGWRITER_H_
#include "message.h"
#include "msgattr.h"
#include "msgcol.h"

class MESSAGE_API CMsgWriter:public Cmessage {
private:
	Json::Value jvRoot;
	Json::Value jvRow;
	Json::Value jvArrayRow;
	Json::Value jvArrayColName;
	Json::Value jvArrayColDesc;
  Json::Value* pjvRowData;
	string _jsonstr;
	string _printstr;
public:
	CMsgAttr attr;
	CMsgCol	col;
	CMsgWriter(void);
	void clear();
    void setIgnoreCase(bool ignorecase=true);
	int getSetColIndex(const char* colName);
	int setAttrValInt(const char* attrName,int attrVal);
	int setAttrValUint(const char* attrName,unsigned int attrVal);
	int setAttrValStr(const char* attrName,const char* attrVal);
	int setAttrValDbl(const char* attrName,double attrVal);
	int setColDesc(const char* colName,const char* colDesc);
	int setColValStr(const char* colName,const char* colVal);
	int setColValInt(const char* colName,int colVal);
	int setColValUint(const char* colName,unsigned int colVal);
	int setColValDbl(const char* colName,double colVal);
	int cloneRow();
	int addRow();
	int serialize();
	const string& getMsgStr();
	const string& getPrintMsgStr();
};
#endif
