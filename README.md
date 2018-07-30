## traefik etcd 基础镜像
### 环境变量
* ETCD_PREFIX: 对应etcd中的prefix
* ETCD_ENDPOINT: etcd配置例如:127.0.0.1:2379

### docker run
```shell
docker run -d -it --restart=always \
    -e ETCD_PREFIX="/traefik/prod" \
    -e ETCD_ENDPOINT="127.0.0.1:2379" \
    -p 10000:10000 \
    -p 10001:10001 \
    --name traefik traefik-etcd-image-name
```
