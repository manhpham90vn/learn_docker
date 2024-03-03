# Docker
## Container
Container is operating system-level virtualization or application-level virtualization over multiple network resources so that software applications can run in isolated user spaces called containers in any cloud or non-cloud environment, regardless of type or vendor

## Docker
Docker is a set of platform as a service (PaaS) products that use OS-level virtualization to deliver software in packages called containers

## Container benefits
1. **Portability**: Containers encapsulate an application and all its dependencies, ensuring consistent behavior across different environments, from development to production. This portability makes it easier to move applications between different computing environments, such as between on-premises servers and the cloud.

2. **Isolation**: Containers provide a level of isolation for applications, ensuring that they run independently of each other and without interference. This isolation enhances security by limiting the impact of any vulnerabilities or misconfigurations in one container on others running on the same host.

3. **Efficiency**: Containers are lightweight compared to virtual machines, as they share the host operating system's kernel and resources. This means you can run more containers on the same hardware infrastructure, leading to better resource utilization and cost savings.

4. **Speed**: Containers can be started and stopped quickly, often in seconds, allowing for rapid scaling and deployment of applications. This agility is particularly valuable in dynamic environments where workloads fluctuate frequently.

5. **Consistency**: Containers package applications along with their dependencies and configurations, ensuring consistency between development, testing, and production environments. This consistency reduces the likelihood of "it works on my machine" issues and simplifies the deployment process.

6. **Scalability**: Containers are designed to be easily scalable, both vertically (by increasing resources allocated to a container) and horizontally (by deploying multiple instances of the same container). This scalability is essential for handling varying workloads and ensuring high availability.

7. **DevOps enablement**: Containers fit well into DevOps workflows, facilitating continuous integration and continuous deployment (CI/CD) pipelines. They enable developers to package, ship, and run applications consistently across different stages of the development lifecycle, streamlining the development process.

8. **Microservices architecture support**: Containers are well-suited for building and deploying microservices-based applications, where each service is packaged and deployed independently. This architecture promotes modularity, scalability, and flexibility in application design.

## Network Type
1. **Bridge Network:**
- **Description:** Bridge networks are the default networks created when Docker is installed. They allow containers to communicate with each other on the same Docker host.
- **Example:**
```bash
docker network create my_bridge_network

docker run -d --name container1 --network=my_bridge_network nginx

ocker run -d --name container2 --network=my_bridge_network nginx
```

2. **Host Network:**
- **Description:** Host networks allow containers to use the host's network stack directly, bypassing Docker's network isolation. This can provide better performance but reduces container isolation.
```bash
docker run -d --name container3 --network=host nginx
```

3. **Overlay Network:**
- **Description:** Overlay networks are used in Docker Swarm mode to enable communication between containers across multiple Docker hosts.
- This network is typically used within Docker Swarm mode configurations rather than standalone Docker commands.

4. **Macvlan Network:**
- **Description:** Macvlan networks assign MAC addresses to containers, allowing them to appear as physical devices on the network. This is useful when containers need to be directly addressable.
```bash
docker network create -d macvlan --subnet=192.168.1.0/24 --gateway=192.168.1.1 -o parent=eth0 my_macvlan_network

docker run -d --name container1 --network=my_macvlan_network nginx
```

5. **None Network:**
- **Description:** None networks provide no network connectivity to containers. This can be useful for containers that don't require network access.
```bash
docker run -d --name container1 --network=none nginx
```

6. **Custom Networks:**
- **Description:** Docker allows users to create custom networks with specific configurations using the `docker network create` command.
```bash
docker network create --subnet=172.18.0.0/16 --gateway=172.18.0.1 my_custom_network

docker run -d --name container1 --network=my_custom_network nginx
```

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

## Docker Utils
- build and deploy
```shell
./build.sh sam 1
```
