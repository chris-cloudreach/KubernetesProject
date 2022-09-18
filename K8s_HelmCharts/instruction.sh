# Installing Helm


curl -fsSL -o helm.tar.gz https://get.helm.sh/helm-v3.4.1-linux-amd64.tar.gz

tar -xzf helm.tar.gz

helm version

# create helm chart for our app
helm create mynodeapp

# helm repo add stable https://charts.helm.sh/stable

# helm repo update

# helm search repo wordpress

# helm install demowp stable/wordpress

# helm ls

# helm delete demowp
