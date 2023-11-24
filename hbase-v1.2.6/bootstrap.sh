#!/bin/bash

# set region server hostname
sed -i "s/HOSTNAME/$(hostname)/" /usr/local/hbase/conf/hbase-site.xml 

## replace config
: ${EXTRA_CONF_DIR:=/mnt/hbase}

if [ -d "$EXTRA_CONF_DIR" ]; then
	cp $EXTRA_CONF_DIR/* $HBASE_HOME/conf/
	if [ -f "$EXTRA_CONF_DIR/hbase-site.xml" ]; then
		sed -i "s/HOSTNAME/$(hostname)/" $HBASE_HOME/conf/hbase-site.xml
	fi
fi

# replace ssh config file if provided
if [ -f $EXTRA_CONF_DIR/ssh_config ]; then
	cp /mnt/hbase/ssh_config /root/.ssh/config
	chown $(id -u):$(id -g) /root/.ssh/config
	chmod 600 /root/.ssh/config
fi

/usr/sbin/sshd

cat <<EOF
Please execute the following commands to start hbase service(hbase-master):
	bin/start-hbase.sh
	bin/hbase-daemon.sh start thrift
EOF

bin/start-hbase.sh
bin/hbase-daemon.sh start thrift

while true; do sleep 1000; done
