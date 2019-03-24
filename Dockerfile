FROM ubuntu:18.04

RUN apt-get update && apt-get install -y locales apt-transport-https
RUN locale-gen fr_FR.UTF-8

ENV LC_ALL=fr_FR.UTF-8
ENV LANG=fr_FR.UTF-8
ENV LANGUAGE=fr_FR.UTF-8

RUN apt-get install -y --allow-unauthenticated \
wget

RUN apt-get autoremove && apt-get purge

WORKDIR /opt/

RUN wget https://downloads.plex.tv/plex-media-server/1.14.1.5488-cc260c476/plexmediaserver_1.14.1.5488-cc260c476_amd64.deb
RUN dpkg -i plexmediaserver_1.14.1.5488-cc260c476_amd64.deb

RUN rm plexmediaserver_1.14.1.5488-cc260c476_amd64.deb

ADD start.sh start.sh

EXPOSE 32400/tcp 3005/tcp 8324/tcp 32469/tcp 1900/udp 32410/udp 32412/udp 32413/udp 32414/udp 5353/udp

CMD ["sh","/opt/start.sh"]
