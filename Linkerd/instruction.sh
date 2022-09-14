# Requirements: kind/minikube, kubectl, linkerd cli
# confirm linkerd cli is installed
linkerd version

# start minikube to create k8s cluster
minikube start

# do prechecks on the k8s cluster to confirm linkerd can connect without problems
linkerd check --pre

# Install linkerd crds first
linkerd install --crds | kubectl apply -f -

# install linkerd control plane
linkerd install --set proxyInit.runAsRoot=true | kubectl apply -f -

#verify linkerd is in good state and running
inkerd check

# install linkerd viz to access dashboard
linkerd viz install | kubectl apply -f -

# access dashboard
linkerd viz dashboard