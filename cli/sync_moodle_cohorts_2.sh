#!/bin/sh
SYNC_DIR="/srv/e-learning/web/local/ldap/cli"
DATE=`date +%Y-%m-%d`
LOG_DIR="/srv/e-learning/data/sync"
PHP=/usr/bin/php
if [ ! -d $LOG_DIR ]; then
	mkdir -p $LOG_DIR
fi
OLDPWD=$PWD
cd $SYNC_DIR && \
$PHP -d log_errors=1 -d error_reporting=E_ALL \
-d display_errors=0 -d html_errors=0 -d memory_limit=256M \
./sync_cohorts_attribute.php > $LOG_DIR/cohort_ldap_2_sync_$DATE.txt
cd $OLDPWD

