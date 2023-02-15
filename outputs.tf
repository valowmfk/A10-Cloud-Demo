output "cluster_name" {
  value = aws_eks_cluster.cloud-demo.name
}
output "cluster_endpoint" {
  value = aws_eks_cluster.cloud-demo.endpoint
}
output "cluster_ca_certificate" {
  value = aws_eks_cluster.cloud-demo.certificate_authority[0].data
}
output "region" {
  description = "AWS region"
  value       = var.region
}
output "subnets" {
  description = "AWS Subnets"
  value = aws_subnet.public
}
