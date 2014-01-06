#ifndef  __T_devfeedetail_H_
#define  __T_devfeedetail_H_
typedef struct 
{
		int	feecfgid;
		int	feetype;
		int	feerate;
		int	enabled;
}T_t_devfeedetail;
int DB_t_devfeedetail_add(T_t_devfeedetail *pt_devfeedetail);
int DB_t_devfeedetail_del_by_feecfgid_and_feetype(int v_feecfgid,int v_feetype);
int DB_t_devfeedetail_read_lock_by_c0_and_feecfgid_and_feetype(int v_feecfgid,int v_feetype,T_t_devfeedetail *pt_devfeedetail);
int DB_t_devfeedetail_update_lock_by_c0(T_t_devfeedetail *pt_devfeedetail);
int DB_t_devfeedetail_free_lock_by_c0();
int DB_t_devfeedetail_read_by_feecfgid_and_feetype(int v_feecfgid,int v_feetype,T_t_devfeedetail *pt_devfeedetail);
int DB_t_devfeedetail_del_by_feecfgid(int v_feecfgid);
#endif
