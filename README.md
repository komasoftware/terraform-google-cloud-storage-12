# 0.12 Compatible

- Clone of https://github.com/terraform-google-modules/terraform-google-cloud-storage
- 0.12 compatible

# Terraform Google Cloud Storage Module

This module makes it easy to create one or more GCS buckets, and assign basic permissions on them to arbitrary users.

The resources/services/activations/deletions that this module will create/trigger are:

- One or more GCS buckets
- Zero or more IAM bindings for those buckets

## Usage

Basic usage of this module is as follows:

```hcl
module "gcs_buckets" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "~> 0.1"
  project_id  = "<PROJECT ID>"
  names = ["first", "second"]
  prefix = "my-unique-prefix"
  set_admin_roles = true
  admins = ["group:foo-admins@example.com"]
  versioning = {
    first = true
  }
  bucket_admins = {
    second = "user:spam@example.com,eggs@example.com"
  }
}
```

Functional examples are included in the
[examples](./examples/) directory.

[^]: (autogen_docs_start)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| admins | IAM-style members who will be granted roles/storage.objectAdmin on all buckets. | list | `<list>` | no |
| bucket\_admins | Map of lowercase unprefixed name => comma-delimited IAM-style bucket admins. | map | `<map>` | no |
| bucket\_creators | Map of lowercase unprefixed name => comma-delimited IAM-style bucket creators. | map | `<map>` | no |
| bucket\_policy\_only | Disable ad-hoc ACLs on specified buckets. Defaults to true. Map of lowercase unprefixed name => boolean | map | `<map>` | no |
| bucket\_viewers | Map of lowercase unprefixed name => comma-delimited IAM-style bucket viewers. | map | `<map>` | no |
| creators | IAM-style members who will be granted roles/storage.objectCreators on all buckets. | list | `<list>` | no |
| labels | Labels to be attached to the buckets | map | `<map>` | no |
| location | Bucket location. | string | `"EU"` | no |
| names | Bucket name suffixes. | list | n/a | yes |
| prefix | Prefix used to generate the bucket name. | string | n/a | yes |
| project\_id | Bucket project id. | string | n/a | yes |
| set\_admin\_roles | Grant roles/storage.objectAdmin role to admins and bucket_admins. | string | `"false"` | no |
| set\_creator\_roles | Grant roles/storage.objectCreator role to creators and bucket_creators. | string | `"false"` | no |
| set\_viewer\_roles | Grant roles/storage.objectViewer role to viewers and bucket_viewers. | string | `"false"` | no |
| storage\_class | Bucket storage class. | string | `"MULTI_REGIONAL"` | no |
| versioning | Optional map of lowercase unprefixed name => boolean, defaults to false. | map | `<map>` | no |
| viewers | IAM-style members who will be granted roles/storage.objectViewer on all buckets. | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| name | Bucket name of the first bucket (for single-use cases). |
| names | Map of unprefixed names => bucket names. |
| url | URL of the first bucket (for single-use cases). |
| urls | Map of unprefixed names => bucket URLs. |

[^]: (autogen_docs_end)

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform][terraform] v0.12.5
- [Terraform Provider for GCP][terraform-provider-gcp] plugin v2.0

### Service Account

User or service account credentials with the following roles must be used to provision the resources of this module:

- Storage Admin: `roles/storage.admin`

The [Project Factory module][project-factory-module] and the
[IAM module][iam-module] may be used in combination to provision a
service account with the necessary roles applied.

### APIs

A project with the following APIs enabled must be used to host the
resources of this module:

- Google Cloud Storage JSON API: `storage-api.googleapis.com`

The [Project Factory module][project-factory-module] can be used to
provision a project with the necessary APIs enabled.

## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.

[iam-module]: https://registry.terraform.io/modules/terraform-google-modules/iam/google
[project-factory-module]: https://registry.terraform.io/modules/terraform-google-modules/project-factory/google
[terraform-provider-gcp]: https://www.terraform.io/docs/providers/google/index.html
[terraform]: https://www.terraform.io/downloads.html
