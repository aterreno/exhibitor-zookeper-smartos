#!/usr/bin/env bash

echo "Creating folders"
mkdir -p /opt/molsfw/exhibitor
mkdir -p /opt/molsfw/zookeeper
mkdir -p /opt/moldata/zookeeper
mkdir -p /opt/moldata/zookeeper/log
mkdir -p /opt/moldata/zookeeper/log-index
mkdir -p /opt/moldata/zookeeper/backup-extra

echo "Creating user"
groupadd zooman
useradd -G zooman zooman
usermod -s /bin/bash -d /opt/molsfw/zookeeper zooman

echo "Downloading & Configuring Default Zookeeper"
cd /opt/molsfw/zookeeper && curl -O http://apache.mirrors.timporter.net/zookeeper/stable/zookeeper-3.4.5.tar.gz && tar -zxvf zookeeper-3.4.5.tar.gz
echo 'JAVA_HOME="/opt/molsfw/java/latest7/"' > '/opt/molsfw/zookeeper/zookeeper-3.4.5/conf/java.env'

