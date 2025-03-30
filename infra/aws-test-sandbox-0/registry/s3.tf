module "bsentika_razer_registry_test_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "4.6.0"

  bucket = "bsentika3-razer-registry-test"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }

}

module "razer_registry_iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"

  name          = "bsentika3-razer-registry-user"
  force_destroy = true

  password_reset_required = false

  policy_arns = [module.razer_registry_iam_policy.arn]
}

module "razer_registry_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"

  name        = "razer_registry_test_policy"
  path        = "/"
  description = "S3 RW policy to bsentika3-razer-registry-test bucket"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "${module.bsentika_razer_registry_test_bucket.s3_bucket_arn}",
        "${module.bsentika_razer_registry_test_bucket.s3_bucket_arn}/*"
      ]
    }
  ]
}
EOF
}