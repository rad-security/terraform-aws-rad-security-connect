variable "rad-security_assumed_role_arn" {
  type        = string
  description = "Rad Security Role that will assume the rad-security-connect IAM role you create to interact with resources in your account"
  default     = "arn:aws:iam::955322216602:role/rad-security-connector"
}

variable "rad-security_deprecated_assumed_role_arn" {
  type        = string
  description = "Deprecated Rad Security Role that will assume the rad-security-connect IAM role you create to interact with resources in your account. This role will be removed in the future."
  default     = "arn:aws:iam::955322216602:role/ksoc-connector"
}

variable "enable_eks_audit_logs_pipeline" {
  type        = bool
  description = "Enable EKS Audit Logs Pipeline (CloudWatch Logs -> FireHose -> S3)"
  default     = false
}

variable "eks_audit_logs_bucket_versioning_enabled" {
  type        = bool
  description = "Enable versioning for the S3 bucket that will store EKS audit logs"
  default     = true
}

variable "rad-security_eks_audit_logs_assumed_role_arn" {
  type        = string
  description = "Rad Security Role dedicated for EKS audit logs that will be allowed to assume"
  default     = "arn:aws:iam::955322216602:role/ksoc-data-pipeline"
}

variable "eks_audit_logs_filter_pattern" {
  type        = string
  default     = "{ $.stage = \"ResponseComplete\" && $.requestURI != \"/version\" && $.requestURI != \"/version?*\" && $.requestURI != \"/metrics\" && $.requestURI != \"/metrics?*\" && $.requestURI != \"/logs\" && $.requestURI != \"/logs?*\" && $.requestURI != \"/swagger*\" && $.requestURI != \"/livez*\" && $.requestURI != \"/readyz*\" && $.requestURI != \"/healthz*\" }"
  description = "The Cloudwatch Log Subscription Filter pattern"
}

variable "eks_audit_logs_regions" {
  type        = list(string)
  default     = ["us-east-1", "us-east-2", "us-west-1", "us-west-2"]
  description = "Regions from which Cloudwatch will be allowed to send logs to the Firehose"
}

variable "eks_audit_logs_multi_region" {
  type        = bool
  default     = false
  description = "Enable multi-region support for the EKS audit logs. This requires creating subscription filters in each region outside of this module. See documentation for more information."
}

variable "tags" {
  description = "A set of tags to associate with the resources in this module."
  type        = map(string)
  default     = {}
}

variable "aws_external_id" {
  description = "External ID to use when connecting an AWS account with Rad"
  type        = string
  default     = ""
}
