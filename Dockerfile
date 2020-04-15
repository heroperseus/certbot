# 基础镜像
FROM alpine:latest

# 作者信息
MAINTAINER patrickwu "wuchunhuan@gmail.com"

# 修改源
RUN echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/latest-stable/community/" >> /etc/apk/repositories                                                                                         

# 安装需要的软件
RUN apk update && \
    apk add --no-cache certbot openssl

RUN echo "30       1       *       *       0       certbot renew >> /root/certbotlog/renew.log" >> /etc/crontabs/root

VOLUME /etc/letsencrypt /var/lib/letsencrypt /root/certbotlog

CMD crond -f
