# terraform-aws-rad-security-connect

The module allows you to connect your AWS account to Rad Security to allow them to be able to scan and analyze your AWS resources.

## Terraform Registry

This module is available in the [Terraform Registry](https://registry.terraform.io/) see [here](https://registry.terraform.io/modules/rad-security/rad-security-connect/aws/latest). It uses the official Rad Security Provider to authenticate and connect your AWS account to Rad Security. The Rad Security Provider can be found here in the [Terraform Provider Registry](https://registry.terraform.io/providers/rad-security/rad-security/latest).

## Contributing

The most important thing to be aware of when contributing is that we leverage the [Semantic Release Action](https://github.com/cycjimmy/semantic-release-action) to automate our changelog, see [here](CHANGELOG.md).

This requires us to use [conventional git commits](https://www.conventionalcommits.org/en/v1.0.0/) when committing to this repository.

Each PR merge into the `main` branch will execute the release process defined [here](.github/workflows/release.yml).

## Usage

This module requires you to obtain a set of cloud API credentials from Rad Security (access_key/secret). It will use those credentials to connect your AWS account to your Rad Security account.

The module needs an AWS provider to be configured. It will create an IAM Role in your account called `rad-security-connect`. The IAM Role has fine-grained policies attached (prefixed with `rad-security_connect_policy`), which will allow the `rad-security-connector` role in Rad Security's AWS account to assume the permissions necessary to interact with AWS resources in your account.

When the `rad-security-connect` Role is created, it will be added to your Rad Security account through the `rad-security_aws_register` resource.

### EKS Audit Logs

There is an optional flag `enable_eks_audit_logs_pipeline` which will create a CloudWatch Logs -> FireHose -> S3 pipeline for all EKS clusters in the account. This is required for Rad Security to be able to analyse EKS audit logs. Make sure to enable EKS audit logs for EKS clusters you wish to be analysed. By default, the pipeline creates policy for CloudWatch in all four US regions. If you have EKS clusters in other regions, you can override the `eks_audit_logs_regions` variable.

Also, only clusters in the same region as your AWS provider will be included in the pipeline. If you have EKS clusters in multiple regions, you need to enable `eks_audit_logs_multi_region` flag and create subscription filters in each region outside of this module (see example in the [examples/audit_logs_multi_region](https://github.com/rad-security/terraform-aws-rad-security-connect/tree/main/examples/audit_logs_multi_region) directory).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0 |
| <a name="requirement_rad-security"></a> [rad-security](#requirement\_rad-security) | >= 1.0.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0.0 |
| <a name="provider_rad-security"></a> [rad-security](#provider\_rad-security) | >= 1.0.3 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_subscription_filter.subscription_filter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_subscription_filter) | resource |
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy.connect_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.ksoc_s3_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.ksoc_s3_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.cloudwatch_to_firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.firehose_to_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.ksoc_s3_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.rad-security_connect_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kinesis_firehose_delivery_stream.firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_s3_bucket.audit_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_lifecycle_configuration.audit_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_public_access_block.audit_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.audit_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.audit_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [rad-security_aws_register.this](https://registry.terraform.io/providers/rad-security/rad-security/latest/docs/resources/aws_register) | resource |
| [random_id.uniq](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_cloudwatch_log_groups.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudwatch_log_groups) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cloudwatch_assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.firehose_assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.firehose_to_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ksoc_assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ksoc_s3_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.logs_to_firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_external_id"></a> [aws\_external\_id](#input\_aws\_external\_id) | External ID to use when connecting an AWS account with Rad | `string` | `""` | no |
| <a name="input_eks_audit_log_cloudwatch_role_arn"></a> [eks\_audit\_log\_cloudwatch\_role\_arn](#input\_eks\_audit\_log\_cloudwatch\_role\_arn) | The ARN of the IAM role that CloudWatch Logs will use to send data to the Firehose. Required for secondary regions. | `string` | `""` | no |
| <a name="input_eks_audit_log_firehose_role_arn"></a> [eks\_audit\_log\_firehose\_role\_arn](#input\_eks\_audit\_log\_firehose\_role\_arn) | The ARN of the IAM role that will be used to write to the Firehose. Required for secondary regions. | `string` | `""` | no |
| <a name="input_eks_audit_logs_bucket_versioning_enabled"></a> [eks\_audit\_logs\_bucket\_versioning\_enabled](#input\_eks\_audit\_logs\_bucket\_versioning\_enabled) | Enable versioning for the S3 bucket that will store EKS audit logs | `bool` | `true` | no |
| <a name="input_eks_audit_logs_filter_pattern"></a> [eks\_audit\_logs\_filter\_pattern](#input\_eks\_audit\_logs\_filter\_pattern) | The Cloudwatch Log Subscription Filter pattern | `string` | `"{ $.stage = \"ResponseComplete\" && $.requestURI != \"/version\" && $.requestURI != \"/version?*\" && $.requestURI != \"/metrics\" && $.requestURI != \"/metrics?*\" && $.requestURI != \"/logs\" && $.requestURI != \"/logs?*\" && $.requestURI != \"/swagger*\" && $.requestURI != \"/livez*\" && $.requestURI != \"/readyz*\" && $.requestURI != \"/healthz*\" }"` | no |
| <a name="input_enable_eks_audit_logs_pipeline"></a> [enable\_eks\_audit\_logs\_pipeline](#input\_enable\_eks\_audit\_logs\_pipeline) | Enable EKS Audit Logs Pipeline (CloudWatch Logs -> FireHose -> S3) | `bool` | `false` | no |
| <a name="input_rad-security_assumed_role_arn"></a> [rad-security\_assumed\_role\_arn](#input\_rad-security\_assumed\_role\_arn) | Rad Security Role that will assume the rad-security-connect IAM role you create to interact with resources in your account | `string` | `"arn:aws:iam::955322216602:role/rad-security-connector"` | no |
| <a name="input_rad-security_deprecated_assumed_role_arn"></a> [rad-security\_deprecated\_assumed\_role\_arn](#input\_rad-security\_deprecated\_assumed\_role\_arn) | Deprecated Rad Security Role that will assume the rad-security-connect IAM role you create to interact with resources in your account. This role will be removed in the future. | `string` | `"arn:aws:iam::955322216602:role/ksoc-connector"` | no |
| <a name="input_rad-security_eks_audit_logs_assumed_role_arn"></a> [rad-security\_eks\_audit\_logs\_assumed\_role\_arn](#input\_rad-security\_eks\_audit\_logs\_assumed\_role\_arn) | Rad Security Role dedicated for EKS audit logs that will be allowed to assume | `string` | `"arn:aws:iam::955322216602:role/ksoc-data-pipeline"` | no |
| <a name="input_secondary_region"></a> [secondary\_region](#input\_secondary\_region) | Enable this if running in a another region. It will disable the creation of global resources. | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A set of tags to associate with the resources in this module. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eks_audit_logs_cloudwatch_iam_role_arn"></a> [eks\_audit\_logs\_cloudwatch\_iam\_role\_arn](#output\_eks\_audit\_logs\_cloudwatch\_iam\_role\_arn) | AWS IAM Role ARN for Cloudwatch to Firehose |
| <a name="output_eks_audit_logs_filter_pattern"></a> [eks\_audit\_logs\_filter\_pattern](#output\_eks\_audit\_logs\_filter\_pattern) | The Cloudwatch Log Subscription Filter pattern |
| <a name="output_eks_audit_logs_firehose_arn"></a> [eks\_audit\_logs\_firehose\_arn](#output\_eks\_audit\_logs\_firehose\_arn) | The Firehose delivery stream ARN |
| <a name="output_eks_audit_logs_firehose_iam_role_arn"></a> [eks\_audit\_logs\_firehose\_iam\_role\_arn](#output\_eks\_audit\_logs\_firehose\_iam\_role\_arn) | AWS IAM Role ARN for Firehose to S3 |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | AWS IAM Role ARN which Rad Security uses to connect |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License
Apache 2 Licensed. See [LICENSE](LICENSE) for full details.
