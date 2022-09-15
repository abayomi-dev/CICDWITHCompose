# Task
## - You are to set up CI?CD for https://github.com/do-community/node-mongo-docker-dev and to do these we have to follow some processes.
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
** The jenkins server should show the following
![Jenkins server output](https://github.com/Osiephri/CICDWITHCompose/blob/main/assets/youverfy11.PNG)
**SSH into the running instance and check the files are installed after which you should start the jenkins service via `<LOADBALANCER_URL>:8080` 
