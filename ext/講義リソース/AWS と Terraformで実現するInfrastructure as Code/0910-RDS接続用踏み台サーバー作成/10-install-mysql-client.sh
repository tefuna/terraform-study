#!/bin/bash
# ---------------------------------
# Install MySQL Client.
# ---------------------------------
yum localinstall -y https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
yum install -y mysql-community-client
