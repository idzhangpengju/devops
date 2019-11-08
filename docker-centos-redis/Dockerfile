FROM       centos:latest
# =============================================
# LABEL following the standard set of labels by
# The Open Containers Initiative (OCI)
# =============================================
LABEL      org.opencontainers.image.title="DockerImage - Redis" \
           org.opencontainers.image.authors="zhangpengju" \
           org.opencontainers.image.version="1.0.0" \
           org.opencontainers.image.licenses="MIT" 
# ==============================================================

RUN PKG_BASE_DEPS='epel-release make gcc gcc-c++' \
           && REDIS_PKG_PATH="/root/redis-5.0.5.tar.gz" \
           && REDIS_PKG_ROOT="/root/redis-5.0.5/" \
           && REDIS_PKG_INSTALLED="/opt/redis_5.0.5/" \
           && REDIS_PKG_URL="http://download.redis.io/releases/redis-5.0.5.tar.gz" \
           && cp "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime" \
           && echo "Asia/Shanghai" > "/etc/timezone" \
           && yum -y install "epel-release" \
           && yum -y install ${PKG_BASE_DEPS} \
           && curl -o ${REDIS_PKG_PATH} ${REDIS_PKG_URL} \
           && cd "/root/" \
           && tar -xvz -f ${REDIS_PKG_PATH} \
           && cd ${REDIS_PKG_ROOT} \
           && make V=1 \
           && make PREFIX=${REDIS_PKG_INSTALLED} install \
           && rm -rf ${REDIS_PKG_ROOT} ${REDIS_PKG_PATH} \
           && yum -y autoremove ${PKG_BASE_DEPS} \
           && yum clean all
# ======================================
WORKDIR    /root/
# ======================================
# Using a Docker `entrypoint.sh` and CMD
# ======================================
COPY ./entrypoint.sh /root/
ENTRYPOINT ["sh", "/root/entrypoint.sh"]
CMD ["redis-server"]

