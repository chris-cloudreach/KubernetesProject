echo "In the control plane node, create the token and copy the kubeadm join command (NOTE:The join command can also be found in the output from kubeadm init command):"
kubeadm token create --print-join-command

echo "In both worker nodes, paste the kubeadm join command to join the cluster. Use sudo to run it as root:"
# E.g  sudo kubeadm join 10.0.1.101:6443 --token p4qspj.40y4jw1s2e98exhq --discovery-token-ca-cert-hash sha256:3896eb90b4a136f8a0e01f92b299ddd77c31cc3fadb72643d604f3d06bff3d2b

echo "In the control plane node, view cluster status (Note: You may have to wait a few moments to allow all nodes to become ready):"
kubectl get nodes