FROM alpine:3.17
MAINTAINER Roger <roger.rain@gmail.com>

RUN apk add --no-cache wget
RUN if [ ! -d /hdhomerun ];then mkdir /hdhomerun; fi
RUN if [ ! -d /hdhomerun/video ];then mkdir /hdhomerun/video; fi
RUN if [ ! -d /hdhomerun/etc ];then mkdir /hdhomerun/etc; fi
RUN if [ ! -d /hdhomerun/bin ];then mkdir /hdhomerun/bin; fi
ADD hdhomerun.conf /hdhomerun/etc/
WORKDIR /homerun/bin
ADD hdhomerun_start.sh /hdhomerun/bin/
RUN curl -O -L http://download.silicondust.com/hdhomerun/hdhomerun_record_linux
RUN chmod 755 /hdhomerun/bin
RUN chmod 755 /hdhomerun/etc
RUN chmod 777 /hdhomerun/video
RUN chmod 755 /hdhomerun/bin/*
RUN chmod 744 /hdhomerun/etc/*
EXPOSE 137 138 139 65001

CMD ["/hdhomerun/bin/hdhomerun_start.sh"]
 
