FROM nvtienanh/hue-base:latest
MAINTAINER Anh Nguyen <nvtienanh@gmail.com>

RUN useradd -p $(echo "hue" | openssl passwd -1 -stdin) hue; \
    useradd -p $(echo "hdfs" | openssl passwd -1 -stdin) hdfs; \
    groupadd supergroup; \
    usermod -a -G supergroup hue; \
    usermod -a -G hdfs hue
    
RUN mkdir -p /opt/hue
WORKDIR /opt/hue
RUN git clone https://github.com/cloudera/hue.git ./
# RUN git checkout branch-3.11
RUN make apps

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
# COPY common_header.mako /opt/hue/desktop/core/src/desktop/templates/common_header.mako
RUN rm -rf /opt/hue/desktop/conf.dist

EXPOSE 8888
VOLUME /hue/opt/desktop/
ENTRYPOINT ["/entrypoint.sh"]
CMD ["build/env/bin/hue", "runserver_plus", "0.0.0.0:8888"]