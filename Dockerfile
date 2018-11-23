FROM traefik:v1.7.4-alpine
#alpine-3.8

#对应etcd配置路径
ENV ETCD_PREFIX "/traefik"
#对应etcd endpoint
ENV ETCD_ENDPOINT "127.0.0.1:2379"
#etcd support version
ENV ETCD_VERSION "v3"

COPY traefik.toml /etc/traefik/traefik.toml
COPY start.sh /start.sh

RUN echo "http://mirrors.aliyun.com/alpine/v3.8/main/" > /etc/apk/repositories && \
    echo "https://mirrors.aliyun.com/alpine/v3.8/community/" >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache ca-certificates tzdata bash curl && \
    /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo 'Asia/Shanghai' > /etc/timezone

#COPY supervisor.conf /etc/traefik/supervisor.conf
#COPY --from=ochinchina/supervisord:latest /usr/local/bin/supervisord /usr/local/bin/supervisord

#web port
EXPOSE 10000
#manager port
EXPOSE 10001

ENTRYPOINT ["/bin/sh"]
CMD ["/start.sh"]
