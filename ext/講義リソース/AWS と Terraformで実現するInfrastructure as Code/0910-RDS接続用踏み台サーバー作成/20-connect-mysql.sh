#!/bin/bash

MYSQL_HOST=tastylog-dev-mysql-standalone.cnpfumesq5vs.ap-northeast-1.rds.amazonaws.com
MYSQL_PORT=3306
MYSQL_USERNAME=admin
MYSQL_PASSWORD=LN9iUhk-n3km0USj

mysql -h"${MYSQL_HOST}" -P"${MYSQL_PORT}" -u"${MYSQL_USERNAME}" -p"${MYSQL_PASSWORD}"
