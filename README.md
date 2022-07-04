# terraform-iac-aws

This repo is based on public available guides

## Implementation:

### app: 
Flask web app, this is a simple implementation, without making use of any proper development practices, no tests were written.

### helm:
Creates a chart based on the flask implementation. "Helm create" added unecessary code. For this purpose it is not relevant, under normal circunstances it should be cleanup.

### Terraform:
There is only a separation between application and infrastructure. On production it may be recomended to implement it taking into account different modules.

Due to time restrictions there are some features lacking on the terraform implementation like an s3 backend and dynamo lock control.
