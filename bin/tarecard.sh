#!/bin/bash
bdir="./ykt/bin"
sdir="./ykt/sql"
cd $HOME
time=`date +%Y%m%d_%H%M%S`
sysdate=`date +%Y%m%d`
version=`./ykt/bin/ecardsvr -v |awk '{print $2}'`
tarfile="Sw-smc-srv.shu-v${version}."${time}.tar.gz
zipfile="Sw-smc-srv.shu-v${version}."${sysdate}.release.zip
echo $zipfile
chmod +x $bdir/icegridnode
chmod +x $bdir/netsvr
chmod +x $bdir/dps
chmod +x $bdir/kall
chmod +x $bdir/sall
chmod +x $bdir/icelib/icegridregistry
chmod +x $bdir/icelib/glacier2router
chmod +x $bdir/icelib/startregistry.sh
chmod +x $bdir/icelib/startglacier2.sh

exefile="
$bdir/icegridnode 
$bdir/netsvr 
$bdir/colposdtl
$bdir/coldatasvr
$bdir/custsyncsvr 
$bdir/dayendbala 
$bdir/dbclean 
$bdir/ecardsvr 
$bdir/gatesvr 
$bdir/posdatasvr 
$bdir/posdtlacc 
$bdir/closesvr
$bdir/statsvr 
$bdir/svrmonitor 
$bdir/waterdtlacc 
$bdir/ecard-function 
$bdir/dps 
$bdir/kall
"

cfgfile="
$bdir/icelib 
$bdir/.ecarddbcfg 
$bdir/config.node
$bdir/config.node.2
$bdir/banksvr.conf
$bdir/colposdtl.conf
$bdir/coldatasvr.conf
$bdir/custsyncsvr.conf
$bdir/dayendbala.conf
$bdir/dbclean.conf
$bdir/ecardsvr.conf
$bdir/gatesvr.conf
$bdir/log4cplus.conf
$bdir/posdatasvr.conf
$bdir/posdtlacc.conf
$bdir/closesvr.conf
$bdir/statsvr.conf
$bdir/waterdtlacc.conf

$bdir/banksvr.logconf
$bdir/colposdtl.logconf
$bdir/coldatasvr.logconf
$bdir/custsyncsvr.logconf
$bdir/dayendbala.logconf
$bdir/dbclean.logconf
$bdir/ecardsvr.logconf
$bdir/gatesvr.logconf
$bdir/posdatasvr.logconf
$bdir/posdtlacc.logconf
$bdir/closesvr.logconf
$bdir/statsvr.logconf
$bdir/waterdtlacc.logconf
$bdir/svrmonitor.ini
$bdir/sall
./ykt/bash_profile 
./ykt/yktprofile
"
sqlfile="
$sdir/1.*.sql 
$sdir/2.*.sql 
$sdir/3.*.sql 
$sdir/4.*.sql 
$sdir/5.*.sql 
$sdir/6.*.sql 
$sdir/7.*.sql 
$sdir/8.*.sql 
$sdir/9.*.sql 
"

echo $sqlfile|xargs  tar cvf sql.tar  
echo $exefile|xargs  tar cvf exe.tar  
echo $cfgfile|xargs  tar cvf cfg.tar --exclude $bdir/icelib/db --exclude $bdir/icelib/win32  
cp ./ykt/updatehistory.txt ~
cp ./ykt/update.sql ~
zip $zipfile exe.tar cfg.tar sql.tar updatehistory.txt update.sql
rm -f exe.tar cfg.tar sql.tar updatehistory.txt update.sql
echo "create $zipfile OK"
