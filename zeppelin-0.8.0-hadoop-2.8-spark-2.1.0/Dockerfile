FROM nvtienanh/spark-base:2.1.0-hadoop2.8-hive-java8
MAINTAINER Anh Nguyen <nvtienanh@gmail.com>

ENV APACHE_SPARK_VERSION 2.1.0
ENV APACHE_HADOOP_VERSION 2.8.5
ENV ZEPPELIN_VERSION 0.8.0

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH
ENV PYSPARK_PYTHON /opt/conda/bin/python
ENV PYSPARK_DRIVER_PYTHON /opt/conda/bin/python
ENV PYTHONPATH /opt/conda/bin/python
RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.5.11-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

ENV TINI_VERSION v0.16.1
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
RUN conda install -y numpy scikit-learn matplotlib pyspark

RUN apt-get update && apt-get install wget
RUN set -x \
    && curl -fSL "http://mirrors.viethosting.com/apache/zeppelin/zeppelin-0.8.0/zeppelin-0.8.0-bin-all.tgz" -o /tmp/zeppelin.tgz \
    && tar -xzvf /tmp/zeppelin.tgz -C /opt/ \
    && mv /opt/zeppelin-* /opt/zeppelin \
    && rm /tmp/zeppelin.tgz

RUN	wget -O /opt/zeppelin/sansa-examples-spark.jar https://github.com/SANSA-Stack/SANSA-Examples/releases/download/v2018-06/sansa-examples-spark_2.11-2018-06.jar
ENV SPARK_SUBMIT_OPTIONS "--jars /opt/zeppelin/sansa-examples-spark.jar"

ENTRYPOINT [ "/usr/bin/tini", "--"]

WORKDIR /opt/zeppelin
COPY shiro.ini conf/shiro.ini
CMD ["/opt/zeppelin/bin/zeppelin.sh"]
