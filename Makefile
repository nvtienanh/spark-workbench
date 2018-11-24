build:	
	docker build -t nvtienanh/hadoop-base:1.1.0-hadoop2.8-java8 ./hadoop-1.1.0-hadoop2.8-java8/base
	docker build -t nvtienanh/hadoop-datanode:1.1.0-hadoop2.8-java8 ./hadoop-1.1.0-hadoop2.8-java8/datanode
	docker build -t nvtienanh/hadoop-namenode:1.1.0-hadoop2.8-java8 ./hadoop-1.1.0-hadoop2.8-java8/namenode
	docker build -t nvtienanh/hadoop-nodemanager:1.1.0-hadoop2.8-java8 ./hadoop-1.1.0-hadoop2.8-java8/nodemanager
	docker build -t nvtienanh/hadoop-historyserver:1.1.0-hadoop2.8-java8 ./hadoop-1.1.0-hadoop2.8-java8/historyserver
	docker build -t nvtienanh/hadoop-resourcemanager:1.1.0-hadoop2.8-java8 ./hadoop-1.1.0-hadoop2.8-java8/resourcemanager
	docker build -t nvtienanh/spark-base:2.1.0-hadoop2.8-hive-java8 ./spark-2.1.0-hadoop2.8-hive-java8/base
	docker build -t nvtienanh/spark-master:2.1.0-hadoop2.8-hive-java8 ./spark-2.1.0-hadoop2.8-hive-java8/master
	docker build -t nvtienanh/spark-worker:2.1.0-hadoop2.8-hive-java8 ./spark-2.1.0-hadoop2.8-hive-java8/worker
	docker build -t nvtienanh/spark-submit:2.1.0-hadoop2.8-hive-java8 ./spark-2.1.0-hadoop2.8-hive-java8/submit	
	docker build -t nvtienanh/hue-base:latest ./hdfs-filebrowser/hue-base
	docker build -t nvtienanh/hue:latest ./hdfs-filebrowser/hue	
	docker build -t nvtienanh/hive:2.3.2-postgresql-metastore ./hive-2.3.2-postgresql-metastore
	docker build -t nvtienanh/hive-metastore-postgresql:2.3.0 ./hive-metastore-postgresql-2.3.0	
	docker build -t nvtienanh/zeppelin:zeppelin-0.8.0-hadoop2.8-spark-2.1.0 ./zeppelin-0.8.0-hadoop-2.8-spark-2.1.0
up:
	docker network create spark-net
	docker-compose up -d
	docker-compose -f docker-compose-hive.yml up -d namenode hive-metastore-postgresql
	docker-compose -f docker-compose-hive.yml up -d datanode hive-metastore
	docker-compose -f docker-compose-hive.yml up -d hive-server
	docker-compose -f docker-compose-hive.yml up -d spark-master spark-worker spark-notebook hdfs-filebrowser

down:	
	docker-compose -f docker-compose-hive.yml stop hive-metastore-postgresql
	docker-compose -f docker-compose-hive.yml stop hive-metastore
	docker-compose -f docker-compose-hive.yml stop hive-server
	docker-compose down
	docker network rm spark-net
