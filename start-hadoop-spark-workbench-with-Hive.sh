#!/bin/bash

docker-compose up -d namenode hive-metastore-postgresql
docker-compose up -d datanode hive-metastore
docker-compose up -d hive-server
docker-compose up -d spark-master spark-worker spark-notebook hdfs-filebrowser

my_ip=`ip route get 1|awk '{print $NF;exit}'`
echo "Namenode: http://${my_ip}:50070"
echo "Datanode: http://${my_ip}:50075"
echo "Spark-master: http://${my_ip}:8080"
echo "Spark-notebook: http://${my_ip}"
echo "Hue (HDFS Filebrowser): http://${my_ip}:8888/home"

