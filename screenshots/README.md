# Screenshot Checklist

Use secret-free screenshots only. Hide account IDs, public IP addresses, ARNs, and any sensitive values before publishing.

## Final project evidence

- `01-github-repository.png` — GitHub repository overview
- `02-ec2-instance-role-tag.png` — EC2 deployment target with `AWS-CICD-EC2-Role` and `DeploymentTarget=AWS-CICD`
- `03-codedeploy-agent-active.png` — CodeDeploy agent active in Session Manager
- `04-codedeploy-manual-success.png` — successful manual CodeDeploy lifecycle events
- `05-health-endpoint.png` — `/health.html` returns `healthy`
- `06-codepipeline-success.png` — green GitHub → CodeBuild → CodeDeploy execution
- `07-application-version-1-1.png` — deployed site showing Version 1.1
- `08-codebuild-validation.png` — successful CodeBuild validation
- `09-codedeploy-automatic-success.png` — successful deployment created by CodePipeline

See [PIPELINE_VALIDATION.md](../docs/PIPELINE_VALIDATION.md) for the validated architecture and interview summary.
