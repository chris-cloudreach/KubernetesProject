#bin/bash
echo "On the control plane node, install Calico Networking:"
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

echo "Check status of the control plane node:"
kubectl get nodes