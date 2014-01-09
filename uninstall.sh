#!/usr/bin/env bash

echo "Deleting folders"
rm -rf /opt/molsfw/exhibitor
rm -rf /opt/molsfw/zookeeper
rm -rf /opt/moldata/zookeeper
rm -rf /var/log/zookeeper
rm -rf /opt/moldata/zookeeper/backup

echo "Deleting user"
groupdel zooman
userdel zooman

echo "Killing any existent java process"
svcadm disable exhibitor
ps -ef | grep java | grep -v grep | awk '{print $2}' | xargs kill -9
