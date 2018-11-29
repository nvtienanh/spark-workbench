FROM nvtienanh/hadoop-base:1.1.0-hadoop2.8-java8

MAINTAINER Erika Pauwels <erika.pauwels@tenforce.com>
MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

ENV ENABLE_INIT_DAEMON true
ENV INIT_DAEMON_BASE_URI http://identifier/init-daemon
ENV INIT_DAEMON_STEP spark_master_init

COPY wait-for-step.sh /
COPY execute-step.sh /
COPY finish-step.sh /

RUN apt-get update \
      && apt-get install -y wget \
      && wget https://www.dropbox.com/s/hcdwi3p8mnnwmby/spark-2.1.2-SNAPSHOT-bin-spark-2.1.0-hive.tgz \
      && apt-get --purge remove -y wget \
      && tar -xvzf spark-2.1.2-SNAPSHOT-bin-spark-2.1.0-hive.tgz \
      && mv spark-2.1.2-SNAPSHOT-bin-spark-2.1.0-hive spark \
      && rm spark-2.1.2-SNAPSHOT-bin-spark-2.1.0-hive.tgz \
      && cd /

ENV SPARK_HOME /spark
ENV SPARK_CONF_DIR /spark/conf

COPY hive-site.xml /spark/conf/
COPY hive-site.xml /opt/hive/conf/
COPY entrypoint.sh /usr/local/bin/

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
RUN conda install -y numpy scikit-learn matplotlib pyspark py4j

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
