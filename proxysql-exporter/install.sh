#!/bin/sh

PROXYSQL_EXPORTER_VERSION=1.1.0

set -x

# download & install binary from percona release
wget -qO- https://github.com/percona/proxysql_exporter/releases/download/v${PROXYSQL_EXPORTER_VERSION}/proxysql_exporter-${PROXYSQL_EXPORTER_VERSION}.linux-amd64.tar.gz | tar xvz --strip-components=1 -C /usr/sbin proxysql_exporter-${PROXYSQL_EXPORTER_VERSION}.linux-amd64/proxysql_exporter

# install it as service
cp ./proxysql-exporter.service /etc/systemd/system/
systemctl enable proxysql-exporter.service
systemctl daemon-reload
systemctl start proxysql-exporter
