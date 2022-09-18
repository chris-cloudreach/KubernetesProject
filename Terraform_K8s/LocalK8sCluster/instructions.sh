# install kind [brew install kind] and create cluster using it
kind create cluster --name localterraformdemo --config Terraform_K8s/LocalK8sCluster/kind-config.yml 

# point kubectl to our cluster
# kubectl cluster-info --context kind-localterraformdemo
# run `kubectl cluster-info --context kind-<CLUSTER NAME>`

# retriev details about cluster for terraform.tfvars
kubectl config view --minify --flatten --context=kind-localterraformdemo

# activate metrics server
kubectl apply -f https://raw.githubusercontent.com/ACloudGuru-Resources/content-cka-resources/master/metrics-server-components.yaml