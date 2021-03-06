insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10', '一卡通管理系统', 1, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('1010', '数据中心', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101010', '操作管理', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101010', '操作员管理', 3, 'F1001');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101011', '角色管理', 3, 'F1002');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101012', '角色权限分配', 3, 'F1003');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101013', '操作员角色管理', 3, 'F1004');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101014', '操作员密码修改', 3, 'F1008');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101015', '操作员密码重置', 3, 'F1009');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101016', '操作日志查询', 3, 'F1010');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101017', '网点信息设置', 3, 'F1036');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101018', '登录站点管理', 3, 'F1007');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101019', '充值授权卡绑定', 3, 'F1006');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101011', '参数管理', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101110', '数据字典设置', 3, 'F1014');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101111', '全局参数设置', 3, 'F1017');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101112', '收费类别设置', 3, 'F1018');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101113', '脱机水价设置', 3, 'F1019');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101114', '交易收费配置', 3, 'F1020');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10101115', '消息队列管理', 3, 'F1021');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101116', '卡类别设置', 3, 'F1022');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101117', '发卡收费类别设置', 3, 'F1023');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101118', '钱包管理', 3, 'F1024');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101012', '区域/部门/专业', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101210', '区域查询', 3, 'F1031');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101211', '区域设置', 3, 'F1032');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101212', '部门信息查询', 3, 'F1033');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101213', '部门信息设置', 3, 'F1034');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101214', '专业信息设置', 3, 'F1035');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101013', '客户管理', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101310', '客户类别设置', 3, 'F3001');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101311', '客户信息查询', 3, 'F3002');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101312', '客户信息设置', 3, 'F3003');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101313', '客户信息导入', 3, 'F3004');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101314', '客户导入管理', 3, 'F3005');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101315', '学工号批量修改', 3, 'F3006');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101316', '客户信息批量修改', 3, 'F3007');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101317', '新生换卡名单导入', 3, 'F3008');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101318', '新生换卡名单管理', 3, 'F3009');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10101319', '转校区名单导入', 3, 'F3019');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10101320', '转校区名单管理', 3, 'F3020');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101014', '商户管理', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101410', '商户信息查询', 3, 'F2001');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101411', '商户信息设置', 3, 'F2002');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10101412', '商户组织结构设置', 3, 'F2003');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10101413', '商户科目映射', 3, 'F2004');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101414', '商户搭伙费设置', 3, 'F2005');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10101415', '浮动费率设置', 3, 'F2006');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101416', '餐次信息设置', 3, 'F2007');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10101417', '商户餐次信息设置', 3, 'F2008');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101015', '设备商户绑定', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101510', '设备商户关系查询', 3, 'F2013');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101511', '设备商户关系设置', 3, 'F2014');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101512', '设备商户关系导入', 3, 'F2015');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10101513', '设备商户导入管理', 3, 'F2016');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('1011', '卡务中心', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101110', '日常卡务', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111009', '充值平台', 3, 'F4048');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111010', '读取卡信息', 3, 'F4001');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111011', '发行卡操作', 3, 'F4010');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111012', '批量发行卡', 3, 'F4011');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111013', '匿名卡发行', 3, 'F4012');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111014', '换卡操作', 3, 'F4013');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111015', '补写换卡信息', 3, 'F4043');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111016', '挂失解挂操作', 3, 'F4014');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111017', '冻结解冻操作', 3, 'F4015');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111018', '卡批量冻结', 3, 'F4016');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10111019', '过渡卡发行', 3, 'F4041');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111020', '补办卡操作', 3, 'F4018');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111021', '一卡通销户', 3, 'F4019');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111022', '卡现金充值', 3, 'F4020');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111023', '卡现金支取', 3, 'F4021');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111024', '卡密码重置', 3, 'F4025');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111025', '坏卡登记', 3, 'F4032');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111026', '卡信息更新', 3, 'F4024');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111027', '卡余额转移', 3, 'F4042');

insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111031', '批量销户导入', 3, 'F4045');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111032', '批量销户审核', 3, 'F4046');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111033', '批量销户查询', 3, 'F4047');


insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101111', '日常查询', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111110', '账户信息查询', 3, 'F4033');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111111', '账户交易查询', 3, 'F4035');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111112', '交易流水查询', 3, 'F4034');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101112', '交易处理', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111210', '交易冲正', 3, 'F4027');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111211', '开户冲正', 3, 'F4028');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111212', '充值冲正', 3, 'F4029');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111213', '消费冲正', 3, 'F4030');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101113', '卡库平帐', 2, null);
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10111310', '卡流水采集', 3, 'F4036');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10111311', '卡库平帐', 3, 'F4037');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111312', '卡余额调整', 3, 'F4022');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10111313', '后付费扣款', 3, 'F4023');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10111314', '补帐交易', 3, 'F4031');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10111315', '账务手工调整', 3, 'F4026');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('1012', '财务中心', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101210', '设置管理', 2, null);
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121010', '科目信息设置', 3, 'F5007');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121011', '权限管理', 3, 'F5008');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('101211', '会计账薄', 2, null);
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121110', '会计账簿', 3, 'F5009');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121111', '科目汇总表', 3, 'F5010');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('101212', '凭证管理', 2, null);
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121210', '凭证管理', 3, 'F5001');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121211', '凭证批量审核', 3, 'F5002');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121212', '凭证审核取消', 3, 'F5003');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121213', '凭证批量入账', 3, 'F5004');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101213', '结算管理', 2, null);
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121310', '日终结转', 3, 'F5005');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121311', '期末结转', 3, 'F5006');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121312', '商户解款', 3, 'F6001');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121313', '操作员解款', 3, 'F6002');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121314', '网点解款', 3, 'F6025');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101214', '统计报表', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121410', '科目余额表', 3, 'F6006');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121411', '科目总账表', 3, 'F6007');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121412', '系统运行情况表', 3, 'F6009');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121413', '商户营业情况表', 3, 'F6010');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121414', '商户汇总结算表', 3, 'F6011');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121415', '商户分餐汇总结算表', 3, 'F6012');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121416', '商户搭伙费报表', 3, 'F6013');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121417', '商户分类结算表', 3, 'F6014');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121418', '商户POS分类结算表', 3, 'F6015');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121419', '商户分餐分类结算表', 3, 'F6016');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121420', '销户现金报表', 3, 'F6017');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121421', '卡片使用情况汇总', 3, 'F6019');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121422', '操作员业务报表', 3, 'F6020');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121423', '票据现金分天报表', 3, 'F6018');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121424', '票据现金汇总报表', 3, 'F6021');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121425', '操作员分类结算表', 3, 'F6024');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121426', '设备充值报表', 3, 'F6022');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121427', '设备充值分天报表', 3, 'F6023');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121428', '科目总账表(分校区)', 3, 'F6067');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121429', '转账对账表(分校区)', 3, 'F6065');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121430', '设备充值报表(分校区)', 3, 'F6066');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101215', '当日报表', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121510', '商户当日结算表', 3, 'F6003');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121511', '票据现金报表', 3, 'F6004');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10121512', '卡片使用情况汇总', 3, 'F6005');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10121513', '操作员当日分类表', 3, 'F6026');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('1013', '集控中心', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101310', '子系统管理', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10131010', '子系统设置', 3, 'F1011');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10131011', '通用前置参数设置', 3, 'F1012');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10131012', '外接系统名单同步查询', 3, 'F1013');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101311', '设备集中管理', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10131110', '设备信息查询', 3, 'F1025');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10131111', '设备信息设置', 3, 'F1026');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10131112', '设备信息导入', 3, 'F1027');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10131113', '设备导入管理', 3, 'F1028');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10131114', '设备参数控制', 3, 'F1029');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('1014', '密钥中心', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101410', '密钥管理', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10141010', '生成密钥卡', 3, 'F3090');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10141011', '密钥卡复制', 3, 'F4002');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101411', '高级卡务操作', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10141110', '一卡通回收', 3, 'F4003');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10141111', '初始化卡操作', 3, 'F4005');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10141112', '小钱包初始化', 3, 'F4006');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101412', 'PSAM卡管理', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10141210', 'PSAM卡发行', 3, 'F4007');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10141211', 'PSAM卡读取', 3, 'F4008');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10141212', 'PSAM卡操作', 3, 'F4009');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('1015', '卡片库存', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101510', '卡片领入', 3, 'F1201');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101511', '卡片上交', 3, 'F1202');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101512', '卡片转出', 3, 'F1203');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101513', '卡片作废', 3, 'F1204');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('1016', '补助发放', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101610', '补助信息导入', 3, 'F7001');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101611', '补助信息管理', 3, 'F7002');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101612', '补助信息审核', 3, 'F7003');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101613', '补助信息下发', 3, 'F7004');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('1017', '银行圈存', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101710', '银行卡绑定', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10171010', '银行卡绑定导入', 3, 'F3010');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10171011', '银行卡绑定管理', 3, 'F3011');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101711', '圈存对账', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10171110', '对账单处理', 3,'F3017');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10171111', '对账明细处理', 3, 'F3018');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('1018', '消费管理', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101810', 'POS流水导入', 3, 'F4038');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101811', 'POS导入流水管理', 3, 'F4039');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101812', 'POS异常流水管理', 3, 'F4040');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('101813', '汇多POS流水管理', 3, 'F4044');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('1019', '水控管理', 2, null);
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('101910', '水控设置卡发行', 3, 'F1101');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('101911', '水控设置卡管理', 3, 'F1102');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('101912', '水控设置卡删除', 3, 'F1104');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('101913', '水控钱包转账', 3, 'F1106');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('101914', '常开卡设置', 3, 'F1107');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('101915', '水控钱包信息', 3, 'F1108');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('101916', '小钱包流水查询', 3, 'F1109');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('101917', '水控自动转账', 3, 'F1110');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('1020', '车载收费', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102010', '车载机配置', 3, 'F9001');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102011', '密钥管理', 3, 'F9002');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102012', '流水采集', 3, 'F9003');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('1021', '门禁管理', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102110', '门禁参数设置', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211010', '门禁组设置', 3, 'F8001');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211011', '时间段参数设置', 3, 'F8002');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211012', '时间段组设置', 3, 'F8003');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211013', '周时间段参数设置', 3, 'F8004');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211014', '常开时间段设置', 3, 'F8005');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211015', '节假日设置', 3, 'F8006');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211016', '门禁对接参数设置', 3, 'F8007');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211017', '门禁时间周设置', 3, 'F8008');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211018', '门禁时间周管理', 3, 'F8009');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211019', '管理卡常开卡设置', 3, 'F8010');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211020', '管理卡常开卡查询', 3, 'F8011');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211021', '门禁常开常闭设置', 3, 'F8012');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102111', '门禁权限管理', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211110', '门禁机分组设置', 3, 'F8013');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211111', '门禁机操作员权限设置', 3, 'F8014');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211112', '门禁组操作员权限设置', 3, 'F8015');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102112', '门禁业务处理', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211210', '门禁人员名单查询', 3, 'F8016');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211211', '门禁人员名单分配', 3, 'F8017');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211212', '门禁人员名单删除', 3, 'F8018');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102113', '门禁统计报表', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('10211310', '门禁流水查询', 3, 'F8019');
--insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
--values ('10211311', '测试功能', 3, 'FuncTest');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('1022', '手持机管理', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102210', '手持机消费流水采集', 3, 'F9004');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102211', '手持机认证流水采集', 3, 'F9005');
delete from t_module where modulecode lile '1023%';
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('1023', '在线账户', 2, null);
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102310', '在线账户补助导入', 3, 'F7101');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102311', '在线账户补助管理', 3, 'F7102');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102312', '在线账户补助审核', 3, 'F7103');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102313', '在线账户补助下发', 3, 'F7104');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102314', '在线账户交易冲正', 3, 'F7107');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102315', '在线账户手工借贷', 3, 'F7108');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102316', '在线账户信息查询', 3, 'F7105');
insert into T_MODULE (MODULECODE, MODULENAME, MODULELEVEL, FUNCCODE)
values ('102317', '在线账户明细查询', 3, 'F7106');
commit;