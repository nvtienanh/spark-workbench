current_branch := 1.1.0-hadoop2.8-java8
build:
	docker build -t nvtienanh/hadoop-base:$(current_branch) ./base
	docker build -t nvtienanh/hadoop-datanode:$(current_branch) ./datanode
	docker build -t nvtienanh/hadoop-namenode:$(current_branch) ./namenode
	docker build -t nvtienanh/hadoop-nodemanager:$(current_branch) ./nodemanager
	docker build -t nvtienanh/hadoop-historyserver:$(current_branch) ./historyserver
	docker build -t nvtienanh/hadoop-resourcemanager:$(current_branch) ./resourcemanager

# network:
# 	docker network create spark-net
#
# spark:
# 	docker-compose -f docker-compose-minimal.yml up -d
#
# down:
# 	docker-compose -f docker-compose-minimal.yml down
# 	docker-compose -f docker-compose-spark-app.yml down
# 	docker network rm spark-net
#
# spark-app:
# 	docker-compose -f docker-compose-spark-app.yml build
# 	docker-compose -f docker-compose-spark-app.yml up
