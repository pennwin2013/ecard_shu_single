/* --------------------------------------------
 * ��������: 2014-01-06
 * ��������: ����
 * �汾��Ϣ: 4.0.0.0
 * ������: ��netsvr��Ӧ��ecardsvr�� ���Խӿ�
 * --------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "errdef.h"
#include "pubdef.h"
#include "pubdb.h"
#include "pubfunc.h"
#include "dbfunc.h"
#include "unitfunc.h"
#include "transfunc.h"
#include "interfacefunc.h"


FUNCTION(870023)
{
    int ret = 0;
    CAccTrans& ats = CAccTrans::GetInst();
    TRANS& trans = ats.trans;
    gReader.fetchRow();

    //���ص�����
    gWriter.attr["retmsg"] = "����";
    //6.����֧�����
    gWriter.addRow();
    return 0;
}


























