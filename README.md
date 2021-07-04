# Load Balancing gRPC API Gateway

## Description

This sample demonstrated how to use Contour as load balancer to route traffic from client to API Gateway developed by gRPC and GoLang.

## Infrastructure

1. Install Docker Desktop on your local machine
2. Create k8s cluster. A simplest way is using AKS from Azure.
3. Create docker image registry. A simplest way is using ACR from Azure.
4. Install Contour into kubernetes cluster follow by this [article](https://projectcontour.io/getting-started/).
5. Generate self-signed certificate with `./x509/gen.sh` script file, you should change domain name in this script file and server-ext.cnf file before do it.
6. Create tls.yaml with `./deploy/create_tls.ps1` script file.
7. Also change domain name in `./deploy/ingress.yaml` file and `runclient-remote.ps1` file
8. Build docker image, and push it into registry.
9. Finally, changed docker image name at No.19 line in `./deploy/deploy.yaml` file.

## Run the sample code locally

Run this script to start the server local machine

```powershell
runserver.ps1
```

Run this script to call this server

```powershell
runclient-local.ps1
```

## Run the sample code locally with docker-compose

Run this script to up a docker compose instance

```shell
docker-compose up
```

Run this script to call this server

```powershell
runclient-local.ps1
```

## Run the sample code remote with kubernetes

Run this script to deploy server into kubernetes cluster

```shell
kubectl create -f ./deploy/.
```

Run this script to call this server

```powershell
runclient-remote.ps1
```