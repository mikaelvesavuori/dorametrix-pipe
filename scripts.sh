docker build -t mikaelvesavuori/dorametrix-pipe:0.0.1 .
docker run -ti --rm mikaelvesavuori/dorametrix-pipe:0.0.1 abc
docker push

docker buildx build --platform linux/amd64 --push -t mikaelvesavuori/dorametrix-pipe:0.0.1 .
