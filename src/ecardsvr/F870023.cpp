/* --------------------------------------------
 * 创建日期: 2014-01-06
 * 程序作者: 汪鹏
 * 版本信息: 4.0.0.0
 * 程序功能: 新netsvr对应的ecardsvr的 测试接口
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

    //返回的属性
    gWriter.attr["retmsg"] = "测试";
    //6.返回支付结果
    gWriter.addRow();
    return 0;
}


























