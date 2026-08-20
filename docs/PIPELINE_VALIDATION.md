# CI/CD Pipeline Validation

## Project outcome

This project implements a working continuous delivery workflow for a static web application:

```text
GitHub (main) → AWS CodePipeline → AWS CodeBuild → AWS CodeDeploy → Amazon EC2
```

A push to `main` starts the pipeline automatically. CodeBuild validates and packages the revision, and CodeDeploy deploys it to the EC2 web server.

## AWS resources

| Component | Resource |
| --- | --- |
| Region | Asia Pacific (Hyderabad), `ap-south-2` |
| Source repository | `shiva-ram9/aws-cicd-pipeline-automation` |
| Pipeline | `AWS-CICD-WebApp-Pipeline` |
| Build project | `AWS-CICD-WebApp-Build` |
| CodeDeploy application | `AWS-CICD-WebApp` |
| Deployment group | `AWS-CICD-EC2-DeploymentGroup` |
| Target tag | `DeploymentTarget=AWS-CICD` |
| EC2 role | `AWS-CICD-EC2-Role` |
| CodeDeploy service role | `AWS-CICD-CodeDeploy-Service-Role` |
| Artifact bucket | `aws-cicd-artifacts-593293351578-ap-south-2` |

## Deployment design

- Nginx serves the web application from `/usr/share/nginx/html`.
- `appspec.yml` maps the `app/` directory to that Nginx web root.
- Lifecycle scripts install Nginx, start it, and validate `/health.html`.
- `buildspec.yml` runs `tests/validate.sh` and publishes the CodeDeploy revision files as a pipeline artifact.
- The EC2 role has read-only access to both the project artifact bucket and the AWS-managed CodePipeline artifact bucket.

## Validated results

1. Manual CodeDeploy deployment succeeded.
2. The web application returned `healthy` from `/health.html`.
3. The pipeline successfully completed Source, Build, and Deploy stages.
4. A Version 1.1 change was pushed to GitHub and automatically processed by the pipeline.
5. The final automated run validated the full delivery path without manual deployment intervention.

## Troubleshooting learned

| Issue | Resolution |
| --- | --- |
| Session Manager could not connect from a database subnet | Re-created the deployment instance in a public subnet with the SSM role attached. |
| Nginx health validation failed | Deployed to Amazon Linux Nginx's default web root: `/usr/share/nginx/html`. |
| Pipeline deployment could not download its artifact | Granted the EC2 role read access to the CodePipeline artifact bucket. |
| Version update failed build validation | Made the release-version test accept semantic version values and corrected the grep command syntax. |

## Evidence to capture

Add secret-free screenshots to `screenshots/`:

- Green CodePipeline execution: Source → Build → Deploy
- Successful CodeDeploy lifecycle events
- Website showing Version 1.1
- `/health.html` returning `healthy`
- EC2 instance with deployment tag and IAM role

## Interview summary

“I built an AWS CI/CD pipeline that automatically deploys a static web application from GitHub to Amazon EC2. CodePipeline orchestrates the workflow, CodeBuild validates and packages the application, and CodeDeploy uses lifecycle hooks to install Nginx, deploy the files, start the service, and run a health check. I used IAM roles with scoped S3 access and Systems Manager for secure instance management without SSH.”
