#!/bin/bash
echo "please enter EKS cluster name"
read clustername

# Associate kubectl with cluster
aws eks update-kubeconfig --name $(terraform output --raw cluster_name) --region $(terraform output --raw region)

echo "check deployments"
kubectl get deployments

echo "check nodes"
kubectl get deployments


# --------------------INSTALL CILIUM USING HELM--------------
# You need cilium cli already installed

echo "Delete daemonsets and aws-nodes"
kubectl patch daemonset aws-node -n kube-system -p '{"spec":{"template":{"spec":{"nodeSelector":{"no-such-node": "true"}}}}}'
kubectl patch daemonset kube-proxy -n kube-system -p '{"spec":{"template":{"spec":{"nodeSelector":{"no-such-node": "true"}}}}}'

echo "scaling down coredns"
kubectl scale deployment coredns --replicas=0 -n kube-system

echo "Installing cilium"
cilium install --cluster-name $clustername