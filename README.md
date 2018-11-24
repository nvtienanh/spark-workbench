# Giới thiệu
Đầy là toàn bộ repository của tôi dùng cho nghiên cứu Big Data platform đựa trên [docker-hadoop-workbench](https://github.com/big-data-europe/docker-hadoop-spark-workbench) và có thay đổi đôi chút.

# Build các docker images

Chạy lệnh sau để build các docker image cần thiết:
```
    make build
```

## Chạy spark workbench

```
make up
```

Hiện tại thì chưa hỗ trợ work to scale up spark-workers, chi tiết có thể tham khảo ở [swarm folder](./swarm) 

## Truy cập các module

* Namenode: http://localhost:50070
* Datanode: http://localhost:50075
* Spark-master: http://localhost:8080
* Spark-notebook: http://localhost:9001
* Hue (HDFS Filebrowser): http://localhost:8088

## Count Example for Spark Notebooks
```
val spark = SparkSession
  .builder()
  .appName("Simple Count Example")
  .getOrCreate()

val tf = spark.read.textFile("/data.csv")
tf.count()
```

## Liên hệ
* Anh Nguyen @nvtienanh

