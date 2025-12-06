Docker





What is a docker?

-> Docker is an open-source containerization platform used to build, package, ship, and run applications inside isolated environments called containers.

-> Docker uses OS-level virtualization to run applications in isolated environments without requiring a full virtual machine.

-> Makes deployment and development efficient.







What is a container?

-> A container is a lightweight, executable package that includes an application, its dependencies, runtime, configuration, and system tools.

-> It can be easily shared.

-> Makes deployment and development efficient.

-> Containers share the host OS kernel, which makes them faster, smaller, and more efficient than virtual machines.







Architecture of Docker

1\. Docker Client (CLI)

&nbsp;  - Used to execute commands (`docker build`, `docker run`, `docker pull`, etc.)



2\. Docker Daemon (dockerd)

&nbsp;  - Responsible for managing containers, images, networks, and volumes.



3\. Docker Engine API

&nbsp;  - Communication layer between Docker client and daemon.



4\. Docker Registry

&nbsp;  - Stores and distributes images (e.g., Docker Hub, AWS ECR, GCP Artifact Registry).







Container Contains

* Application code
* Runtime environment (Python/Node/Java etc.)
* Dependencies and packages
* Configuration and environment variables







Docker Containers

-> Low impact on OS, very fast, low disk space usage

-> Sharing re-building and distribution is easy

-> Encapsulate apps instead of whole machine



VMs

-> High impact in OS, slower, high disk space usage

-> Sparing, re-building and distribution is challenging.

-> Encapsulate whole machine.



| Feature      | Docker Containers            | Virtual Machines                      |

| ------------ | ---------------------------- | ------------------------------------- |

| Kernel       | Share host OS kernel         | Have separate guest OS                |

| Startup Time | Seconds                      | Minutes                               |

| Size         | MBs                          | GBs                                   |

| Performance  | Near-native                  | Slower due to hardware virtualization |

| Use Cases    | Microservices, CI/CD, DevOps | Monolithic apps, Full OS isolation    |



Containers virtualize the OS, whereas VMs virtualize hardware.







Main components of Docker

* Dockerfile → Blueprint for creating an image
* Docker Image → Read-only package built using Dockerfile
* Docker Container → Running instance of the image
* Docker Registry → Storage for images (Docker Hub, private registry)



Dockerfile --> docker build --> Image

Image --> docker run --> Container



Docker uses a layered filesystem (UnionFS) to optimize storage and reuse layers across images.







Docker Registry

A Docker registry is a centralized service used to store, manage, and distribute Docker images.

Examples: Docker Hub, GitHub Container Registry, AWS ECR, Google Artifact Registry.







Installing Docker and Configuration

Docker installation involves setting up the Docker Engine, which includes the Docker Daemon (dockerd), Docker CLI, and required runtime components.



After installation, common setup steps are:

sudo systemctl start docker

sudo systemctl enable docker

docker --version

docker info



| Task                     | Purpose                              | Command                         |

| ------------------------ | ------------------------------------ | ------------------------------- |

| Add user to docker group | Run Docker without `sudo`            | `sudo usermod -aG docker $USER` |

| Verify daemon is running | Ensure service health                | `systemctl status docker`       |

| Pull a test image        | Verify network + registry connection | `docker pull hello-world`       |







Working on Docker



A Dockerfile is a text file containing a set of instructions that defines how a Docker image should be built including base image, dependencies, environment variables, working directory, and startup command.

Example structure:

&nbsp;	FROM node:18

&nbsp;	WORKDIR /app

&nbsp;	COPY . .

&nbsp;	RUN npm install

&nbsp;	CMD \["npm", "start"]



Then we build the image:

&nbsp;	docker build -t myapp:latest .



And run a container from that image:

&nbsp;	docker run -d --rm --name "myapp" -p 3000:3000 myapp:latest

&nbsp;		-d: 	to run container in detached mode

&nbsp;		-rm:	to remove the container as and when the container is stopped

&nbsp;		-name:	to name the container according to our will

&nbsp;		-p:	for port binding to user machine



Note:

&nbsp;	docker build → Creates an image from a Dockerfile

&nbsp;	docker run → Starts a container from an image

&nbsp;	docker ps → Shows running containers

&nbsp;	docker stop / rm → Stop \& remove containers

&nbsp;	docker images → Lists stored images







You can run multiple containers from the same Docker image without any conflict because each container runs in its own isolated environment. Each container can map its internal ports to different host ports, which allows multiple instances of the same application to run simultaneously.



Containers can expose the same internal port, but must have unique host port mappings.



Container isolation is achieved using:

&nbsp;	Namespaces (process, mount, network, user)

&nbsp;	Control Groups (cgroups) for resource limits

&nbsp;	UnionFS layers for filesystem isolation.



**Docker allows multiple container instances from the same image because containers share the OS kernel but have isolated userspace environments.**







Tagging a image

Docker images are tagged to identify versions and repositories.



Syntax while building:

&nbsp;   docker build -t myapp:01 .



Multiple tags:

&nbsp;   docker build -t myapp:latest -t myapp:01 .



Tag an existing image:

&nbsp;   docker tag myapp:01 myrepo/myapp:01







Benefit of using docker and containers:

Docker allows version control of images, meaning older versions are not lost when a new version is created. You can run multiple versions of the same application simultaneously to test changes without affecting production.





1\. Consistency Across Environments

&nbsp;  - "Works on my machine" issue is eliminated since the same image runs everywhere.

2\. Portability

&nbsp;  - Containers can run on any environment that supports Docker (Linux, Windows, cloud, on-prem).

3\. Faster Deployment

&nbsp;  - Containers start within seconds since they share the host OS kernel.

4\. Lightweight

&nbsp;  - Containers consume fewer resources compared to virtual machines.

5\. Scalability

&nbsp;  - Containers are easy to scale horizontally using orchestration tools like Docker Swarm or Kubernetes.

6\. Version Control of Images

&nbsp;  - You can maintain multiple tagged versions of the same image and run them simultaneously for testing or rollback.

7\. Resource Isolation

&nbsp;  - Docker uses namespaces and cgroups to provide process-level isolation and resource limits.

8\. CI/CD Friendly

&nbsp;  - Works seamlessly with pipelines and automation tools (Jenkins, GitHub Actions, GitLab CI, ArgoCD).



Docker improves developer productivity, ensures consistent runtime environments, accelerates deployments, and provides versioned and isolated workloads suitable for modern DevOps and microservices architecture.







Pre-defined Docker Images:

Docker provides official base images such as node, python, nginx, mysql, and postgres which are maintained and verified by the Docker team or trusted organizations. These images can be used as a starting point to build custom application images.



Types of Docker Images Available:



1\. Official Images

&nbsp;  - Verified and maintained by Docker or trusted vendors.

&nbsp;  - Examples: node, python, ubuntu, postgres, nginx.

2\. Community Images

&nbsp;  - Created and published by users.

&nbsp;  - May or may not be trusted.

3\. Private Images

&nbsp;  - Organization-specific images stored in private registries like AWS ECR, GitHub Container Registry, GCP Artifact Registry, or Harbor.







**NGINX**

NGINX is a high-performance web server that can also act as a reverse proxy, load balancer, and caching server. It is widely used to serve static content and route traffic efficiently for modern web applications.

NGINX is a lightweight, fast, and scalable web server originally designed to handle thousands of simultaneous client connections using an asynchronous, event-driven architecture.



In DevOps and cloud environments, NGINX is commonly used as:

| Role          | Purpose                                                                        |

| ------------- | ------------------------------------------------------------------------------ |

| Web Server    | Serves static files (HTML, CSS, JS, images)                                    |

| Reverse Proxy | Forwards client requests to backend applications (Node.js, Python, Java, etc.) |

| Load Balancer | Distributes traffic across multiple backend servers                            |

| Cache Layer   | Stores frequently accessed responses to improve performance                    |

| API Gateway   | Controls, routes, and manages API traffic                                      |



NGINX is an event-driven web server commonly used as a reverse proxy and load balancer because it efficiently handles large amounts of concurrent traffic, making it ideal for microservices and containerized environments.







Creating a interactive Docker Image

You can run a Docker container in interactive mode (with terminal access) using the -it flag.

This allows you to interact with the container shell as if you were inside a Linux environment.



&nbsp;	docker run -it <image\_name\_or\_id> /bin/bash



| Flag | Meaning                             |

| ---- | ----------------------------------- |

| `-i` | Interactive mode (keeps STDIN open) |

| `-t` | Allocates a pseudo-terminal (TTY)   |





Useful related commands:

&nbsp;   docker exec -it <container\_id> /bin/bash   → Open terminal in a running container

&nbsp;   docker start -ai <container\_id>            → Start a stopped container interactively

&nbsp;   exit                                       → Leave the container shell







Pulling the images

Pulling an image means downloading it from a container registry (such as Docker Hub) to your local system so it can be used to create containers.

&nbsp;	docker pull <image\_name>

If no tag is specified, Docker pulls the default `latest` tag.



Useful related commands:

&nbsp;   docker images            → List downloaded images

&nbsp;   docker search <image>    → Search for images on Docker Hub

&nbsp;   docker rmi <image>       → Remove a local image

&nbsp;   docker inspect <image>   → View image metadata







Docker Volume

A Docker volume is a storage mechanism used to persist data generated by containers so that the data remains available even after the container stops, restarts, or is deleted.

Docker volumes allow containers to store data outside their writable layer.

Since container filesystems are temporary and isolated, any data written inside a container is normally lost when the container is removed. Volumes solve this by providing persistent storage that exists independently of the container lifecycle.



Volumes are used for:

* Database storage (MySQL, PostgreSQL, MongoDB)
* Logs and configuration files
* Shared storage between multiple containers
* Backups and recovery



Important commands:

&nbsp;	docker volume create mydata			→ Create a volume

&nbsp;	docker run -d -v mydata:/var/lib/mysql MySQL	→ Run a container using volume

&nbsp;	docker volume ls				→ List volume

&nbsp;	docker volume inspect mydata			→ Inspect a volume

&nbsp;	docker volume rm mydata				→ Remove a volume



Volumes are the recommended method for managing persistent data in Docker because they provide better performance, are easy to back up, and are fully managed by Docker.







Bind Mount

A bind mount allows a file or directory from the host machine’s filesystem to be mounted into a container. This means the container directly accesses and uses the host’s file or folder, and any changes made inside the container reflect immediately on the host and vice-versa.



Bind mounts are useful for:

* Local development (code changes update live inside the running container)
* Testing configurations without rebuilding images
* Sharing logs or configuration files between host and container



Unlike Docker-managed volumes, bind mounts are not fully controlled by Docker. They depend on:

* Host directory path
* Host system permissions
* File system structure

So they are powerful but can create issues if paths change or permissions are wrong.



docker run -d -p 3000:3000 -v /home/user/app:/usr/src/app node



| Component        | Meaning                    |

| ---------------- | -------------------------- |

| `/home/user/app` | Host directory             |

| `/usr/src/app`   | Directory inside container |

| `-v`             | Mount option               |



Docker Recommended Syntax (Newer Format)

docker run -d \\

&nbsp; --mount type=bind,source=/home/user/app,target=/usr/src/app \\

&nbsp; node



Bind mounts give containers direct access to a host directory, making them ideal for development where live file syncing is needed. However, Docker volumes are preferred for production because they are portable, secure, and fully managed by Docker.







.dockerignore

The .dockerignore file is used to specify files and directories that should be excluded when building a Docker image. It helps prevent unnecessary files from being copied into the image, keeping the image lightweight, secure, and faster to build.



| Benefit                        | Explanation                                                                      |

| ------------------------------ | -------------------------------------------------------------------------------- |

| Smaller image size             | Prevents copying unnecessary files like logs, temp files, source maps, etc.      |

| Faster build time              | Less data to send during `docker build` context transfer.                        |

| Security                       | Prevents sensitive files (like credentials or `.env` files) from being included. |

| Cleaner production environment | Only required application code is packaged.                                      |



How It Works

During the docker build process, Docker sends a copy of the current directory (called the build context) to the Docker daemon.

The .dockerignore file filters out files from this context before copying happens.



The .dockerignore file improves security and performance during Docker builds by excluding unnecessary or sensitive files from the build context.









