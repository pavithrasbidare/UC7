variable "eks_node_role_name" {
  description = "Name of the IAM role for EKS Node group"
  type        = string
  default     = "eks-node-role"
}
