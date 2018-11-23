#!/bin/sh

#conf
configFile="/etc/traefik/traefik.toml"

#替换endpoint
sed -i "s;endpoint = \"127.0.0.1:2379\";endpoint = \"${ETCD_ENDPOINT}\";g" ${configFile}
#替换prefix
sed -i "s;prefix = \"/traefik\";prefix = \"${ETCD_PREFIX}\";g" ${configFile}
#替换etcd版本
if [ "$ETCD_VERSION" == "v3" ];then
    sed -i "s;#useAPIV3 = true;useAPIV3 = true;g" ${configFile}
fi

#supervisord -c /etc/traefik/supervisor.conf
traefik --configFile=/etc/traefik/traefik.toml
