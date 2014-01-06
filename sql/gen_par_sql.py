# -*- coding: gbk -*-

import os,datetime,calendar

def get_next_month_day(year,month):
    day_begin,day_end = calendar.monthrange(year,month)
    d = datetime.date(year,month,day_end)
    d += datetime.timedelta(days=1)
    return d.strftime('%Y%m%d')
    
def gensql():
    year_begin = 2013
    year_end = 2050
    y = year_begin
    while y < year_end:
        for mon in range(12):
            m = mon + 1
            d = datetime.date(y,m,1).strftime('%Y%m')
            print "ALTER TABLE T_TRANSDTLHIS ADD PARTITION PAR_TRANSDTLHIS_%s VALUES LESS THAN ('%s') TABLESPACE TS_HIS_%02d; " \
            % (d,get_next_month_day(y,m),m)
        y += 1    
            
gensql()
