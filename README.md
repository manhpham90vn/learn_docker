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