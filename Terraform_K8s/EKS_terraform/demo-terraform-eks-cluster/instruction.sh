# Run the terraform files to deploy eks cluster

# Associate kubectl with cluster
aws eks update-kubeconfig --name $(terraform output --raw cluster_name) --region $(terraform output --raw region)

#you can check deployments
kubectl get deployments

