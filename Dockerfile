FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y git build-essential openssl python3 wget && \
    git clone https://github.com/TelegramMessenger/MTProxy.git /opt/MTProxy && \
    cd /opt/MTProxy && make

WORKDIR /opt/MTProxy

ENV SECRET=00000000000000000000000000000000
ENV PORT=443

CMD ["bash", "-c", "./objs/bin/mtproto-proxy -u nobody -p 8888 -H $PORT -S $SECRET --aes-pwd ./proxy-secret ./proxy-multi.conf -M 1"]
