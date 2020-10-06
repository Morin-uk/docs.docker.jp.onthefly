%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: describes get by digest pitfall
keywords: registry, manifest, images, tags, repository, distribution, digest
title: Registry compatibility
---
@y
---
description: describes get by digest pitfall
keywords: registry, manifest, images, tags, repository, distribution, digest
title: Registry compatibility
---
@z

@x
{% include registry.md %}
@y
{% include registry.md %}
@z

@x
## Synopsis
If a manifest is pulled by _digest_ from a registry 2.3 with Docker Engine 1.9
and older, and the manifest was pushed with Docker Engine 1.10, a security check
causes the Engine to receive a manifest it cannot use and the pull fails.
@y
## Synopsis
If a manifest is pulled by _digest_ from a registry 2.3 with Docker Engine 1.9
and older, and the manifest was pushed with Docker Engine 1.10, a security check
causes the Engine to receive a manifest it cannot use and the pull fails.
@z

@x
## Registry manifest support
@y
## Registry manifest support
@z

@x
Historically, the registry has supported a [single manifest type](./spec/manifest-v2-1.md)
known as _Schema 1_.
@y
Historically, the registry has supported a [single manifest type](./spec/manifest-v2-1.md)
known as _Schema 1_.
@z

@x
With the move toward multiple architecture images, the distribution project
introduced two new manifest types: Schema 2 manifests and manifest lists. Registry
2.3 supports all three manifest types and sometimes performs an on-the-fly
transformation of a manifest before serving the JSON in the response, to
preserve compatibility with older versions of Docker Engine.
@y
With the move toward multiple architecture images, the distribution project
introduced two new manifest types: Schema 2 manifests and manifest lists. Registry
2.3 supports all three manifest types and sometimes performs an on-the-fly
transformation of a manifest before serving the JSON in the response, to
preserve compatibility with older versions of Docker Engine.
@z

@x
This conversion has some implications for pulling manifests by digest and this
document enumerates these implications.
@y
This conversion has some implications for pulling manifests by digest and this
document enumerates these implications.
@z

@x
## Content Addressable Storage (CAS)
@y
## Content Addressable Storage (CAS)
@z

@x
Manifests are stored and retrieved in the registry by keying off a digest
representing a hash of the contents. One of the advantages provided by CAS is
security: if the contents are changed, then the digest no longer matches.
This prevents any modification of the manifest by a MITM attack or an untrusted
third party.
@y
Manifests are stored and retrieved in the registry by keying off a digest
representing a hash of the contents. One of the advantages provided by CAS is
security: if the contents are changed, then the digest no longer matches.
This prevents any modification of the manifest by a MITM attack or an untrusted
third party.
@z

@x
When a manifest is stored by the registry, this digest is returned in the HTTP
response headers and, if events are configured, delivered within the event. The
manifest can either be retrieved by the tag, or this digest.
@y
When a manifest is stored by the registry, this digest is returned in the HTTP
response headers and, if events are configured, delivered within the event. The
manifest can either be retrieved by the tag, or this digest.
@z

@x
For registry versions 2.2.1 and below, the registry always stores and
serves _Schema 1_ manifests. Engine 1.10 first
attempts to send a _Schema 2_ manifest, falling back to sending a
Schema 1 type manifest when it detects that the registry does not
support the new version.
@y
For registry versions 2.2.1 and below, the registry always stores and
serves _Schema 1_ manifests. Engine 1.10 first
attempts to send a _Schema 2_ manifest, falling back to sending a
Schema 1 type manifest when it detects that the registry does not
support the new version.
@z

@x
## Registry v2.3
@y
## Registry v2.3
@z

@x
### Manifest push with Docker 1.10
@y
### Manifest push with Docker 1.10
@z

@x
The Engine constructs a _Schema 2_ manifest which the
registry persists to disk.
@y
The Engine constructs a _Schema 2_ manifest which the
registry persists to disk.
@z

@x
When the manifest is pulled by digest or tag with Docker Engine 1.10, a
_Schema 2_ manifest is returned. Docker Engine 1.10
understands the new manifest format.
@y
When the manifest is pulled by digest or tag with Docker Engine 1.10, a
_Schema 2_ manifest is returned. Docker Engine 1.10
understands the new manifest format.
@z

@x
When the manifest is pulled by *tag* with Docker Engine 1.9 and older, the
manifest is converted on-the-fly to _Schema 1_ and sent in the
response. The Docker Engine 1.9 is compatible with this older format.
@y
When the manifest is pulled by *tag* with Docker Engine 1.9 and older, the
manifest is converted on-the-fly to _Schema 1_ and sent in the
response. The Docker Engine 1.9 is compatible with this older format.
@z

@x
When the manifest is pulled by _digest_ with Docker Engine 1.9 and older, the
same rewriting process does not happen in the registry. If it did,
the digest would no longer match the hash of the manifest and would violate the
constraints of CAS.
@y
When the manifest is pulled by _digest_ with Docker Engine 1.9 and older, the
same rewriting process does not happen in the registry. If it did,
the digest would no longer match the hash of the manifest and would violate the
constraints of CAS.
@z

@x
For this reason if a manifest is pulled by _digest_ from a registry 2.3 with Docker
Engine 1.9 and older, and the manifest was pushed with Docker Engine 1.10, a
security check causes the Engine to receive a manifest it cannot use and the
pull fails.
@y
For this reason if a manifest is pulled by _digest_ from a registry 2.3 with Docker
Engine 1.9 and older, and the manifest was pushed with Docker Engine 1.10, a
security check causes the Engine to receive a manifest it cannot use and the
pull fails.
@z

@x
### Manifest push with Docker 1.9 and older
@y
### Manifest push with Docker 1.9 and older
@z

@x
The Docker Engine constructs a _Schema 1_ manifest which the
registry persists to disk.
@y
The Docker Engine constructs a _Schema 1_ manifest which the
registry persists to disk.
@z

@x
When the manifest is pulled by digest or tag with any Docker version, a
_Schema 1_ manifest is returned.
@y
When the manifest is pulled by digest or tag with any Docker version, a
_Schema 1_ manifest is returned.
@z
