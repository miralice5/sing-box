FROM ubuntu:20.04
LABEL maintainer="Alireza Gharib <alirezagharib110@gmail.com>"

WORKDIR /root
RUN cd /root
#RUN apt install sudo
RUN apt-get update
RUN apt upgrade -y
RUN apt install libevent-dev libssl-dev openssl libz-dev wget iptables unzip wget gzip -y
RUN apt install tzdata -y
RUN wget https://github.com/WhalersGang/Sing-Box-Bins/releases/download/v1.0/sing-box165
RUN chmod +x ./sing-box165
RUN mkdir -p /etc/sing-box
RUN touch /etc/sing-box/config.json

VOLUME /etc/sing-box
ENV TZ=Asia/Tehran
CMD /root/sing-box165 run -c /etc/sing-box/config.json
