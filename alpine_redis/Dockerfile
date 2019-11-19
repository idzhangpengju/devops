FROM alpine:3.8

LABEL maintainer="pengju.cn@gmail.com" \
    license="MIT" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.vendor="graze" \
    org.label-schema.name="redis-alpine" \
    org.label-schema.description="small redis image based on alpine" 


ENV REDIS_VERSION 5.0.5
ENV REDIS_DOWNLOAD_URL http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz


RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && addgroup -S -g 63799 redis \
    && adduser -u 63799 -S -s /sbin/nologin -G redis redis \
    && apk add --update --no-cache --virtual build-deps gcc make linux-headers musl-dev tar \
    && wget -O redis.tar.gz "$REDIS_DOWNLOAD_URL" \
    && wget -O /usr/bin/gosu https://github.com/tianon/gosu/releases/download/1.11/gosu-amd64 \
    && chmod +x /usr/bin/gosu \
    && mkdir -p /usr/src/redis \
    && mkdir -p /data/redis-data \
    && chown -R redis:redis /data/redis-data \
    && tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1 \
    && rm redis.tar.gz \
    && make -C /usr/src/redis install redis-cli /usr/bin \
    && rm -r /usr/src/redis \
    && apk del build-deps \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

COPY ./entrypoint.sh /root/
#Set port
EXPOSE 6379

ENTRYPOINT ["sh", "/root/entrypoint.sh"]
CMD ["redis-server"]
