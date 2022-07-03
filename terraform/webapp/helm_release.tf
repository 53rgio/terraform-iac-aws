provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.cluster.name]
      command     = "aws"
    }
  }
}

data "aws_caller_identity" "current" {}
data "aws_ecr_authorization_token" "token" {}

resource "helm_release" "flask-webapp" {
  name       = "flask-webapp"
  repository = "oci://646552846646.dkr.ecr.us-east-2.amazonaws.com"
  chart = "flask-webapp-chart"
  namespace  = "webapp"
  create_namespace = true

  repository_username = data.aws_ecr_authorization_token.token.user_name
  repository_password = data.aws_ecr_authorization_token.token.password
  lifecycle {
    ignore_changes = [repository_password]
  }
  
}
