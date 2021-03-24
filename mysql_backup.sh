#!/bin/bash

DATE=`date +%Y%m%d`
DATABASES="lb_tb lb_admin lb_cs lb_statis lb_user_login"
BACKUP_DIR=/home/PATH/backup

cd $BACKUP_DIR

for i in $DATABASES;
  do
    /data/application/mysql/bin/mysqldump -hHOST -uUSER -pPASSWORD -B $i > $i.sql;
  done

tar jcf DLB-$DATE-W.tar.bz2 *.sql

cp  DLB-$DATE-W.tar.bz2 /mnt/backup-beijing
cp  DLB-$DATE-W.tar.bz2 /mnt/backup-shanghai

exit 0
