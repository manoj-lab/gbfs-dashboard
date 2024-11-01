INSTRUCTIONS TO RUN AND BUILD GBFS DASHBOARD

1. Clone the GitHub Repository
    - Clone the repository from GitHub to their local machine Or, fork the repository if you want to keep a copy of the code in your GitHub account, then clone the fork.
2. Create an Azure DevOps Project
    - You need an Azure DevOps organization and a project where you can set up a pipeline.
    - In Azure DevOps, go to Organization settings and create a new project if you don’t have one.
3. Set Up an Azure Pipeline in Their Project
    - In your Azure DevOps project, navigate to Pipelines > New Pipeline.
    - Choose GitHub as the source and authorize the connection to your GitHub account if needed.
    - Select the forked/cloned repository containing the code.
    - Azure DevOps will detect the azure-pipelines.yaml file in the repo. Confirm to use this file for the pipeline configuration.
4. Configure a Service Connection for Azure
    - The pipeline deploys resources to AWS, and the access key and access secret to be stored in the variable groups or pipeline variable and lock the variable and the pipeline has a scipt that exports the key to establish the connection.
              export AWS_ACCESS_KEY_ID="$(aws_id)"
              export AWS_SECRET_ACCESS_KEY="$(aws_key)"
        * make sure to set/change the variable name as needed.
    - In Azure DevOps, go to Project settings > Service connections > New service connection and search docker registry  and select Registry type as Docker Hub, provide your docker id and password/token and service connection name.
        * update the containerregistry in the pipeline for task: Docker@2 with your docker hub service connection name.
    
        * NOTE: name this service connection and aws key the same as the one in the azure-pipelines.yaml file to avoid configuration issues Or updarte the pipeline accordingly.
5. Review and Modify Terraform Configurations (if needed)
    - The Terraform code may reference specific Azure resource names, locations, or parameters that might need adjustments for your own environment.
    - You can modify any configuration files or variables in the Terraform code before running the pipeline, if necessary, to tailor it to your deployment.
6. Run the Pipeline
    - Once everything is set up, you can go to Pipelines in their Azure DevOps project and click Run pipeline.
    - Monitor the pipeline execution and view logs to ensure that resources are being deployed correctly.
7. Verify the Deployment
    - After the pipeline runs successfully, verify the deployment by checking the Azure portal to ensure that the resources defined in the Terraform code were created in their own Azure subscription.