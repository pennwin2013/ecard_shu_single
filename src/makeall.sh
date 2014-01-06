#!/bin/sh
DIRBASE=`pwd`
cd $DIRBASE/db
chmod +x .cleandb.sh
chmod +x .gendb.sh
make clean >m.std 2>m.err
make install >>m.std 2>>m.err
grep -q "SUCCESS" m.std
if [ $? == 0 ];then
  echo "DB compile OK"
else
  echo "DB compile FAILED"
  exit 1
fi
cd $DIRBASE/public
chmod +x .cleanpublic.sh
make clean >db.std 2>db.err
make >>m.std 2>>m.err
grep -q "SUCCESS" m.std
if [ $? == 0 ];then
  echo "PUBLIC compile OK"
else
  echo "PUBLIC compile FAILED"
  exit 2
fi
cd $DIRBASE/ecardsvr
make clean >m.std 2>m.err
make >>m.std 2>>m.err
grep -q "SUCCESS" m.std
if [ $? == 0 ];then
  echo "ECARDSVR compile OK"
else
  echo "ECARDSVR compile FAILED"
  exit 3
fi
cd $DIRBASE/batch
chmod +x .cleanbatch.sh
make clean >m.std 2>m.err
make >>m.std 2>>m.err
grep -q "SUCCESS" m.std
if [ $? == 0 ];then
  echo "BATCH compile OK"
else
  echo "BATCH compile FAILED"
  exit 4
fi
