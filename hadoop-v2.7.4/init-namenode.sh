# stop all Hadoop processes
sbin/stop-yarn.sh
sbin/stop-dfs.sh

# format namenode
bin/hadoop namenode -format

# start yarn and dfs nodes
sbin/start-dfs.sh
sbin/start-yarn.sh
