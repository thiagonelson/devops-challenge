output "cluster_name" {
   description = "K8s Cluster Name:"
   value       = local.cluster_name 
}

output "region" {
  description = "Region:"
  value       = var.region
}

output "loadbalance" {
  description = "Loadbalance Private IP"
  value       = aws_instance.loadbalance.private_ip
}

output "loadbalance_pub" { 
  description = "Loadbalance Public IP"
  value       = aws_instance.loadbalance.public_ip
}
