# Task
## - You are to set up CI/CD for https://github.com/do-community/node-mongo-docker-dev and to do these we have to follow some processes.
## - You are to assist in shifting deployment from  api_driven architecture(monolith) to microservices. 
## - You are to set up moitoring and observability to monitor this process and its configuration.

# First lets consider the CI/CD pipeline
- We would create a Ci/Cd using **Jenkins** and deploy it using kuberentes
- we have to set up the configuration environments and create the deployment scripts.
- clone this repository to run changes and change env settings to avoid getting error codes. **Write `git clone -b master https://github.com/Osiephri/CICDWITHCompose 
`** 

### Lets begin with creating the Jenkins server
- **To do these we would open our bash terminal and write `terraform init`**
**Initializing this attempt to create a terraform resource in this case an EC2 instance to run Jenkins alongside its pre-baked startup script**
**This should create an output like This**
![Terraform Init Output](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/youverfy14.PNG)
**Follow the configurations and run the following commands with their corresponding output**
- `Terraform plan`
**Output**
![Terraform plan output](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/youverfy13.PNG)
- `Terraform apply`
**Output**
![Terraform apply output](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/Youverify12.PNG)
**The jenkins server should show the following**
![Jenkins server output](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/youverify11.PNG)
**SSH into the running instance and check the files are installed after which you should start the jenkins service via `<LOADBALANCER_URL>:8080`**

## Create our Kubernetes cluster
**I already packaged it into a script labelled `Cluster.sh`**
- We create the cluster by running the following commands.
*Open your bash terminal and write*
`chmod +x cluster.sh
 ./cluster.sh
`
**This creates an EKS cluster(AWS Managed) and is set to recieve our application** 


# Create the pipeline
- We do these by setting a **Newproject** with a unique name and a pipeline job
- We configure the necessary plugins and set secrets to our **Dockerhub and kube-config file as well as Github**
- Install all Necessary plugins to run this jenkins file and after running the jenkinsfile we should deploy our built image from the Dockerfile to the HUB
- After you configure  the job, ***BUILD IT*** and ensure all phases are checked as we see below.
![Jenkins pipeline Output](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/youverify2.PNG)
- After this process we should have a running resource(pods,services,deployments) on our Managed Cluster.
**Below shows an image validating sucessful deployments to our cluster from the CI/CD pipeline**
![Kubectl Deployment](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/youverify9.PNG)
*Service output*
![Kubectl services](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/youverify10.PNG)

# ACCESS OUR APPLICATION
**WE CAN ACCESS OUR APPLICATION USING THE FOLLOWING URL**
[CLICK TO VEW APP](http://a34b6b3c0afb74a67807cf25f4e64e09-271916082.us-east-1.elb.amazonaws.com:8000/)
