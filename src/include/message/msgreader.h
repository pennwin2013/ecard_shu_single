#ifndef MSGREADER_H_
#define MSGREADER_H_
#include "message.h"
class MESSAGE_API CMsgReader:public Cmessage {
private:
	Json::Reader reader;
	Json::Value jvDoc;
	Json::Value* pjvColName;
	Json::Value* pjvColDesc;
  Json::Value* pjvRowData;
	Json::Value* pjvFetchRow;
	int iFetchRowCnt;
	int iColCnt;
	bool bParse;
	string _sAttrVal;
	string _sColVal;
	string _sColDesc;
	string _sRowStr;
  string _printstr;
public:
	CMsgReader(void);
	void clear();
	int parse(const char*jsonstr);
    bool hasAttr(const char* attrName);
	const string& getAttrValAsStr(const char* attrName);
	unsigned int getAttrValAsUint(const char* attrName);
	int getAttrValAsInt(const char* attrName);
	double getAttrValAsDbl(const char* attrName);
	//�ж��Ƿ�fetch���м�¼
	bool eof();
	int moveFirst();
	int moveNext();
	int movePrevious();
	int moveLast();
  bool hasNextRow();
	bool fetchRow();
  bool fetchRowAtRowNum(int rownum);
	bool moveTo(int rownum);
  int getCurrentRow();
	const string& getRowAsString();
	int getColInfo(int colIndex,string& colName,string& coldesc);
	int getColInfo(int colIndex,char* colName,char* colDesc);
	const string&  getColDesc(const char* colname);
	const string& getColValAsStr(const char* colName);
	const string& getColValAsStr(int  colIndex);
	int getColValAsInt(const char* colName);
	int getColValAsInt(int  colIndex);
	unsigned int getColValAsUint(const char* colName);
	unsigned int getColValAsUint(int  colIndex);
	double getColValAsDbl(const char* colName);
	double getColValAsDbl(int  colIndex);
	const string& operator[](const char* attrName);
	const string& operator[](int colIndex);
  const string& getPrintMsgStr();
};
#endif

