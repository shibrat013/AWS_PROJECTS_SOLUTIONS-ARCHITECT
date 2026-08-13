# Docker on Amazon EC2

## Project Overview

This project demonstrates how to install Docker on an Amazon EC2 instance, build a Docker image from a Dockerfile, run a container, and optionally publish the image to Docker Hub.

## Objectives

- Install Docker Engine on an EC2 instance
- Start and configure the Docker service
- Configure the EC2 user to run Docker commands
- Build a Docker image
- Run a Docker container
- Map container port 80 to the EC2 instance
- Understand the basic image-to-container workflow
- Practice publishing an image to Docker Hub

## AWS Services and Technologies

- Amazon EC2
- Docker Engine
- Docker images
- Docker containers
- Docker Hub

## Architecture

```text
Internet
   │
   ▼
EC2 Instance
   │
   ▼
Docker Engine
   │
   ▼
Docker Image
   │
   ▼
Running Container
   │
   ▼
Port 80
```

## Implementation

### 1. Install Docker on EC2

Docker was installed on the EC2 instance:

```bash
sudo dnf install docker
sudo service docker start
```

The EC2 user was added to the Docker group:

```bash
sudo usermod -a -G docker ec2-user
```

After logging out and back in, Docker commands could be run as the `ec2-user`.

### 2. Build the Docker Image

The Docker build context was entered and an image was created:

```bash
cd container
docker build -t containerofcats .
```

The image was then checked:

```bash
docker images --filter reference=containerofcats
```

### 3. Run the Container

A container was started from the image with port 80 exposed:

```bash
docker run -t -i -p 80:80 containerofcats
```

The `-p 80:80` option maps port 80 on the EC2 host to port 80 inside the container.

### 4. Optional Docker Hub Upload

The image can be tagged and pushed to Docker Hub:

```bash
docker login --username=YOUR_USERNAME
docker images
docker tag IMAGE_ID YOUR_USERNAME/containerofcats
docker push YOUR_USERNAME/containerofcats:latest
```

Credentials should never be stored in this repository.

## 🧠 What I Learned

- A Docker image is a packaged template used to create containers.
- A container is a running instance of an image.
- Docker can run application workloads inside isolated containers.
- Port mapping connects a host port to a container port.
- Docker images can be tagged and stored in container registries such as Docker Hub.
- EC2 can be used as a host for containerized workloads.

## Docker Workflow

```text
Dockerfile
    │
    ▼
docker build
    │
    ▼
Docker Image
    │
    ▼
docker run
    │
    ▼
Container
```

## 📸 Screenshots

Screenshots from the lab are stored in the `Screenshot` directory.

## Possible Extensions

Future work could include:

- Push the image to Amazon ECR
- Run the container using Amazon ECS
- Use an Application Load Balancer in front of containers
- Create a Docker Compose deployment
- Add container logging and monitoring with CloudWatch

## Learning Context

This project was completed as part of my hands-on preparation for the AWS Certified Solutions Architect – Associate certification.
