#!/bin/bash
eksctl create cluster \
--name Kubernetes \
--version 1.21 \
--region us-east-1 \
--nodegroup-name Nodes-2 \
--node-type t3a.2xlarge \
--nodes 2

sleep 1
eksctl utils write-kubeconfig --cluster Kubernetes