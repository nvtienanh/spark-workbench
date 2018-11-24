current_branch := 2.1.0-hadoop2.8-hive-java8
build:
	docker build -t nvtienanh/spark-base:$(current_branch) ./base
	docker build -t nvtienanh/spark-master:$(current_branch) ./master
	docker build -t nvtienanh/spark-worker:$(current_branch) ./worker
	docker build -t nvtienanh/spark-submit:$(current_branch) ./submit

network:
	docker network create spark-net

spark:
	docker-compose -f docker-compose-minimal.yml up -d

down:
	docker-compose -f docker-compose-minimal.yml down
	docker-compose -f docker-compose-spark-app.yml down
	docker network rm spark-net

spark-app:
	docker-compose -f docker-compose-spark-app.yml build
	docker-compose -f docker-compose-spark-app.yml up
