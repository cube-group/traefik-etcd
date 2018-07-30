FROM traefik:1.6.5-alpine
#alpine-3.6

USER root

#对应etcd配置路径
ENV ETCD_PREFIX "/traefik"
#对应etcd endpoint
ENV ETCD_ENDPOINT "127.0.0.1:2379"

COPY traefik.toml /etc/traefik/traefik.toml
COPY supervisor.conf /etc/traefik/supervisor.conf
COPY start.sh /start.sh
COPY --from=ochinchina/supervisord:latest /usr/local/bin/supervisord /usr/local/bin/supervisord

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/sh","/start.sh"]