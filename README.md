## traefik etcd
以etcd v3为后端的traefik代理服务
### 支持方
* [traefik.io](https://traefik.io)
* [docker store traefik](https://store.docker.com/images/traefik)
* [github traefik](https://github.com/containous/traefik)
* [github etcd](https://github.com/etcd-io/etcd)
### 镜像使用
```
docker run -d -it --restart=alwasy \
-p 10000:10000 \
-p 10001:10001 \
-e ETCD_PREFIX="/traefik/test" \
-e ETCD_ENDPOINT="127.0.0.1:2379" \
--name my-traefik-etcd-v3 \
registry.eoffcn.com/base/etcd
```
### 版本
v1.7.4
```
Bug fixes:

[acme] Support custom DNS resolvers for Let's Encrypt. (#4101 by ldez)
[acme] fix: netcup and DuckDNS. (#4094 by ldez)
[authentication,logs,middleware] Fix display of client username field (#4093 by Ullaakut)
[authentication,middleware] Nil request body with retry (#4075 by ldez)
[consul,consulcatalog,docker,ecs,k8s,marathon,mesos,rancher] Add flush interval option on backend (#4112 by juliens)
[consulcatalog,docker,ecs,marathon,mesos,rancher] Remove the trailing dot if the domain is not defined. (#4095 by ldez)
[docker] Provider docker shutdown problem (#4122 by juliens)
[k8s] Add default path if nothing present (#4097 by SantoDE)
[k8s] Add the missing pass-client-tls annotation to the kubernetes provider (#4118 by jbdoumenjou)
[logs] Fix access log field parsing (#4113 by Ullaakut)
[middleware] Add static redirect (#4090 by SantoDE)
[rules] Add keepTrailingSlash option (#4062 by juliens)
[rules] Case insensitive host rule (#3931 by bgandon)
[tls] Fix certificate insertion loop to keep valid certificate and ignore the bad one (#4050 by jbdoumenjou)
[webui] Typo in the UI. (#4096 by ldez)
Documentation:

[acme] Adds the note: acme.domains is a startup configuration (#4065 by geraldcroes)
[acme] exoscale move from .ch to .com (#4130 by greut)
[acme] Fixing a typo. (#4124 by konovalov-nk)
[acme] Add a note about TLS-ALPN challenge. (#4106 by ldez)
[acme] Clarify DuckDNS does not support multiple TXT records (#4061 by KnicKnic)
[docker] Domain is also optional for "normal" mode (#4086 by herver)
[provider] Fix mistake in the documentation of several backends (#4133 by whalehub)
Replaces emilevauge/whoami by containous/whoami in the documentation (#4111 by geraldcroes)
Uses ASCII characters to spell Traefik (#4063 by geraldcroes)
```
