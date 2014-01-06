/**
 * config_imp.h
 *
 *  Created on: 2010-4-18
 *      Author: WenJian
 */

#ifndef CONFIG_IMP_H_
#define CONFIG_IMP_H_

#include <string>
//#include "logger_imp.h"
#include "ConfigFile.h"

using namespace std;

struct config_imp
{
   string log_conf; 	//Log����
   string connectinfo;	//���ݿ����Ӵ�
   std::size_t service_code; //ҵ���ܺ�
   std::size_t internal_id; // ��������
   string server_ip; //netsvr ip
   std::size_t server_port; // netsvr port
};

extern config_imp config_obj;
bool init_config(const string pathname);

#endif /* CONFIG_IMP_H_ */
