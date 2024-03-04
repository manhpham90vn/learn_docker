## Command
### Container
- list running container
```shell
docker ps -a
```

- run container
```shell
docker run -p 3000:3000 <container id/names>

docker run -it -p 3000:3000 <container id/names> sh

# bind mount
docker run -d \
    -it \
    -p 3000:3000 \
    --mount type=bind,source="$(pwd)",target=/app \
    <container id/names> \ 
    sh

# bind mount
# ensure node_modules not overwrite by bind mout
docker run -d \
    -it \
    -p 3000:3000 \
    -v "$(pwd)":/app \
    -v /app/node_modules \
    <container id/names> \ 
    sh

# mount docker volume: myVolume
docker run -d \
    --rm \
    -it \
    -v myVolume:/app \
    -p 3000:3000 \
    <container id/names> \
    sh

# env
docker run -d \
    --env PORT=8080   
    <container id/names> \
    sh

# env file
# need define in Dockerfile: ENV PORT=80
docker run -d \
    --env-file .env
    <container id/names> \
    sh    

# arg
# need define in Dockerfile: ARG PORT=80
docker run -d \
    --build-arg PORT=8080    
    <container id/names> \
    sh

# network
docker run -d \
    --network myNetwork \
    <container id/names> \
    sh 

# bind localhost
docker run -it \
    --rm \
    --add-host=host.docker.internal:host-gateway \
    alpine
    sh
```

- start new command
```shell
docker exec -it --user root <container id/names> sh
```

- stop container
```shell
docker stop <container id/names>
```

- remove container
```shell
docker rm <container id/names>
```

- remove all unused container
```shell
docker container prune -f
```

- Copy file to container
```shell
docker cp foo.txt <container id/names>:/tmp/foo.txt
```

- Copy file from container
```shell
docker cp <container id/names>:/tmp/. /tmp/out
```

- Inspect container
```shell
docker container inspect <container id/names>
```

### Images
- build image
```shell
docker build . -t org/foo:1.0
docker build . -t org/foo:1.0 -f Dockerfile.dev
```

- list all images
```shell
docker images
```

- delete image
```shell
docker rmi <container id/names> -f
```

- remove all unused images
```shell
docker image prune -a -f
```

- inspect image
```shell
docker image inspect <container id/names>
```

### Volume
- list volume
```shell
docker volume ls
```

- remove all unused images
```shell
docker volume prune -f
```

- remove volume
```shell
docker volume rm <volume id/names>
```

### Network
- list network
```shell
docker network ls
```

- create network
```shell
docker network create myNetwork
```

- remove all network
```shell
docker network prune -f
```

### Log
```shell
docker logs -f <container id/names>
```

### Docker compose
```shell
docker-compose up -d --build app php mysql
```

- run command
```shell
docker-compose run --rm app init -y
docker-compose run --rm app install
docker-compose run --rm --build app install express
```