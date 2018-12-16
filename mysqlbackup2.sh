#!/bin/bash
 
export PATH=/bin:/usr/bin:/usr/local/bin
TODAY=`date +"%d%b%Y"`
 
################################################################
################## Update below values  ########################
 
BACKUPPATH='/backup/dbbackup'
MYSQL_HOST='localhost'
MYSQL_PORT='3306'
MYSQL_USER='root'
MYSQL_PASSWORD='mysecret'
DATABASE_NAME='mydb'
BACKUPRETAINDAYS=30   ## Number of days to keep local backup copy
 
#################################################################
 
mkdir -p ${BACKUPPATH}/${TODAY}
echo "Backup started for database - ${DATABASE_NAME}"
 
 
mysqldump -h ${MYSQL_HOST} \
   -P ${MYSQL_PORT} \
   -u ${MYSQL_USER} \
   -p${MYSQL_PASSWORD} \
   ${DATABASE_NAME} | gzip > ${BACKUPPATH}/${TODAY}/${DATABASE_NAME}-${TODAY}.sql.gz
 
if [ $? -eq 0 ]; then
  echo "Database backup successfully completed"
else
  echo "Error found during backup"
fi
 
 
## Remove backups older than {BACKUPRETAINDAYS} days
 
DBDELDATE=`date +"%d%b%Y" --date="${DBRETAINDAYS} days ago"`
 
rm -rf ${BACKUPPATH}/${DBDELDATE}
 
### Script ends here #######
