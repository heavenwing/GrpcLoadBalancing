# Load Balancing gRPC API Gateway

## Description

This sample demonstrated how to use Contour as load balancer to route traffic from client to API Gateway developed by gRPC and GoLang.

## Infrastructure

1. Create k8s cluster. A simplest way is using AKS from Azure.

## Run the sample code

To compile and run the server, assuming you are in the root of the route_guide
folder, i.e., .../examples/route_guide/, simply:

```sh
$ go run server/server.go
```

Likewise, to run the client:

```sh
$ go run client/client.go
```
