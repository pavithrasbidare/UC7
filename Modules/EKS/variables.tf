variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
  default     = "my-eks-cluster"
}

variable "region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID for the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "eks_cluster_role_arn" {
  description = "IAM Role ARN for EKS Cluster"
  type        = string
}

variable "node_role_arn" {
  description = "IAM Role ARN for EKS worker nodes"
  type        = string
}

variable "instance_types" {
  description = "EC2 instance types for the EKS worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

# In the variables.tf of the EKS module

variable "image_url_patient" {
  description = "The URL of the patient service Docker image in ECR"
  type        = string
}

# In the variables.tf of the EKS module

variable "image_url" {
  description = "The URL of the Appointment service Docker image in ECR"
  type        = string
}
