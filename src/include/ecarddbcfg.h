#ifndef _ECARDDBCFG_H_
#define _ECARDDBCFG_H_


#ifdef __cplusplus
//extern "C" {
#endif

bool edb_get_db_url(const char* startpath, const char* signkey,char* url,char errmsg[512]);

#ifndef __cplusplus
//}
#endif

#endif // _ECARDDBCFG_H_

