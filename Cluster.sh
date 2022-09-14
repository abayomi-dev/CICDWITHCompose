#!/bin/bash
eksctl create cluster \
--name WebserverCluster \
--version 1.21 \
--region us-east-1 \
--nodegroup-name Nodes \
--node-type t2.micro \
--nodes 2

sleep 1
eksctl utils write-kubeconfig --cluster WebserverCluster