variable "env_name" {
  type = string
  default = "dev-srhoton"
  description = "Environment name"
}

variable "region" {
  type = string
  default = "us-west-2"
  description = "AWS region"
}

variable "account_id" {
  type = string
  default = "705740530616"
  description = "AWS account ID"
}

variable "private_subnet_ids" {
  type = list(string)
  default = ["subnet-0904458b33599d9ff", "subnet-0f4714819ba51a2f4"]
  description = "Private subnet IDs"
}

variable "airflow_version" {
  type = string
  default = "2.2.2"
  description = "Airflow version"
}

variable "environment_class" {
  type = string
  default = "mw1.small"
  description = "Environment class"
}

variable "webserver_access_mode" {
  type = string
  default = "PRIVATE_ONLY"
  description = "Webserver access mode"
}

variable "dag_s3_path" {
  type = string
  default = "dags/"
  description = "DAG S3 path"
}

variable "vpc_id" {
  type = string
  default = "vpc-078f50d0db03c36d6"
  description = "VPC ID"
}