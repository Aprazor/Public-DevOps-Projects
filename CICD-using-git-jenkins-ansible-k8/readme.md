## CICD Pipeline Using Terraform > Git > Jenkins > Ansible > DockerHub > Kubernetes


Step 1: Deploying AWS instances using Terraform
To deploy AWS instances using Terraform, follow these steps:
1. Install Terraform on your local machine.
2. Add your AWS secret key.
3. Run the commands 'terraform init' and 'terraform plan'.
4. If the above commands are successful, run 'terraform apply'.

Step 2: Installing Ansible
After the instances are up and running, you can install Ansible on one of the instances. Use the Ansible files mentioned in the source code.

Step 3: Installing Jenkins
You can install Jenkins on the instance and configure it based on the configuration file.

Step 4: Installing Docker on the instance
Once Docker is installed, use "docker login" to log in to your Docker Hub account.

Step 5: Deploying EKS cluster on AWS using CloudFormation
After deploying the EKS cluster on AWS using CloudFormation, run the Ansible code for 'kube_deploy' to run the Load Balancer.

Once all the above steps are completed, you can run the Jenkins CI/CD build to complete the run.


<img width="960" alt="CICD" src="https://github.com/Aprazor/Public-DevOps-Projects/assets/51818160/98a22650-9419-48f2-bb77-ab70e8caa47e">


