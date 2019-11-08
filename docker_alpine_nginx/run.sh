#docker build -t zhangpengju/nginx:1.14.2_v1 .
docker build -t registry.cn-shenzhen.aliyuncs.com/ruanyu/nginx:latest .
docker run -ti --restart=always --name nginx -p 80:80 -v /data/webs/test.uoou.net:/data/webs/test.uoou.net -v /data/logs/nginx:/var/log/nginx -m 1048m  --memory-swap=1048m  --cpu-shares=256 zhangpengju/nginx:1.14.2_v1 bash

