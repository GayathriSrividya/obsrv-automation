variable "env" {
  type        = string
  description = "Environment name. All resources will be prefixed with this value."
  default     = "dev"
}

variable "building_block" {
  type        = string
  description = "Building block name. All resources will be prefixed with this value."
  default     = "obsrv"
}

variable "region" {
  type        = string
  description = "AWS region to create the resources."
  default     = "us-east-2"
}

variable "flink_checkpoint_store_type" {
  type        = string
  description = "Flink checkpoint store type."
  default     = "s3"
}

variable "druid_deepstorage_type" {
  type        = string
  description = "Druid deep strorage type."
  default     = "s3"
}

variable "kubernetes_storage_class" {
  type        = string
  description = "Storage class name for the Kubernetes cluster"
  default     = "gp2"
}

variable "dataset_api_container_registry" {
  type        = string
  description = "Container registry. For example docker.io/obsrv"
  default     = "sunbird"
}

variable "dataset_api_image_tag" {
  type        = string
  description = "Dataset api image tag."
  default     = "1.0.0"
}

variable "flink_container_registry" {
  type        = string
  description = "Container registry. For example docker.io/obsrv"
  default     = "sunbird"
}

variable "flink_image_tag" {
   type        = string
   description = "Flink kubernetes service name."
   default     = "1.0.0"
}

variable "storage_class" {
  type        = string
  description = "Storage Class"
  default     = "gp2"
}

variable "web_console_configs" {
  type = map
  description = "Web console config variables. See below commented code for values that need to be passed"
  default = {
    port                               = "3000"
    app_name                           = "obsrv-web-console"
    prometheus_url                     = "http://monitoring-kube-prometheus-prometheus.monitoring:9090"
    react_app_grafana_url              = "http://localhost:80"
    react_app_superset_url             = "http://localhost:8081"
    https                              = "false"
    react_app_version                  = "v1.2.0"
    generate_sourcemap                 = "false"
  } 
}

variable "web_console_image_tag" {
  type        = string
  description = "web console image tag."
  default = "1.0.0"
}

variable "web_console_image_repository" {
  type        = string
  description = "Container registry. For example docker.io/obsrv"
  default     = "sunbird"
}

variable "flink_release_names" {
  description = "Create release names"
  type        = map(string)
  default = {
    extractor       = "sb-obsrv-extractor"
    preprocessor    = "sb-obsrv-preprocessor"
    denormalizer    = "sb-obsrv-denormalizer"
    transformer     = "sb-obsrv-transformer"
    druid-router    = "sb-obsrv-druid-router"
    master-data-processor = "sb-obsrv-master-data-processor"
  }
}

variable "flink_merged_pipeline_release_names" {
  description = "Create release names"
  type        = map(string)
  default = {
    merged-pipeline = "sb-obsrv-merged-pipeline"
    master-data-processor = "sb-obsrv-master-data-processor"
  }
}

variable "merged_pipeline_enabled" {
  description = "Toggle to deploy merged pipeline"
  type = bool
  default = true
}
variable "postgresql_service_name" {
  type        = string
  description = "Postgresql service name."
}

variable "setup_sb_datasets_enabled" {
  type        = bool
  description = "Toggle for the activation of default datasets creation during deployment"
  default     = false
}

variable "is_sunbird_release" {
  type        = bool
  description = "Toggle for the activation of kafka connector during deployment"
  default     = true
}