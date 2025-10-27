# Implement a CI/CD pipeline using OCI DevOps to automate the deployment of a web server on Kubernetes cluster



## File Descriptions

| File Name                      | Description                                                  |
| ------------------------------ | ------------------------------------------------------------ |
| **Dockerfile & entrypoint.sh** | These two files are used to build the docker image. The entrypoint.sh generates index.html at /usr/share/nginx/html/ |
| **build_spec.yaml**            | Defines the OCI DevOps build pipeline                        |
| **K8s_deploy.yaml**            | Defines the OCI DevOps deploy pipeline                       |

## Prerequisites:

1. Create and note **auth token** and ensure the user (holding auth token) has necessary privileges

2. Create a developer machine (may provision OCI Compute Oracle Linux9 on OCI).

   ```bash
   $ sudo dnf install docker git -y
   $ sudo touch /etc/containers/nodocker
   $ docker run hello-world
   $ cd ~
   $ git clone https://github.com/jahangir2526/oci-devops-nginx-web-server.git
   
   ```

3. Create a OCIR Repo

   A. From OCI Console create an OCIR repo (**project01/my-repo-01**), Select Region (eg: **Singapore**) and Compartment (Eg: **Practice**) 

   B. Create a docker image in Developer Machine

   ```bash
   $ cd ~/oci-devops-nginx-web-server
   $ docker build -t nginx-web-server:v1 .
   $ docker run -d -p 8080:80 nginx-web-server:v1
   $ curl localhost:8080
   ## If all good
   $ docker login # Login Username: <TenancyNamespace>/<Username>
   # password: <AuthToken>
   
   $ docker tag localhost/nginx-web-server:v1 sin.ocir.io/<TenancyNamespace>/<project01/my-repo-01:v1>
   $ docker push
   ```



# Steps

## Step1 : Create DevOps Project

A. Create DevOps project (prerequisite: create a notification topic)

B. Enable Logging (Optional)

## Step2: Create a Code Repository

A. Create a Code Repository (eg: **code-repo-1**)

B. Clone OCI Code Repo into the Dev Machine, copy codebase and push back to OCI code repository

```bash
# Notes: 
## Username/Password Format: 
		#TenancyName/FederationName/YourUserName (If federated)
		#TenancyName/YourUserName (OCI direct login)
		#Password: <auth token>

$ cd ~
## copy the git clone command from OCI console (eg as follows)
$ git clone https://devops.scmservice.ap-singapore-1.oci.oraclecloud.com/namespaces/namepsace/projects/projectname/repositories/code-repo-1

$ cp -rp ~/oci-devops-nginx-web-server/* ~/code-repo-1/
$ git push
```






​    