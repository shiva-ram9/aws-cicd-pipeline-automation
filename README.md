# AWS CI/CD Pipeline Automation

A hands-on AWS DevOps project that automates application delivery from GitHub to an Amazon EC2 web server using AWS CodePipeline, CodeBuild, and CodeDeploy.

## Architecture

```text
Developer
   |
   | git push
   v
GitHub
   |
   v
AWS CodePipeline
   |
   +--> Source: GitHub
   |
   +--> Build: AWS CodeBuild
   |       |
   |       +--> Validate application
   |       +--> Produce deployment artifact
   |
   +--> Deploy: AWS CodeDeploy
           |
           v
       Amazon EC2
           |
           v
        Nginx
           |
           v
      Web Application
```

## AWS Services

- Amazon EC2 - application server
- AWS CodePipeline - CI/CD orchestration
- AWS CodeBuild - build and validation stage
- AWS CodeDeploy - deployment to EC2
- AWS IAM - least-privilege service and instance roles
- Amazon S3 - CodePipeline artifact storage
- GitHub - source-code repository

## Repository Structure

```text
aws-cicd-pipeline-automation/
├── app/
│   └── index.html
├── scripts/
│   ├── install_dependencies.sh
│   ├── stop_server.sh
│   ├── start_server.sh
│   └── validate_service.sh
├── appspec.yml
├── buildspec.yml
├── .gitignore
└── README.md
```

## CI/CD Flow

1. Developer pushes a change to the `main` branch.
2. CodePipeline detects the GitHub change.
3. CodeBuild runs the buildspec and validates the application.
4. CodeBuild produces the deployment artifact.
5. CodeDeploy sends the artifact to the tagged EC2 instance.
6. The CodeDeploy agent executes the AppSpec lifecycle hooks.
7. Nginx serves the updated application.
8. The ValidateService hook confirms the web server responds successfully.

## Deployment Lifecycle

The project uses CodeDeploy lifecycle hooks:

- `BeforeInstall` - install Nginx and prepare the server
- `AfterInstall` - perform post-install preparation
- `ApplicationStart` - start Nginx
- `ValidateService` - test the application endpoint

## Build and Deployment Files

`buildspec.yml` is consumed by CodeBuild. `appspec.yml` is consumed by CodeDeploy for an EC2/On-Premises deployment.

## Project Status

- [x] GitHub repository created
- [x] Application source added
- [x] CodeBuild specification added
- [x] CodeDeploy AppSpec added
- [x] Deployment scripts added
- [ ] EC2 instance configured
- [ ] IAM roles configured
- [ ] CodeDeploy application/deployment group configured
- [ ] CodeBuild project configured
- [ ] CodePipeline configured
- [ ] Automated deployment tested

## Cost Awareness

AWS services used in this project can incur charges depending on the account, region, resource type, runtime, and current AWS pricing. Stop or terminate resources when they are no longer needed and monitor Billing and Cost Management during the lab.

## Resume Description

**AWS CI/CD Pipeline Automation** - Built an automated CI/CD pipeline using AWS CodePipeline, CodeBuild, and CodeDeploy to validate application changes and deploy them automatically to Amazon EC2. Integrated GitHub as the source repository and implemented deployment lifecycle hooks for application installation, startup, and service validation.
