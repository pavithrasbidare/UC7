# ------------------------------
# VPC Module
# ------------------------------
module "vpc" {
  source              = "../Modules/VPC"
  vpc_cidr            = var.vpc_cidr
  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
  availability_zones  = var.availability_zones
}

# ------------------------------
# IAM Module
# ------------------------------
module "iam" {
  source = "../Modules/IAM"
}

# ------------------------------
# ECR Module
# ------------------------------
module "ecr" {
  source    = "../Modules/ECR"
  repo_name = var.repo_name
}

# ------------------------------
# EKS Module (Cluster & Node Group)
# ------------------------------
module "eks" {
  source           = "../Modules/EKS"
  cluster_name     = var.cluster_name
  vpc_id           = module.vpc.vpc_id
  subnet_ids       = module.vpc.private_subnets
  eks_cluster_role_arn    = module.iam.eks_role_arn
  node_role_arn       = module.iam.node_role_arn
  instance_types   = var.instance_types
  desired_size     = var.desired_size
  min_size         = var.min_size
  max_size         = var.max_size
  image_url_patient = var.image_url_patient
  image_url = var.image_url
}
