#!/bin/sh
service webmin start
service usermin start
service apache2 start
service mysql start
/usr/sbin/sshd -D
