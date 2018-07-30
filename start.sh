#!/bin/sh

#conf
configFile="/etc/traefik/traefik.toml"

#替换endpoint
sed -i "s;endpoint = \"127.0.0.1:2379\";endpoint = \"${ETCD_ENDPOINT}\";g" ${configFile}
#替换prefix
sed -i "s;prefix = \"/traefik\";prefix = \"${ETCD_PREFIX}\";g" ${configFile}

supervisord -c /etc/traefik/supervisor.conf