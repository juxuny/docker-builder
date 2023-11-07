#!/bin/bash

: ${HADOOP_PREFIX:=/usr/local/hadoop}

$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

rm -rf /tmp/*.pid

# installing libraries if any - (resource urls added comma separated to the ACP system variable)
cd $HADOOP_PREFIX/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp; curl -LO $cp ; done; cd -

# replace config files if provided
if [ -d /mnt/hadoop-config ]; then
	cp -rp /mnt/hadoop-config/* $HADOOP_PREFIX/etc/hadoop/
fi

# replace ssh config file if provided
if [ -f /mnt/hadoop-config/ssh_config ]; then
	cp /mnt/hadoop-config/ssh_config /root/.ssh/config
	chown $(id -u):$(id -g) /root/.ssh/config
	chmod 600 /root/.ssh/config
fi


# start sshd
/usr/sbin/sshd

if [[ $1 == "-d" ]]; then
  cat <<EOF
  Please execute then following commands for the startup(hadoop-master):
	./init-namenode.sh

  or execute then following commands to start yarn and dfs nodes (hadoop-master): 
	sbin/start-dfs.sh
	sbin/start-yarn.sh
EOF
  sbin/start-dfs.sh
  sbin/start-yarn.sh
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
