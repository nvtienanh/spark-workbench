FROM openjdk:8
MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

RUN apt-get update
RUN apt-get install -y git
# RUN apt-get install -y ant
RUN apt-get install -y gcc
RUN apt-get install -y g++
RUN apt-get install -y libkrb5-dev
RUN apt-get install -y default-libmysqlclient-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y libsasl2-dev
RUN apt-get install -y libsasl2-modules-gssapi-mit
RUN apt-get install -y libsqlite3-dev
RUN apt-get install -y libtidy-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libxslt-dev
RUN apt-get install -y libffi-dev
RUN apt-get install -y make
RUN apt-get install -y maven
RUN apt-get install -y libldap2-dev
RUN apt-get install -y python-dev
RUN apt-get install -y python-setuptools
RUN apt-get install -y libgmp3-dev
RUN apt-get install -y libz-dev
# RUN apt-get install -y libxslt-devel libxml2-devel libxml2 libxml2-devel libxml2-python libxslt libxslt-devel

# Installs Ant
ENV ANT_VERSION 1.9.6

COPY apache-ant-1.9.6-bin.tar.gz /

RUN tar -xzf apache-ant-${ANT_VERSION}-bin.tar.gz && \
    mv apache-ant-${ANT_VERSION} /opt/ant && \
    rm apache-ant-${ANT_VERSION}-bin.tar.gz

ENV ANT_HOME /opt/ant
ENV PATH ${PATH}:/opt/ant/bin

RUN mkdir -p /opt/hue
WORKDIR /opt/hue

RUN git clone https://github.com/cloudera/hue.git ./
# RUN git checkout branch-4.2
# RUN make apps
# WORKDIR hue
RUN make apps
EXPOSE 8888
VOLUME /opt/hue/desktop/
# ADD entrypoint.sh /entrypoint.sh
# RUN chmod a+x /entrypoint.sh

# COPY common_header.mako /opt/hue/desktop/core/src/desktop/templates/common_header.mako

EXPOSE 8088

# ENTRYPOINT ["/entrypoint.sh"]
CMD ["build/env/bin/hue", "runserver_plus", "0.0.0.0:8088"]
