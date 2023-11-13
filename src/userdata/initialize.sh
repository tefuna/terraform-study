#!/bin/bash
# ---------------------------------
# change ssh port.
# ---------------------------------
/bin/sed -i -e 's/^#Port 22$/Port 10022/' /etc/ssh/sshd_config
service sshd restart

# ---------------------------------
# EC2 user data
# Autoscaling startup scripts.
# ---------------------------------
APP_NAME=tastylog
BUCKET_NAME=tastylog-dev-deploy-bucket-ror08u
CWD=/home/ec2-user

# Log output setting
LOGFILE="/var/log/initialize.log"
exec > "${LOGFILE}"
exec 2>&1

# Change current work directory
cd ${CWD}

# Get latest version number.
aws s3 cp s3://${BUCKET_NAME}/latest ${CWD}

# Get latest resources.
aws s3 cp s3://${BUCKET_NAME}/${APP_NAME}-app-$(cat ./latest).tar.gz ${CWD}

# Decompress tar.gz
rm -rf ${CWD}/${APP_NAME}
mkdir -p ${CWD}/${APP_NAME}
tar -zxvf "${CWD}/${APP_NAME}-app-$(cat ./latest).tar.gz" -C "${CWD}/${APP_NAME}"

# Move to application directory
sudo rm -rf /opt/${APP_NAME}
sudo mv ${CWD}/${APP_NAME} /opt/

# Boot application
sudo systemctl enable tastylog
sudo systemctl start tastylog
