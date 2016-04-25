#!/bin/bash

USER="root"
PASSWORD="12qwaszx"
OUTPUT_DIR=$PWD

#rm "$OUTPUT_DIR/*gz" > /dev/null 2>&1

databases=`mysql --user=$USER --password=$PASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`

#echo $databases

for db in $databases; do
#    if [ $db != "information_schema" && $db != _* ] ; then
    if [ "$db" != "information_schema" ] ; then
        echo "* Dumping Mysql data from $db..."
        mysqldump --force --opt --user=$USER --password=$PASSWORD --databases $db > $OUTPUT_DIR/my_"$db"_`date +%Y%m%d`.sql
        #gzip $OUTPUT_DIR/`date +%Y%m%d`.$db.sql
    fi
done
