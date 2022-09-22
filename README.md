# Task
**- You are to set up CI/CD for https://github.com/do-community/node-mongo-docker-dev as this repository will cover.**</br>
**- You are to assist in shifting deployment from  api_driven architecture(monolith) to microservices.**</br>
**- You are to set up moitoring and observability to monitor this process and its configuration.**</br>


**STAY TUNED AND READ ALL THE CONFIGURATIONS CAREFULLY.**</br>


**SEE YOU AT THE END OF THE DOCUMENT.**</br>


**The source code is present in the master branch of this repository.**</br>

**Follow through to the end to see how to run this application ![Image of Application](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/sharks%20output.png) in a pipeline.**</br>

# Before we consider the CI/CD pipeline lets see the system design for this project.</br>
![System design](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/Untitled%20Diagram.drawio.png)</br>
- **The developer commits a change and through webhook configured on the Jenkins slave the git plugins updates the Source codes in the V.C.S.**</br>
- **The Jenkins slave builds the image and pushes it to DockerHub which makes it available to be used by kubernetes.**</br>
- **Inside the Kubernetes cluster the changes are regularly polled from the deployment and then exposed via a loadbalncer to the internet.**</br>
- **The application(deployment) is monitored for logs using Prometheus and grafana created using Helm.**</br>

**The process is automated seamlessly as seen in the image above.**</br>

**Let's consider how to do these.**</br>


# First lets consider the CI/CD pipeline
- We would create a CI/CD using **Jenkins** and deploy it using kuberentes.
- We have to set up the configuration environments and create the deployment scripts.
- Clone this repository to run changes and change env settings to avoid getting error codes.</br>
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

# VIEW OUR APPLICATION IMAGE BELOW
**WE CAN ACCESS OUR APPLICATION USING THE FOLLOWING URL**
[Application Image]](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/sharks%20output.png)


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
**Dashboard created and is connected to the database engine**

**We would connect to grafana by port-forwarding,and since it does not contain a loadbalancer we will connect to it through the following command.**</br>
`kubectl port-forward svc/grafana 8081:80`</br>
**View the dashboard to our cluster below.**
![Dashboard one](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/youverfy15.PNG)
# Lets view other metrics.
![Dashboard two](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/youverfy16.PNG)

# Shifting Workload from API-Application to Microservices.</br>
**We are going to see the various aspects of our SDLC to be well packaged and deployed to public instances and archictectures to meet the demands of the end users.**</br>  
- **Development.**</br>
`- Shift Application components into several files and packages to be integrated. `</br>
- **Packaging.**</br>
`- Build all files and dependencies into an artifact or image and save it in a repository.`</br>
- **DevOps.**</br>
`- Automate the delivery of the application to deployment to eliminate errors in configuration.`</br>
`- Perform test to each individual component of the Microservices before applying a performance test.`</br>
`- This aids at shortening failure rates and seamlessly integrate the workloads into a computer engine for other processes.`</br>
- **Database Refractoring.**
`- Integrate database services responsively in the decoupled and recoupled infrastructure.`</br>
`- Use Master Database Management tools e.g MongoDB to achieve easier Workload transition.`</br>
- **Infrastructure Architecturing.**
`- Coordinate infrastructure of the Microservices by running the infrastructure as code,For portability and ease of use.`</br>

**ADVANTAGES OF SHIFTING WORKLOADS**
- Agility.
- Fault Tolerance.
- Availability.
- PolyGot Persistence.

# Conclusion.
***- We have seen how to create a pipeline for our application,and also tips on shifting from monolith to Microservices.***</br>
***- We've discovered ways to improve our already running Monolith system(Application).***</br>

***Thanks for Reading Through.Best Regards.***</br>


