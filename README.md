# Setting up CD/CI for a Java-Spring Application in a Kubernetes Cluster

This guide outlines the steps to implement Continuous Deployment (CD) and Continuous Integration (CI) for a simple Java-Spring application within a Kubernetes cluster. The CD/CI pipeline will be orchestrated using Git Actions, ArgoCD, and Docker images.
![Example](images/schemaCDCI.png)
## Spring Application Quick Start Guide

## Overview

This guide offers step-by-step instructions for creating a basic Spring application using Gradle. Follow these steps to establish your development environment, create a simple Spring project, and execute the application in Kubernetes cluster.  
With Git Actions, I'll automate the process of building a Docker image and uploading it to Docker Hub.  
I'll deploy it on my local machine using Kubernetes and Kind. With Argo CD, I'll monitor Git for changes to the Kubernetes cluster and Docker Hub for updates to the Spring project.  
The next part of the project is about setting up a monitoring system for Kubernetes and organizing everything using Terraform. This helps keep an eye on how things are going and makes it easier to manage the infrastructure as the project grows. It's like making sure everything is running smoothly and using a tool to easily control how things are set up.

## Prerequisites

Make sure you have the following installed on your machine:

- [Java Development Kit (JDK)](https://adoptopenjdk.net/)
- [Gradle](https://gradle.org/)
- [IDE](https://code.visualstudio.com/)

## Steps

### Step 1: Download a New Spring initializr (https://start.spring.io/)

1. Open your IDE and create a new Spring project.
2. Choose the appropriate Spring Initializer or Gradle archetype for your project. Include the necessary dependencies (e.g., Spring Boot, Spring Web).  

### Step 3: Build and Run the Project

1. Open the project in your IDE.
2. Build the project using Gradle:

   ```bash
   ./gradlew build
   
3. Your jar files will apeared in build folder.  

# Configure workflow for git acions

 - Create file [.github/workflows/main.yaml](.github/workflows/main.yaml) (Comments are inside)
   

# Install Kubernetes Cluster in your local machine with kind

### [ Install kubernetes in your local machine ](https://kubernetes.io/releases/download/)

### [ Installing kind in your local machine ](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)

Command `kind create cluster` will bootstrap a Kubernetes cluster using a pre-built node image. Prebuilt images are hosted atkindest/node, but to find images suitable for a given release currently you should check the release notes for your given kind version (check with kind version) where you’ll find a complete listing of images created for a kind release. Read [ MORE ](https://kind.sigs.k8s.io/docs/user/quick-start/#creating-a-cluster)  

# Install [ Argo CD ](https://argo-cd.readthedocs.io/en/stable/getting_started/)
`kubectl create namespace argocd`  
`kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml`  
This will create a new namespace, argocd, where Argo CD services and application resources will live. 

