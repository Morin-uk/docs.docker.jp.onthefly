%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Update deprecated schema image manifest version 2, v1 images
description: Update deprecated schema v1 iamges
keywords: registry, on-prem, images, tags, repository, distribution, api, advanced, manifest
---
@y
---
title: Update deprecated schema image manifest version 2, v1 images
description: Update deprecated schema v1 iamges
keywords: registry, on-prem, images, tags, repository, distribution, api, advanced, manifest
---
@z

@x
## Image manifest version 2, schema 1
With the release of image manifest version 2, schema 2, image manifest version
2, schema 1 has been deprecated. This could lead to compatibility and
vulnerability issues in images that haven't been updated to image manifest
version 2, schema 2.
@y
## Image manifest version 2, schema 1
With the release of image manifest version 2, schema 2, image manifest version
2, schema 1 has been deprecated. This could lead to compatibility and
vulnerability issues in images that haven't been updated to image manifest
version 2, schema 2.
@z

@x
This page contains information on how to update from image manifest version 2,
schema 1. However, these instructions will not ensure your new image will run
successfully. There may be several other issues to troubleshoot that are
associated with  the deprecated image manifest that will block your image from
running succesfully. A list of possible methods to help update your image is
also included below.
@y
This page contains information on how to update from image manifest version 2,
schema 1. However, these instructions will not ensure your new image will run
successfully. There may be several other issues to troubleshoot that are
associated with  the deprecated image manifest that will block your image from
running succesfully. A list of possible methods to help update your image is
also included below.
@z

@x
### Update to image manifest version 2, schema 2
@y
### Update to image manifest version 2, schema 2
@z

@x
One way to upgrade an image from image manifest version 2, schema 1 to
schema 2 is to `docker pull` the image and then `docker push` the image with a
current version of Docker. Doing so will automatically convert the image to use
the latest image manifest specification.
@y
One way to upgrade an image from image manifest version 2, schema 1 to
schema 2 is to `docker pull` the image and then `docker push` the image with a
current version of Docker. Doing so will automatically convert the image to use
the latest image manifest specification.
@z

@x
Converting an image to image manifest version 2, schema 2 converts the
manifest format, but does not update the contents within the image. Images
using manifest version 2, schema 1 may contain unpatched vulnerabilities. We
recommend looking for an alternative image or rebuilding it.
@y
Converting an image to image manifest version 2, schema 2 converts the
manifest format, but does not update the contents within the image. Images
using manifest version 2, schema 1 may contain unpatched vulnerabilities. We
recommend looking for an alternative image or rebuilding it.
@z

@x
### Update FROM statement
@y
### Update FROM statement
@z

@x
You can rebuild the image by updating the `FROM` statement in your
`Dockerfile`. If your image manifest is out-of-date, there is a chance the
image pulled from your `FROM` statement in your `Dockerfile` is also
out-of-date. See the [Dockerfile reference](https://docs.docker.com/engine/reference/builder/#from)
and the [Dockerfile best practices guide](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
for more information on how to update the `FROM` statement in your
`Dockerfile`.
@y
You can rebuild the image by updating the `FROM` statement in your
`Dockerfile`. If your image manifest is out-of-date, there is a chance the
image pulled from your `FROM` statement in your `Dockerfile` is also
out-of-date. See the [Dockerfile reference](https://docs.docker.com/engine/reference/builder/#from)
and the [Dockerfile best practices guide](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
for more information on how to update the `FROM` statement in your
`Dockerfile`.
@z
