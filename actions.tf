# We need to create multiple policies due to the number of actions that are required.

locals {
  number_of_iam_policies = 2

  aws_iam_actions = [
    "account:GetAlternateContact",
    "acm:DescribeCertificate",
    "acm:ListCertificates",
    "apigateway:GET",
    "application-autoscaling:DescribeScalingPolicies",
    "autoscaling:DescribeAutoScalingGroups",
    "autoscaling:DescribeLaunchConfigurations",
    "autoscaling:DescribeLifecycleHooks",
    "autoscaling:DescribeLoadBalancerTargetGroups",
    "autoscaling:DescribeLoadBalancers",
    "autoscaling:DescribeNotificationConfigurations",
    "autoscaling:DescribePolicies",
    "backup:DescribeRecoveryPoint",
    "backup:GetBackupPlan",
    "backup:GetBackupVaultAccessPolicy",
    "backup:ListBackupPlans",
    "backup:ListBackupVaults",
    "backup:ListRecoveryPointsByBackupVault",
    "cloudformation:DescribeStacks",
    "cloudformation:ListStacks",
    "cloudfront:GetDistribution",
    "cloudfront:ListDistributions",
    "cloudtrail:DescribeTrails",
    "cloudtrail:GetEventSelectors",
    "cloudtrail:GetTrail",
    "cloudtrail:GetTrailStatus",
    "cloudtrail:ListTags",
    "cloudtrail:ListTrails",
    "cloudwatch:DescribeAlarms",
    "cloudwatch:ListMetrics",
    "cloudwatch:ListTagsForResource",
    "codebuild:BatchGetProjects",
    "codebuild:ListProjects",
    "codebuild:ListSharedProjects",
    "codepipeline:GetPipeline",
    "codepipeline:ListPipelines",
    "codepipeline:ListWebhooks",
    "config:DescribeConfigurationRecorderStatus",
    "config:DescribeConfigurationRecorders",
    "config:DescribeDeliveryChannels",
    "dax:DescribeClusters",
    "dax:ListTags",
    "directconnect:DescribeConnections",
    "directconnect:DescribeLags",
    "dms:DescribeReplicationInstances",
    "dynamodb:DescribeContinuousBackups",
    "dynamodb:DescribeTable",
    "dynamodb:DescribeTableReplicaAutoScaling",
    "dynamodb:ListTables",
    "dynamodb:ListTagsOfResource",
    "ec2:DescribeAddresses",
    "ec2:DescribeFlowLogs",
    "ec2:DescribeHosts",
    "ec2:DescribeImageAttribute",
    "ec2:DescribeImages",
    "ec2:DescribeInstances",
    "ec2:DescribeInternetGateways",
    "ec2:DescribeNetworkAcls",
    "ec2:DescribeNetworkInterfaces",
    "ec2:DescribeRegions",
    "ec2:DescribeRouteTables",
    "ec2:DescribeSecurityGroups",
    "ec2:DescribeSnapshotAttribute",
    "ec2:DescribeSnapshots",
    "ec2:DescribeSubnets",
    "ec2:DescribeTransitGatewayAttachments",
    "ec2:DescribeTransitGateways",
    "ec2:DescribeVolumes",
    "ec2:DescribeVpcEndpoints",
    "ec2:DescribeVpcs",
    "ec2:DescribeVpnConnections",
    "ec2:DescribeVpnGateways",
    "ec2:GetEbsDefaultKmsKeyId",
    "ec2:GetEbsEncryptionByDefault",
    "ecr:DescribeImageScanFindings",
    "ecr:DescribeImages",
    "ecr:DescribeRegistry",
    "ecr:DescribeRepositories",
    "ecr:GetLifecyclePolicy",
    "ecr:GetRepositoryPolicy",
    "ecr:ListTagsForResource",
    "ecs:DescribeClusters",
    "ecs:DescribeServices",
    "ecs:ListClusters",
    "ecs:ListServices",
    "ecs:ListTaskDefinitions",
    "eks:DescribeAccessEntry",
    "eks:DescribeAddon",
    "eks:DescribeCluster",
    "eks:DescribeFargateProfile",
    "eks:DescribeIdentityProviderConfig",
    "eks:DescribeNodegroup",
    "eks:ListAccessEntries",
    "eks:ListAddons",
    "eks:ListClusters",
    "eks:ListFargateProfiles",
    "eks:ListIdentityProviderConfigs",
    "eks:ListNodegroups",
    "elasticache:DescribeCacheClusters",
    "elasticache:DescribeSnapshots",
    "elasticache:ListTagsForResource",
    "elasticbeanstalk:DescribeConfigurationSettings",
    "elasticbeanstalk:DescribeEnvironmentResources",
    "elasticbeanstalk:DescribeEnvironments",
    "elasticfilesystem:DescribeAccessPoints",
    "elasticfilesystem:DescribeFileSystemPolicy",
    "elasticfilesystem:DescribeFileSystems",
    "elasticloadbalancing:DescribeListeners",
    "elasticloadbalancing:DescribeLoadBalancerAttributes",
    "elasticloadbalancing:DescribeLoadBalancerPolicies",
    "elasticloadbalancing:DescribeLoadBalancers",
    "elasticloadbalancing:DescribeTags",
    "elasticloadbalancing:DescribeTargetGroups",
    "elasticmapreduce:DescribeCluster",
    "elasticmapreduce:ListClusters",
    "es:DescribeDomain",
    "es:ListDomainNames",
    "guardduty:GetDetector",
    "guardduty:GetFindings",
    "guardduty:ListDetectors",
    "guardduty:ListFilters",
    "guardduty:ListFindings",
    "guardduty:ListIPSets",
    "guardduty:ListMembers",
    "guardduty:ListPublishingDestinations",
    "guardduty:ListThreatIntelSets",
    "iam:GenerateServiceLastAccessedDetails",
    "iam:GetAccountAuthorizationDetails",
    "iam:GetAccountPasswordPolicy",
    "iam:GetAccountSummary",
    "iam:GetCredentialReport",
    "iam:GetGroup",
    "iam:GetGroupPolicy",
    "iam:GetPolicy",
    "iam:GetRole",
    "iam:GetRolePolicy",
    "iam:GetServiceLastAccessedDetails",
    "iam:GetUser",
    "iam:ListAccountAliases",
    "iam:ListAttachedRolePolicies",
    "iam:ListAttachedUserPolicies",
    "iam:ListGroupPolicies",
    "iam:ListGroups",
    "iam:ListPolicies",
    "iam:ListPolicyTags",
    "iam:ListRolePolicies",
    "iam:ListRoles",
    "iam:ListUsers",
    "iam:ListVirtualMFADevices",
    "inspector2:ListCoverage",
    "kinesis:DescribeStream",
    "kinesis:ListStreams",
    "kms:DescribeKey",
    "kms:GetKeyPolicy",
    "kms:GetKeyRotationStatus",
    "kms:ListGrants",
    "kms:ListKeys",
    "kms:ListResourceTags",
    "lambda:GetFunction",
    "lambda:GetFunctionCodeSigningConfig",
    "lambda:GetPolicy",
    "lambda:GetRuntimeManagementConfig",
    "lambda:ListAliases",
    "lambda:ListEventSourceMappings",
    "lambda:ListFunctionEventInvokeConfigs",
    "lambda:ListFunctionUrlConfigs",
    "lambda:ListFunctions",
    "lambda:ListProvisionedConcurrencyConfigs",
    "lambda:ListTags",
    "lambda:ListVersionsByFunction",
    "lightsail:GetContainerServiceDeployments",
    "lightsail:GetContainerServices",
    "lightsail:GetDisk",
    "lightsail:GetDisks",
    "lightsail:GetDistributions",
    "lightsail:GetInstances",
    "lightsail:GetLoadBalancer",
    "lightsail:GetLoadBalancers",
    "lightsail:GetStaticIp",
    "lightsail:GetStaticIps",
    "logs:DescribeLogGroups",
    "logs:DescribeMetricFilters",
    "logs:DescribeSubscriptionFilters",
    "logs:ListTagsLogGroup",
    "organizations:DescribeAccount",
    "organizations:DescribeOrganization",
    "organizations:ListAccounts",
    "rds:DescribeDBClusterSnapshotAttributes",
    "rds:DescribeDBClusterSnapshots",
    "rds:DescribeDBClusters",
    "rds:DescribeDBInstances",
    "rds:DescribeDBSecurityGroups",
    "rds:DescribeDBSnapshots",
    "rds:DescribeEventSubscriptions",
    "rds:ListTagsForResource",
    "redshift:DescribeClusterParameterGroups",
    "redshift:DescribeClusterParameters",
    "redshift:DescribeClusters",
    "route53:GetHostedZone",
    "route53:ListHostedZones",
    "route53:ListQueryLoggingConfigs",
    "route53:ListResourceRecordSets",
    "route53:ListTagsForResources",
    "route53:ListTrafficPolicyInstancesByHostedZone",
    "s3:GetAccessGrant",
    "s3:GetAccountPublicAccessBlock",
    "s3:GetBucketAcl",
    "s3:GetBucketCors",
    "s3:GetBucketLocation",
    "s3:GetBucketLogging",
    "s3:GetBucketNotification",
    "s3:GetBucketObjectLockConfiguration",
    "s3:GetBucketPolicy",
    "s3:GetBucketPolicyStatus",
    "s3:GetBucketPublicAccessBlock",
    "s3:GetBucketTagging",
    "s3:GetBucketVersioning",
    "s3:GetBucketWebsite",
    "s3:GetEncryptionConfiguration",
    "s3:GetLifecycleConfiguration",
    "s3:GetReplicationConfiguration",
    "s3:ListAllMyBuckets",
    "s3:ListBucket",
    "sagemaker:DescribeApp",
    "sagemaker:DescribeEndpointConfig",
    "sagemaker:DescribeNotebookInstance",
    "sagemaker:ListApps",
    "sagemaker:ListEndpointConfigs",
    "sagemaker:ListNotebookInstances",
    "secretsmanager:DescribeSecret",
    "secretsmanager:GetResourcePolicy",
    "secretsmanager:ListSecretVersionIds",
    "secretsmanager:ListSecrets",
    "securityhub:GetEnabledStandards",
    "securityhub:GetFindings",
    "shield:DescribeAttack",
    "shield:DescribeProtection",
    "shield:DescribeProtectionGroup",
    "shield:DescribeSubscription",
    "shield:ListAttacks",
    "shield:ListProtectionGroups",
    "shield:ListProtections",
    "sns:GetSubscriptionAttributes",
    "sns:GetTopicAttributes",
    "sns:ListSubscriptions",
    "sns:ListTagsForResource",
    "sns:ListTopics",
    "sqs:GetQueueAttributes",
    "sqs:ListQueueTags",
    "sqs:ListQueues",
    "ssm:DescribeDocument",
    "ssm:DescribeDocumentPermission",
    "ssm:DescribeInstanceInformation",
    "ssm:DescribeInstancePatches",
    "ssm:DescribeParameters",
    "ssm:GetDocument",
    "ssm:ListComplianceItems",
    "ssm:ListDocumentVersions",
    "ssm:ListDocuments",
    "waf:GetWebACL",
    "waf:ListRuleGroups",
    "waf:ListWebACLs",
    "wafv2:ListRuleGroups",
    "wafv2:ListWebACLs"
  ]

  policy_action_size = ceil(length(local.aws_iam_actions) / local.number_of_iam_policies)

  policy_actions = var.secondary_region ? [] : [for i in range(0, length(local.aws_iam_actions), local.policy_action_size) :
  slice(local.aws_iam_actions, i, min(i + local.policy_action_size, length(local.aws_iam_actions)))]
}

# trivy:ignore:AVD-AWS-0057
resource "aws_iam_policy" "connect_policy" {
  for_each = { for idx, sa in local.policy_actions : idx => sa }

  name        = "rad-security_connect_policy_${each.key}"
  path        = "/"
  description = "Part ${each.key} of the policy required for rad-security-connect"

  tags = var.tags

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = each.value
      Resource = "*"
    }]
  })

}

resource "aws_iam_role_policy_attachment" "rad-security_connect_policy_attachment" {
  for_each = aws_iam_policy.connect_policy

  role       = aws_iam_role.this[0].name
  policy_arn = each.value.arn
}
