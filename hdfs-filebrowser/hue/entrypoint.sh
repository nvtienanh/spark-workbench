#!/bin/bash

HUE_HOME="/opt/hue/"
HUE_CONFIG_FILE="$HUE_HOME/desktop/conf/pseudo-distributed.ini"
# APP_BLACKLIST="search,security,pig,zookeeper,impala,rdbms,spark,hbase,sqoop,jobsub,about"
APP_BLACKLIST="search,pig,zookeeper,impala,spark,sqoop,hbase,jobsub"

sed -i "s#.*blacklist.*#  app_blacklist=$APP_BLACKLIST#g" $HUE_CONFIG_FILE
sed -i "s#.*webhdfs_url.*#  webhdfs_url=http://$NAMENODE_HOST:50070/webhdfs/v1#g" $HUE_CONFIG_FILE
sed -i "s#.*hive_server_host.*#  hive_server_host=localhost#g" $HUE_CONFIG_FILE
sed -i "s#.*hive_server_port.*#  hive_server_port=10000#g" $HUE_CONFIG_FILE
sed -i "s#.*hive_conf_dir.*#  hive_conf_dir=/opt/hive/conf#g" $HUE_CONFIG_FILE
sed -i "s#.*enable_new_create_table.*#  enable_new_create_table=true#g" $HUE_CONFIG_FILE
sed -i "s#.*force_hs2_metadata.*#  force_hs2_metadata=true#g" $HUE_CONFIG_FILE

exec $@
