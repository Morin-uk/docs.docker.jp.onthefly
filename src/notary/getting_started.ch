%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Performing basic operation to use Notary in tandem with Docker Content Trust.
keywords: docker, Notary, notary-client, docker content trust, content trust
title: Get started with Notary
---
@y
---
description: Performing basic operation to use Notary in tandem with Docker Content Trust.
keywords: docker, Notary, notary-client, docker content trust, content trust
title: Notary をはじめよう
---
@z

@x
This document describes basic use of the Notary CLI as a tool supporting Docker
Content Trust. For more advanced use cases, you must
[run your own Notary service](running_a_service.md). Read the
[use the Notary client for advanced users](advanced_usage.md) documentation.
@y
{% comment %}
{% endcomment %}
This document describes basic use of the Notary CLI as a tool supporting Docker
Content Trust. For more advanced use cases, you must
[run your own Notary service](running_a_service.md). Read the
[use the Notary client for advanced users](advanced_usage.md) documentation.
@z

@x
## What is Notary
@y
{% comment %}
## What is Notary
{% endcomment %}
{: #what-is-notary }
## Notary とは何か
@z

@x
Notary is a tool for publishing and managing trusted collections of content.
Publishers can digitally sign collections and consumers can verify integrity
and origin of content. This ability is built on a straightforward key management
and signing interface to create signed collections and configure trusted publishers.
@y
{% comment %}
Notary is a tool for publishing and managing trusted collections of content.
Publishers can digitally sign collections and consumers can verify integrity
and origin of content. This ability is built on a straightforward key management
and signing interface to create signed collections and configure trusted publishers.
{% endcomment %}
Notary is a tool for publishing and managing trusted collections of content.
Publishers can digitally sign collections and consumers can verify integrity
and origin of content. This ability is built on a straightforward key management
and signing interface to create signed collections and configure trusted publishers.
@z

@x
With Notary anyone can provide trust over arbitrary collections of data. Using
[The Update Framework (TUF)](https://www.theupdateframework.com/)
as the underlying security framework, Notary takes care of the operations necessary
to create, manage, and distribute the metadata necessary to ensure the integrity and
freshness of your content.
@y
{% comment %}
With Notary anyone can provide trust over arbitrary collections of data. Using
[The Update Framework (TUF)](https://www.theupdateframework.com/)
as the underlying security framework, Notary takes care of the operations necessary
to create, manage, and distribute the metadata necessary to ensure the integrity and
freshness of your content.
{% endcomment %}
With Notary anyone can provide trust over arbitrary collections of data. Using
[The Update Framework (TUF)](https://www.theupdateframework.com/)
as the underlying security framework, Notary takes care of the operations necessary
to create, manage, and distribute the metadata necessary to ensure the integrity and
freshness of your content.
@z

@x
## Install Notary
@y
{% comment %}
## Install Notary
{% endcomment %}
{: #install-notary }
## Notary のインストール
@z

@x
You can download precompiled notary binary for 64 bit Linux or macOS from the
Notary repository's
[Releases page on Github](https://github.com/docker/notary/releases).
@y
{% comment %}
You can download precompiled notary binary for 64 bit Linux or macOS from the
Notary repository's
[Releases page on Github](https://github.com/docker/notary/releases).
{% endcomment %}
You can download precompiled notary binary for 64 bit Linux or macOS from the
Notary repository's
[Releases page on Github](https://github.com/docker/notary/releases).
@z

@x
## Understand Notary naming
@y
{% comment %}
## Understand Notary naming
{% endcomment %}
{: #understand-notary-naming }
## Understand Notary naming
@z

@x
Notary uses Globally Unique Names (GUNs) to identify trust collections. To
enable Notary to run in a multi-tenant fashion, you must use this format
when interacting with Docker Hub through the Notary client. When specifying
Docker image names for the Notary client, the GUN format is:
@y
{% comment %}
Notary uses Globally Unique Names (GUNs) to identify trust collections. To
enable Notary to run in a multi-tenant fashion, you must use this format
when interacting with Docker Hub through the Notary client. When specifying
Docker image names for the Notary client, the GUN format is:
{% endcomment %}
Notary では Globally Unique Names (GUN) というものを利用して、トラストイメージを識別します。
To
enable Notary to run in a multi-tenant fashion, you must use this format
when interacting with Docker Hub through the Notary client. When specifying
Docker image names for the Notary client, the GUN format is:
@z

@x
- For official images (identifiable by the "Official Image" moniker), the
  image name as displayed on Docker Hub, prefixed with `docker.io/library/`. For
  example, if you would normally type `docker pull ubuntu` you must enter `notary
  {cmd} docker.io/library/ubuntu`.
- For all other images, the image name as displayed on Docker Hub, prefixed by `docker.io`.
@y
{% comment %}
- For official images (identifiable by the "Official Image" moniker), the
  image name as displayed on Docker Hub, prefixed with `docker.io/library/`. For
  example, if you would normally type `docker pull ubuntu` you must enter `notary
  {cmd} docker.io/library/ubuntu`.
- For all other images, the image name as displayed on Docker Hub, prefixed by `docker.io`.
{% endcomment %}
- For official images (identifiable by the "Official Image" moniker), the
  image name as displayed on Docker Hub, prefixed with `docker.io/library/`. For
  example, if you would normally type `docker pull ubuntu` you must enter `notary
  {cmd} docker.io/library/ubuntu`.
- For all other images, the image name as displayed on Docker Hub, prefixed by `docker.io`.
@z

@x
The Docker Engine client takes care of these name expansions for you so do not
change the names you use with the Engine client or API. This is a requirement
only when interacting with the same Docker Hub repositories through the Notary
client.
@y
{% comment %}
{% endcomment %}
The Docker Engine client takes care of these name expansions for you so do not
change the names you use with the Engine client or API. This is a requirement
only when interacting with the same Docker Hub repositories through the Notary
client.
@z

@x
## Inspect a Docker Hub repository
@y
{% comment %}
{% endcomment %}
## Inspect a Docker Hub repository
@z

@x
The most basic operation is listing the available signed tags in a repository.
The Notary client used in isolation does not know where the trust repositories
are located. So, you must provide the `-s` (or long form `--server`) flag to
tell the client which repository server it should communicate with.
@y
{% comment %}
{% endcomment %}
The most basic operation is listing the available signed tags in a repository.
The Notary client used in isolation does not know where the trust repositories
are located. So, you must provide the `-s` (or long form `--server`) flag to
tell the client which repository server it should communicate with.
@z

@x
The official Docker Hub Notary servers are located at
`https://notary.docker.io`. If you would like to use your own Notary server,
it is important to use the same or a newer
[Notary version](https://github.com/docker/notary/releases),
as the client for feature compatibility (ex: client version 0.2, server/signer version >= 0.2).
Additionally, Notary stores your own signing keys,
and a cache of previously downloaded trust metadata in a directory, provided
with the `-d` flag. When interacting with Docker Hub repositories, you must
instruct the client to use the associated trust directory, which by default is
found at `.docker/trust` within the calling user's home directory (failing to
use this directory may result in errors when publishing updates to your trust
data):
@y
{% comment %}
{% endcomment %}
The official Docker Hub Notary servers are located at
`https://notary.docker.io`. If you would like to use your own Notary server,
it is important to use the same or a newer
[Notary version](https://github.com/docker/notary/releases),
as the client for feature compatibility (ex: client version 0.2, server/signer version >= 0.2).
Additionally, Notary stores your own signing keys,
and a cache of previously downloaded trust metadata in a directory, provided
with the `-d` flag. When interacting with Docker Hub repositories, you must
instruct the client to use the associated trust directory, which by default is
found at `.docker/trust` within the calling user's home directory (failing to
use this directory may result in errors when publishing updates to your trust
data):
@z

@x
```bash
$ notary -s https://notary.docker.io -d ~/.docker/trust list docker.io/library/alpine
   NAME                                 DIGEST                                SIZE (BYTES)    ROLE
------------------------------------------------------------------------------------------------------
  2.6      e9cec9aec697d8b9d450edd32860ecd363f2f3174c8338beb5f809422d182c63   1374           targets
  2.7      9f08005dff552038f0ad2f46b8e65ff3d25641747d3912e3ea8da6785046561a   1374           targets
  3.1      e876b57b2444813cd474523b9c74aacacc238230b288a22bccece9caf2862197   1374           targets
  3.2      4a8c62881c6237b4c1434125661cddf09434d37c6ef26bf26bfaef0b8c5e2f05   1374           targets
  3.3      2d4f890b7eddb390285e3afea9be98a078c2acd2fb311da8c9048e3d1e4864d3   1374           targets
  edge     878c1b1d668830f01c2b1622ebf1656e32ce830850775d26a387b2f11f541239   1374           targets
  latest   24a36bbc059b1345b7e8be0df20f1b23caa3602e85d42fff7ecd9d0bd255de56   1377           targets
```
@y
```bash
$ notary -s https://notary.docker.io -d ~/.docker/trust list docker.io/library/alpine
   NAME                                 DIGEST                                SIZE (BYTES)    ROLE
------------------------------------------------------------------------------------------------------
  2.6      e9cec9aec697d8b9d450edd32860ecd363f2f3174c8338beb5f809422d182c63   1374           targets
  2.7      9f08005dff552038f0ad2f46b8e65ff3d25641747d3912e3ea8da6785046561a   1374           targets
  3.1      e876b57b2444813cd474523b9c74aacacc238230b288a22bccece9caf2862197   1374           targets
  3.2      4a8c62881c6237b4c1434125661cddf09434d37c6ef26bf26bfaef0b8c5e2f05   1374           targets
  3.3      2d4f890b7eddb390285e3afea9be98a078c2acd2fb311da8c9048e3d1e4864d3   1374           targets
  edge     878c1b1d668830f01c2b1622ebf1656e32ce830850775d26a387b2f11f541239   1374           targets
  latest   24a36bbc059b1345b7e8be0df20f1b23caa3602e85d42fff7ecd9d0bd255de56   1377           targets
```
@z

@x
The output shows us the names of the tags available, the hex encoded sha256
digest of the image manifest associated with that tag, the size of the manifest,
and the Notary role that signed this tag into the repository. The "targets" role
is the most common role in a simple repository. When a repository has (or
expects) to have collaborators, you may see other "delegated" roles listed as
signers, based on the choice of the administrator as to how they organize their
collaborators.
@y
{% comment %}
{% endcomment %}
The output shows us the names of the tags available, the hex encoded sha256
digest of the image manifest associated with that tag, the size of the manifest,
and the Notary role that signed this tag into the repository. The "targets" role
is the most common role in a simple repository. When a repository has (or
expects) to have collaborators, you may see other "delegated" roles listed as
signers, based on the choice of the administrator as to how they organize their
collaborators.
@z

@x
When you run a `docker pull` command, Docker Engine is using an integrated
Notary library (the same one as Notary CLI) to request the mapping of tag
to sha256 digest for the one tag you are interested in (or if you passed the
`--all` flag, the client uses the list operation to efficiently retrieve all
the mappings). Having validated the signatures on the trust data, the client
instructs the Engine to do a "pull by digest". During this pull, the
Engine uses the sha256 checksum as a content address to request and validate the
image manifest from the Docker registry.
@y
{% comment %}
{% endcomment %}
When you run a `docker pull` command, Docker Engine is using an integrated
Notary library (the same one as Notary CLI) to request the mapping of tag
to sha256 digest for the one tag you are interested in (or if you passed the
`--all` flag, the client uses the list operation to efficiently retrieve all
the mappings). Having validated the signatures on the trust data, the client
instructs the Engine to do a "pull by digest". During this pull, the
Engine uses the sha256 checksum as a content address to request and validate the
image manifest from the Docker registry.
@z

@x
## Delete a tag
@y
{% comment %}
{% endcomment %}
## Delete a tag
@z

@x
Notary generates and stores signing keys on the host it's running on. This means
that the Docker Hub cannot delete tags from the trust data, they must be deleted
using the Notary client. You can do this with the `notary remove` command.
Again, you must direct it to speak to the correct Notary server. Neither
you nor the author has permissions to delete tags from the official `alpine`
repository, so the output below is for demonstration only:
@y
{% comment %}
{% endcomment %}
Notary generates and stores signing keys on the host it's running on. This means
that the Docker Hub cannot delete tags from the trust data, they must be deleted
using the Notary client. You can do this with the `notary remove` command.
Again, you must direct it to speak to the correct Notary server. Neither
you nor the author has permissions to delete tags from the official `alpine`
repository, so the output below is for demonstration only:
@z

@x
```bash
$ notary -s https://notary.docker.io -d ~/.docker/trust remove docker.io/library/alpine 2.6
Removal of 2.6 from docker.io/library/alpine staged for next publish.
```
@y
```bash
$ notary -s https://notary.docker.io -d ~/.docker/trust remove docker.io/library/alpine 2.6
Removal of 2.6 from docker.io/library/alpine staged for next publish.
```
@z

@x
In the preceding example, the output message indicates that only the removal was
staged. When performing any write operations they are staged into a change list.
This list is applied to the latest version of the trust repository the next time
a `notary publish` is run for that repository.
@y
{% comment %}
{% endcomment %}
In the preceding example, the output message indicates that only the removal was
staged. When performing any write operations they are staged into a change list.
This list is applied to the latest version of the trust repository the next time
a `notary publish` is run for that repository.
@z

@x
You can see a pending change by running `notary status` for the modified
repository. The `status` subcommand is an offline operation and as such, does
not require the `-s` flag, however it silently ignores the flag if provided.
Failing to provide the correct value for the `-d` flag may show the wrong
(probably empty) change list:
@y
{% comment %}
{% endcomment %}
You can see a pending change by running `notary status` for the modified
repository. The `status` subcommand is an offline operation and as such, does
not require the `-s` flag, however it silently ignores the flag if provided.
Failing to provide the correct value for the `-d` flag may show the wrong
(probably empty) change list:
@z

@x
```bash
$ notary -d ~/.docker/trust status docker.io/library/alpine
Unpublished changes for docker.io/library/alpine:
@y
```bash
$ notary -d ~/.docker/trust status docker.io/library/alpine
Unpublished changes for docker.io/library/alpine:
@z

@x
action    scope     type        path
----------------------------------------------------
delete    targets   target      2.6
$ notary -s https://notary.docker.io publish docker.io/library/alpine
```
@y
action    scope     type        path
----------------------------------------------------
delete    targets   target      2.6
$ notary -s https://notary.docker.io publish docker.io/library/alpine
```
@z

@x
## Configure the client
@y
{% comment %}
{% endcomment %}
## Configure the client
@z

@x
It is verbose and tedious to always provide the `-s` and `-d` flags
manually to most commands. A simple way to create preconfigured versions of the
Notary command is via aliases. Add the following to your `.bashrc` or
equivalent:
@y
{% comment %}
{% endcomment %}
It is verbose and tedious to always provide the `-s` and `-d` flags
manually to most commands. A simple way to create preconfigured versions of the
Notary command is via aliases. Add the following to your `.bashrc` or
equivalent:
@z

@x
```bash
alias dockernotary="notary -s https://notary.docker.io -d ~/.docker/trust"
```
@y
```bash
alias dockernotary="notary -s https://notary.docker.io -d ~/.docker/trust"
```
@z

@x
More advanced methods of configuration, and additional options, can be found in
the [configuration doc](reference/index.md) and by running `notary --help`.
@y
{% comment %}
{% endcomment %}
More advanced methods of configuration, and additional options, can be found in
the [configuration doc](reference/index.md) and by running `notary --help`.
@z
