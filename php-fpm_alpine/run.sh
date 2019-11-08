docker build -t registry.cn-shenzhen.aliyuncs.com/ruanyu/php:latest .
docker run -d --name php-fpm -p 9000:9000 -v /data/webs/test.uoou.net:/data/webs/test.uoou.net zhangpengju/php-fpm:7.2

