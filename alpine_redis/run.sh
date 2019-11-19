#!/bin/bash
# ------------------------------
REDIS_OPTIONS="--loglevel verbose \
               --bind 0.0.0.0 \
               --port 6379 \
               --dir /data/redis-data \
               --requirepass foobar123 \
               --maxclients 10000 \
               --timeout 0 \
               --tcp-keepalive 300 \
               --daemonize no \
               --supervised no \
               --pidfile none \
               --databases 32 \
               --always-show-logo yes \
               --appendonly yes \
               --appendfsync everysec"
# ------------------------------

if [ ! -d /data/redis-data ]; then 
      mkdir -p /data/redis-data 
      chown -R 63799:63799 /data/redis-data
else
      chown -R 63799:63799 /data/redis-data
fi
      
sudo docker run -d -i -t \
                --env LC_ALL=en_US.UTF-8 \
                --name redis-alpine \
                -v /data/redis-data:/data/redis-data \
                -p 0.0.0.0:63799:6379 \
                registry.cn-shenzhen.aliyuncs.com/ruanyu/redis:v1.0 \
                redis-server ${REDIS_OPTIONS}
