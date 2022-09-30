#/bin/bash
echo "Since this application has many components, it is a good idea to create a separate namespace for the app:"
kubectl create namespace robot-shop

echo "Deploy the app to the cluster:"
# Run from the main directory
kubectl -n robot-shop create -f ./StanRobotShopDeployment/robot-shop-master/K8s/descriptors/

echo "Check the status of the application's pods:"
kubectl get pods -n robot-shop

# You should be able to reach the robot shop app from your browser using the Kube master node's public IP:
# http://$kube_master_public_ip:30080


# Scale up the MongoDB deployment to two replicas instead of just one

# echo Edit the deployment descriptor:
kubectl edit deployment mongodb -n robot-shop
# You should see some YAML describing the deployment object.

# Under spec:, look for the line that says replicas: 1 and change it to replicas: 2.
# Save and exit.

# echo Check the status of the deployment with:
kubectl get deployment mongodb -n robot-shop

# After a few moments, the number of available replicas should be 2.