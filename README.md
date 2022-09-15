# Task
**- You are to set up CI/CD for https://github.com/do-community/node-mongo-docker-dev as this repository will cover.**</br>
**- You are to assist in shifting deployment from  api_driven architecture(monolith) to microservices.**</br>
**- You are to set up moitoring and observability to monitor this process and its configuration.**</br>


**STAY TUNED AND READ ALL THE CONFIGURATIONS CAREFULLY.**</br>


**SEE YOU AT THE END OF THE DOCUMENT.**</br>

# First lets consider the CI/CD pipeline
- We would create a CI/CD using **Jenkins** and deploy it using kuberentes.
- we have to set up the configuration environments and create the deployment scripts.
- clone this repository to run changes and change env settings to avoid getting error codes.<\br>
-  **Write `git clone -b master https://github.com/Osiephri/CICDWITHCompose 
`** 

### Lets begin with creating the Jenkins server
- **To do these we would open our bash terminal and write `terraform init`.**</br>
**Initializing the file to create a terraform resource in this case an EC2 instance to run Jenkins and its configured script.**</br>
**This should create an output like This.**</br>
![Terraform Init Output](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/youverfy14.PNG)

**Follow the configurations and run the following commands with their corresponding output**</br>
- `Terraform plan`.</br>
**Output**
![Terraform plan output](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/youverfy13.PNG)
- `Terraform apply`.</br>
**Output**</br>
![Terraform apply output](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/Youverify12.PNG)

**The jenkins server should show the following**
![Jenkins server output](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/youverify11.PNG)</br>
**SSH into the running instance and check the files are installed after which you should start the jenkins service via `<LOADBALANCER_URL>:8080`**</br>

## Create our Kubernetes cluster
**I already packaged it into a script labelled `Cluster.sh`**
- We create the cluster by running the following commands.</br>
*Open your bash terminal and write*</br>
`chmod +x cluster.sh`</br>
 `./cluster.sh`</br>
**This creates an EKS cluster(AWS Managed) and is set to recieve our application** </br>


# Create the pipeline.
- We do these by setting a **Newproject** with a unique name and a pipeline job. </br>
- We configure the necessary plugins and set secrets to our **Dockerhub and kube-config file as well as Github** </br>
- Install all Necessary plugins to run the jenkinsfile and after running the jenkinsfile,it should deploy our built image from the Dockerfile to the HUB.</br>
- After you configure  the job, ***BUILD IT*** and ensure all phases are checked as we see below.</br>
![Jenkins pipeline Output](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/youverify2.PNG)
- After this process we should have a running resource(pods,services,deployments) on our Managed Cluster.</br>
**Below shows an image validating sucessful deployments to our cluster from the CI/CD pipeline**
![Kubectl Deployment](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/youverify9.PNG)
*Service output*
![Kubectl services](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/youverify10.PNG)

# ACCESS OUR APPLICATION
**WE CAN ACCESS OUR APPLICATION USING THE FOLLOWING URL**
[CLICK TO VEW APP](http://a34b6b3c0afb74a67807cf25f4e64e09-271916082.us-east-1.elb.amazonaws.com:8000/)


# Setting up observability and logging using prometheus and grafana
**- To Do these install helm on you kubectl cluster**</br>
**- After installation setup prometheus and grafana deployments and services**</br>
**- Run the following command**</br>
`helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`</br>
`helm repo add grafana https://grafana.github.io/helm-charts`</br>
`helm repo update`</br>

**Install prometheus next**</br>
`helm install prometheus prometheus-community/prometheus`</br>

**After this is done we will portforward the services to meet it endpoints.**</br>
**We Would Run the following command**</br>
`kubectl expose service prometheus-server — type=LoadBalancer — target-port=9090 — name=prometheus-server-ext`</br>
**Check the dashboard below**</br>
[Click to view prometheus dashboard](abb4a2dee63c8443f92c59591d65d9f2-39184252.us-east-1.elb.amazonaws.com:80)</br>

**We would connect to grafana by port-forwarding,and since it doesnot contain a loadbalancer we will connect to it through the following command.**</br>
`kubectl port-forward svc/grafana 8081:80`</br>
**View the dashboard to our cluster below.**
![Dashboard one](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/youverfy15.PNG)
# Lets view other metrics.
![Dashboard two](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/youverfy16.PNG)
