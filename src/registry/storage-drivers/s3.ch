%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Explains how to use the S3 storage drivers
keywords: registry, service, driver, images, storage,  S3
title: S3 storage driver
---
@y
---
description: Explains how to use the S3 storage drivers
keywords: registry, service, driver, images, storage,  S3
title: S3 storage driver
---
@z

@x
{% include registry.md %}
@y
{% include registry.md %}
@z

@x
An implementation of the `storagedriver.StorageDriver` interface which uses
Amazon S3 or S3 compatible services for object storage.
@y
An implementation of the `storagedriver.StorageDriver` interface which uses
Amazon S3 or S3 compatible services for object storage.
@z

@x
## Parameters
@y
## Parameters
@z

@x
| Parameter     | Required | Description                                                                                                                                                                                                                                                         |
|:--------------|:---------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `accesskey` | no     | Your AWS Access Key. If you use [IAM roles](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html), omit to fetch temporary credentials from IAM. |
| `secretkey`  | no   | Your AWS Secret Key. If you use [IAM roles](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html), omit to fetch temporary credentials from IAM. |
| `region` |  yes  | The AWS region in which your bucket exists. For the moment, the Go AWS library in use does not use the newer DNS based bucket routing. |
| `regionendpoint` | no | Endpoint for S3 compatible storage services (Minio, etc). |
| `bucket`  | yes | The bucket name in which you want to store the registry's data. |
| `encrypt`  | no | Specifies whether the registry stores the image in encrypted format or not. A boolean value. The default is `false`. |
| `keyid`  | no | Optional KMS key ID to use for encryption (encrypt must be true, or this parameter is ignored). The default is `none`. |
| `secure`  | no | Indicates whether to use HTTPS instead of HTTP. A boolean value. The default is `true`. |
| `skipverify`  | no  | Skips TLS verification when the value is set to `true`. The default is `false`. |
| `v4auth`  | no | Indicates whether the registry uses Version 4 of AWS's authentication. The default is `true`. |
| `chunksize`  | no | The S3 API requires multipart upload chunks to be at least 5MB. This value should be a number that is larger than 5 * 1024 * 1024.|
| `rootdirectory`  | no | This is a prefix that is applied to all S3 keys to allow you to segment data in your bucket if necessary. |
| `storageclass`  | no | The S3 storage class applied to each registry file. The default is `STANDARD`. |
@y
| Parameter     | Required | Description                                                                                                                                                                                                                                                         |
|:--------------|:---------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `accesskey` | no     | Your AWS Access Key. If you use [IAM roles](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html), omit to fetch temporary credentials from IAM. |
| `secretkey`  | no   | Your AWS Secret Key. If you use [IAM roles](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html), omit to fetch temporary credentials from IAM. |
| `region` |  yes  | The AWS region in which your bucket exists. For the moment, the Go AWS library in use does not use the newer DNS based bucket routing. |
| `regionendpoint` | no | Endpoint for S3 compatible storage services (Minio, etc). |
| `bucket`  | yes | The bucket name in which you want to store the registry's data. |
| `encrypt`  | no | Specifies whether the registry stores the image in encrypted format or not. A boolean value. The default is `false`. |
| `keyid`  | no | Optional KMS key ID to use for encryption (encrypt must be true, or this parameter is ignored). The default is `none`. |
| `secure`  | no | Indicates whether to use HTTPS instead of HTTP. A boolean value. The default is `true`. |
| `skipverify`  | no  | Skips TLS verification when the value is set to `true`. The default is `false`. |
| `v4auth`  | no | Indicates whether the registry uses Version 4 of AWS's authentication. The default is `true`. |
| `chunksize`  | no | The S3 API requires multipart upload chunks to be at least 5MB. This value should be a number that is larger than 5 * 1024 * 1024.|
| `rootdirectory`  | no | This is a prefix that is applied to all S3 keys to allow you to segment data in your bucket if necessary. |
| `storageclass`  | no | The S3 storage class applied to each registry file. The default is `STANDARD`. |
@z

@x
> **Note** You can provide empty strings for your access and secret keys to run the driver
> on an ec2 instance and handles authentication with the instance's credentials. If you
> use [IAM roles](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html),
> omit these keys to fetch temporary credentials from IAM.
@y
> **Note** You can provide empty strings for your access and secret keys to run the driver
> on an ec2 instance and handles authentication with the instance's credentials. If you
> use [IAM roles](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html),
> omit these keys to fetch temporary credentials from IAM.
@z

@x
`region`: The name of the aws region in which you would like to store objects (for example `us-east-1`). For a list of regions, see [Regions, Availability Zones, and Local Zones](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html).
@y
`region`: The name of the aws region in which you would like to store objects (for example `us-east-1`). For a list of regions, see [Regions, Availability Zones, and Local Zones](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html).
@z

@x
`regionendpoint`: (optional) Endpoint URL for S3 compatible APIs. This should not be provided when using Amazon S3.
@y
`regionendpoint`: (optional) Endpoint URL for S3 compatible APIs. This should not be provided when using Amazon S3.
@z

@x
`bucket`: The name of your S3 bucket where you wish to store objects. The bucket must exist prior to the driver initialization.
@y
`bucket`: The name of your S3 bucket where you wish to store objects. The bucket must exist prior to the driver initialization.
@z

@x
`encrypt`: (optional) Whether you would like your data encrypted on the server side (defaults to false if not specified).
@y
`encrypt`: (optional) Whether you would like your data encrypted on the server side (defaults to false if not specified).
@z

@x
`keyid`: (optional) Whether you would like your data encrypted with this KMS key ID (defaults to none if not specified, is ignored if encrypt is not true).
@y
`keyid`: (optional) Whether you would like your data encrypted with this KMS key ID (defaults to none if not specified, is ignored if encrypt is not true).
@z

@x
`secure`: (optional) Whether you would like to transfer data to the bucket over ssl or not. Defaults to true (meaning transferring over ssl) if not specified. While setting this to false improves performance, it is not recommended due to security concerns.
@y
`secure`: (optional) Whether you would like to transfer data to the bucket over ssl or not. Defaults to true (meaning transferring over ssl) if not specified. While setting this to false improves performance, it is not recommended due to security concerns.
@z

@x
`v4auth`: (optional) Whether you would like to use aws signature version 4 with your requests. This defaults to `false` if not specified. The `eu-central-1` region does not work with version 2 signatures, so the driver errors out if initialized with this region and v4auth set to `false`.
@y
`v4auth`: (optional) Whether you would like to use aws signature version 4 with your requests. This defaults to `false` if not specified. The `eu-central-1` region does not work with version 2 signatures, so the driver errors out if initialized with this region and v4auth set to `false`.
@z

@x
`chunksize`: (optional) The default part size for multipart uploads (performed by WriteStream) to S3. The default is 10 MB. Keep in mind that the minimum part size for S3 is 5MB. Depending on the speed of your connection to S3, a larger chunk size may result in better performance; faster connections benefit from larger chunk sizes.
@y
`chunksize`: (optional) The default part size for multipart uploads (performed by WriteStream) to S3. The default is 10 MB. Keep in mind that the minimum part size for S3 is 5MB. Depending on the speed of your connection to S3, a larger chunk size may result in better performance; faster connections benefit from larger chunk sizes.
@z

@x
`rootdirectory`: (optional) The root directory tree in which all registry files are stored. Defaults to the empty string (bucket root).
@y
`rootdirectory`: (optional) The root directory tree in which all registry files are stored. Defaults to the empty string (bucket root).
@z

@x
`storageclass`: (optional) The storage class applied to each registry file. Defaults to STANDARD. Valid options are STANDARD and REDUCED_REDUNDANCY.
@y
`storageclass`: (optional) The storage class applied to each registry file. Defaults to STANDARD. Valid options are STANDARD and REDUCED_REDUNDANCY.
@z

@x
## S3 permission scopes
@y
## S3 permission scopes
@z

@x
The following AWS policy is required by the registry for push and pull. Make sure to replace `S3_BUCKET_NAME` with the name of your bucket.
@y
The following AWS policy is required by the registry for push and pull. Make sure to replace `S3_BUCKET_NAME` with the name of your bucket.
@z

@x
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket",
        "s3:GetBucketLocation",
        "s3:ListBucketMultipartUploads"
      ],
      "Resource": "arn:aws:s3:::S3_BUCKET_NAME"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject",
        "s3:ListMultipartUploadParts",
        "s3:AbortMultipartUpload"
      ],
      "Resource": "arn:aws:s3:::S3_BUCKET_NAME/*"
    }
  ]
}
```
@y
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket",
        "s3:GetBucketLocation",
        "s3:ListBucketMultipartUploads"
      ],
      "Resource": "arn:aws:s3:::S3_BUCKET_NAME"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject",
        "s3:ListMultipartUploadParts",
        "s3:AbortMultipartUpload"
      ],
      "Resource": "arn:aws:s3:::S3_BUCKET_NAME/*"
    }
  ]
}
```
@z

@x
See [the S3 policy documentation](http://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html) for more details.
@y
See [the S3 policy documentation](http://docs.aws.amazon.com/AmazonS3/latest/dev/mpuAndPermissions.html) for more details.
@z

@x
# CloudFront as Middleware with S3 backend
@y
# CloudFront as Middleware with S3 backend
@z

@x
## Use Case
@y
## Use Case
@z

@x
Adding CloudFront as a middleware for your S3 backed registry can dramatically
improve pull times. Your registry can retrieve your images
from edge servers, rather than the geographically limited location of your S3
bucket. The farther your registry is from your bucket, the more improvements are
possible. See [Amazon CloudFront](https://aws.amazon.com/cloudfront/details/).
@y
Adding CloudFront as a middleware for your S3 backed registry can dramatically
improve pull times. Your registry can retrieve your images
from edge servers, rather than the geographically limited location of your S3
bucket. The farther your registry is from your bucket, the more improvements are
possible. See [Amazon CloudFront](https://aws.amazon.com/cloudfront/details/).
@z

@x
An alternative method for CloudFront that requires less configuration and will use
the same edge servers is [S3 Transfer Acceleration](https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html).
Please check acceleration [Requirements](https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html#transfer-acceleration-requirements)
to see whether you need CloudFront or S3 Transfer Acceleration.
@y
An alternative method for CloudFront that requires less configuration and will use
the same edge servers is [S3 Transfer Acceleration](https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html).
Please check acceleration [Requirements](https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html#transfer-acceleration-requirements)
to see whether you need CloudFront or S3 Transfer Acceleration.
@z

@x
## Configuring CloudFront for Distribution
@y
## Configuring CloudFront for Distribution
@z

@x
If you are unfamiliar with creating a CloudFront distribution, see [Getting
Started with
Cloudfront](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/GettingStarted.html).
@y
If you are unfamiliar with creating a CloudFront distribution, see [Getting
Started with
Cloudfront](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/GettingStarted.html).
@z

@x
Defaults can be kept in most areas except:
@y
Defaults can be kept in most areas except:
@z

@x
### Origin:
@y
### Origin:
@z

@x
  - The CloudFront distribution must be created such that the `Origin Path` is set
    to the directory level of the root "docker" key in S3. If your registry exists
    on the root of the bucket, this path should be left blank.
@y
  - The CloudFront distribution must be created such that the `Origin Path` is set
    to the directory level of the root "docker" key in S3. If your registry exists
    on the root of the bucket, this path should be left blank.
@z

@x
  - For private S3 buckets, you must set `Restrict Bucket Access` to `Yes`. See
    the [CloudFront documentation](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html).
@y
  - For private S3 buckets, you must set `Restrict Bucket Access` to `Yes`. See
    the [CloudFront documentation](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html).
@z

@x
### Behaviors:
@y
### Behaviors:
@z

@x
  - Viewer Protocol Policy: HTTPS Only
  - Allowed HTTP Methods: GET, HEAD, OPTIONS, PUT, POST, PATCH, DELETE
  - Cached HTTP Methods: OPTIONS (checked)
  - Restrict Viewer Access (Use Signed URLs or Signed Cookies): Yes
    - Trusted Signers: Self (Can add other accounts as long as you have access to CloudFront Key Pairs for those additional accounts)
@y
  - Viewer Protocol Policy: HTTPS Only
  - Allowed HTTP Methods: GET, HEAD, OPTIONS, PUT, POST, PATCH, DELETE
  - Cached HTTP Methods: OPTIONS (checked)
  - Restrict Viewer Access (Use Signed URLs or Signed Cookies): Yes
    - Trusted Signers: Self (Can add other accounts as long as you have access to CloudFront Key Pairs for those additional accounts)
@z

@x
## Registry configuration
@y
## Registry configuration
@z

@x
Here the `middleware` option is used. It is still important to keep the
`storage` option, because CloudFront only handles `pull` actions; `push` actions
are still directly written to S3.
@y
Here the `middleware` option is used. It is still important to keep the
`storage` option, because CloudFront only handles `pull` actions; `push` actions
are still directly written to S3.
@z

@x
The following example shows a minimum configuration:
@y
The following example shows a minimum configuration:
@z

@x
```yaml
...
storage:
  s3:
    region: us-east-1
    bucket: docker.myregistry.com
middleware:
  storage:
    - name: cloudfront
      options:
        baseurl: https://abcdefghijklmn.cloudfront.net/
        privatekey: /etc/docker/cloudfront/pk-ABCEDFGHIJKLMNOPQRST.pem
        keypairid: ABCEDFGHIJKLMNOPQRST
...
```
@y
```yaml
...
storage:
  s3:
    region: us-east-1
    bucket: docker.myregistry.com
middleware:
  storage:
    - name: cloudfront
      options:
        baseurl: https://abcdefghijklmn.cloudfront.net/
        privatekey: /etc/docker/cloudfront/pk-ABCEDFGHIJKLMNOPQRST.pem
        keypairid: ABCEDFGHIJKLMNOPQRST
...
```
@z

@x
## CloudFront Key-Pair
@y
## CloudFront Key-Pair
@z

@x
A CloudFront key-pair is required for all AWS accounts needing access to your
CloudFront distribution. You must have access to your AWS account's root credentials to create the required Cloudfront keypair. For information, see [Creating CloudFront Key
Pairs](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-trusted-signers.html#private-content-creating-cloudfront-key-pairs).
@y
A CloudFront key-pair is required for all AWS accounts needing access to your
CloudFront distribution. You must have access to your AWS account's root credentials to create the required Cloudfront keypair. For information, see [Creating CloudFront Key
Pairs](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-trusted-signers.html#private-content-creating-cloudfront-key-pairs).
@z
