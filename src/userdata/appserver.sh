#!/bin/sh -ex
/bin/sed -i -e 's/^#Port 22$/Port 10022/' /etc/ssh/sshd_config
service sshd restart
