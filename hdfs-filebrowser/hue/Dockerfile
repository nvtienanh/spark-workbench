FROM nvtienanh/hue-base:latest
MAINTAINER Anh Nguyen <nvtienanh@gmail.com>

RUN mkdir -p /opt/hue
WORKDIR /opt/hue
RUN git clone https://github.com/cloudera/hue.git ./
RUN make apps

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

EXPOSE 8888
# VOLUME /hue/opt/desktop/
ENTRYPOINT ["/entrypoint.sh"]
CMD ["build/env/bin/hue", "runserver_plus", "0.0.0.0:8888"]