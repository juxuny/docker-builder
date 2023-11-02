BASE_IMAGE="registry.cn-shenzhen.aliyuncs.com/juxuny-public/builder"
docker pull mysql:8.0.34
docker tag mysql:8.0.34 $BASE_IMAGE:mysql-8.0.34
docker push $BASE_IMAGE:mysql-8.0.34

docker tag mysql:8.0.34 registry.cn-shenzhen.aliyuncs.com/juxuny/mysql:8.0.34
docker push registry.cn-shenzhen.aliyuncs.com/juxuny/mysql:8.0.34
