#!/usr/bin/env bash

echo "Setting permissions"
chown -R zooman:zooman /opt/molsfw/zookeeper/
chown -R zooman:zooman /opt/moldata/zookeeper/
chown -R zooman:zooman /opt/molsfw/exhibitor/
chown -R zooman:zooman /opt/molsfw/zooman