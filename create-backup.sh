#!/bin/bash

BCK_PATH=/root/firefly-iii/db-backup
DB_PASSWORD=SomeStrongPass
DB_CONTAINER=firefly-iii_mariadb_1

mkdir -p $BCK_PATH
find $BCK_PATH/ -type f -mtime +90 -name 'backup_*' -exec rm {} \;
find $BCK_PATH/ -type f -mtime +7 -name 'backup_*' -exec gzip -9 {} \;
docker exec -it $DB_CONTAINER mysqldump -u root --password=$DB_PASSWORD firefly > $BCK_PATH/backup_$(date +"%Y%m%d").sql


# Restore
# cat $BCK_PATH/backup_DATE.sql | docker exec -i $DB_CONTAINER mysql -u root --password=$DB_PASSWORD firefly

# Crontab
# 0 0 * * * bash /root/firefly-iii/create-backup.sh