resource "aws_s3_bucket_lifecycle_configuration" "audit_logs" {
  count  = var.enable_eks_audit_logs_pipeline ? 1 : 0
  bucket = aws_s3_bucket.audit_logs[0].bucket

  rule {
    id     = "delete-old-objects"
    status = "Enabled"

    filter {}

    expiration {
      days = var.eks_audit_logs_bucket_object_age
    }

    noncurrent_version_expiration {
      noncurrent_days = var.eks_audit_logs_bucket_object_age
    }

    abort_incomplete_multipart_upload {
      days_after_initiation = var.eks_audit_logs_bucket_object_age
    }
  }
}
