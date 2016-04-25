#!/bin/bash

## BEGIN CONFIG ##
HOST=localhost
##echo $PWD El Path de donde se encuentra el archivo
OUTPUT_DIR=$PWD

## END CONFIG ##

if [ ! -d $OUTPUT_DIR ]; then
  mkdir -p $OUTPUT_DIR
fi

POSTGRE_DBS=$(psql -h $HOST -U postgres -l | awk ' (NR > 2) && (/[a-zA-Z0-9]+[ ]+[|]/) && ( $0 !~ /template[0-9]/) { print $1 }');

for DB in $POSTGRE_DBS ; do 
  echo "* Backuping PostgreSQL data from $DB@$HOST..."
  pg_dump -h $HOST -U postgres $DB > $OUTPUT_DIR/pg_"$DB"_`date +%Y%m%d`.sql
done
