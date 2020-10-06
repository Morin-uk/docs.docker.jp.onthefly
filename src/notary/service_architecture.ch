%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How the three requisite notary components interact
keywords: docker, notary, notary-client, docker content trust, content trust, notary-server, notary server, notary-signer, notary signer, notary architecture
title: Understand the Notary service architecture
---
@y
---
description: How the three requisite notary components interact
keywords: docker, notary, notary-client, docker content trust, content trust, notary-server, notary server, notary-signer, notary signer, notary architecture
title: Understand the Notary service architecture
---
@z

@x
On this page, you get an overview of the Notary service architecture.
@y
On this page, you get an overview of the Notary service architecture.
@z

@x
## Brief overview of TUF keys and roles
@y
## Brief overview of TUF keys and roles
@z

@x
This document assumes familiarity with
[The Update Framework](https://www.theupdateframework.com/){:target="_blank" class="_"},
but here is a brief recap of the TUF roles and corresponding key hierarchy:
@y
This document assumes familiarity with
[The Update Framework](https://www.theupdateframework.com/){:target="_blank" class="_"},
but here is a brief recap of the TUF roles and corresponding key hierarchy:
@z

@x
![TUF Key Hierarchy](https://cdn.rawgit.com/docker/notary/09f81717080f53276e6881ece57cbbbf91b8e2a7/docs/images/key-hierarchy.svg){:width="400px"}
@y
![TUF Key Hierarchy](https://cdn.rawgit.com/docker/notary/09f81717080f53276e6881ece57cbbbf91b8e2a7/docs/images/key-hierarchy.svg){:width="400px"}
@z

@x
- The root key is the root of all trust. It signs the
  [root metadata file](https://github.com/theupdateframework/tuf/blob/1bed3e09a478c2c918ffbff10b9118f6e52ee129/docs/tuf-spec.txt#L489){:target="_blank" class="_"},
  which lists the IDs of the root, targets, snapshot, and timestamp public keys.
  Clients use these public keys to verify the signatures on all the metadata files
  in the repository. This key is held by a collection owner, and should be kept offline
  and safe, more so than any other key.
@y
- The root key is the root of all trust. It signs the
  [root metadata file](https://github.com/theupdateframework/tuf/blob/1bed3e09a478c2c918ffbff10b9118f6e52ee129/docs/tuf-spec.txt#L489){:target="_blank" class="_"},
  which lists the IDs of the root, targets, snapshot, and timestamp public keys.
  Clients use these public keys to verify the signatures on all the metadata files
  in the repository. This key is held by a collection owner, and should be kept offline
  and safe, more so than any other key.
@z

@x
- The snapshot key signs the
  [snapshot metadata file](https://github.com/theupdateframework/tuf/blob/1bed3e09a478c2c918ffbff10b9118f6e52ee129/docs/tuf-spec.txt#L604){:target="_blank" class="_"},
  which enumerates the filenames, sizes, and hashes of the root,
  targets, and delegation metadata files for the collection. This file is used to
  verify the integrity of the other metadata files. The snapshot key is held by
  either a collection owner/administrator, or held by the Notary service to facilitate
  [signing by multiple collaborators via delegation roles](advanced_usage.md#working-with-delegation-roles).
@y
- The snapshot key signs the
  [snapshot metadata file](https://github.com/theupdateframework/tuf/blob/1bed3e09a478c2c918ffbff10b9118f6e52ee129/docs/tuf-spec.txt#L604){:target="_blank" class="_"},
  which enumerates the filenames, sizes, and hashes of the root,
  targets, and delegation metadata files for the collection. This file is used to
  verify the integrity of the other metadata files. The snapshot key is held by
  either a collection owner/administrator, or held by the Notary service to facilitate
  [signing by multiple collaborators via delegation roles](advanced_usage.md#working-with-delegation-roles).
@z

@x
- The timestamp key signs the
  [timestamp metadata file](https://github.com/theupdateframework/tuf/blob/1bed3e09a478c2c918ffbff10b9118f6e52ee129/docs/tuf-spec.txt#L827){:target="_blank" class="_"},
  which provides freshness guarantees for the collection by having the shortest expiry time of any particular
  piece of metadata and by specifying the filename, size, and hash of the most recent
  snapshot for the collection. It is used to verify the integrity of the snapshot
  file. The timestamp key is held by the Notary service so the timestamp can be
  automatically re-generated when it is requested from the server, rather than
  require that a collection owner come online before each timestamp expiry.
@y
- The timestamp key signs the
  [timestamp metadata file](https://github.com/theupdateframework/tuf/blob/1bed3e09a478c2c918ffbff10b9118f6e52ee129/docs/tuf-spec.txt#L827){:target="_blank" class="_"},
  which provides freshness guarantees for the collection by having the shortest expiry time of any particular
  piece of metadata and by specifying the filename, size, and hash of the most recent
  snapshot for the collection. It is used to verify the integrity of the snapshot
  file. The timestamp key is held by the Notary service so the timestamp can be
  automatically re-generated when it is requested from the server, rather than
  require that a collection owner come online before each timestamp expiry.
@z

@x
- The targets key signs the
  [targets metadata file](ttps://github.com/theupdateframework/tuf/blob/1bed3e09a478c2c918ffbff10b9118f6e52ee129/docs/tuf-spec.txt#L678){:target="_blank" class="_"},
  which lists filenames in the collection, and their sizes and respective
  [hashes](https://en.wikipedia.org/wiki/Cryptographic_hash_function){:target="_blank" class="_"}.
  This file is used to verify the integrity of some or all of the actual contents of the repository.
  It is also used to
  [delegate trust to other collaborators via delegation roles](advanced_usage.md#working-with-delegation-roles).
  The targets key is held by the collection owner or administrator.
@y
- The targets key signs the
  [targets metadata file](ttps://github.com/theupdateframework/tuf/blob/1bed3e09a478c2c918ffbff10b9118f6e52ee129/docs/tuf-spec.txt#L678){:target="_blank" class="_"},
  which lists filenames in the collection, and their sizes and respective
  [hashes](https://en.wikipedia.org/wiki/Cryptographic_hash_function){:target="_blank" class="_"}.
  This file is used to verify the integrity of some or all of the actual contents of the repository.
  It is also used to
  [delegate trust to other collaborators via delegation roles](advanced_usage.md#working-with-delegation-roles).
  The targets key is held by the collection owner or administrator.
@z

@x
- Delegation keys sign
  [delegation metadata files](https://github.com/theupdateframework/tuf/blob/1bed3e09a478c2c918ffbff10b9118f6e52ee129/docs/tuf-spec.txt#L678){:target="_blank" class="_"},
  which lists filenames in the collection, and their sizes and respective
  [hashes](https://en.wikipedia.org/wiki/Cryptographic_hash_function){:target="_blank" class="_"}.
  These files are used to verify the integrity of some or all of the actual contents of the repository.
  They are also used to
  [delegate trust to other collaborators via lower level [delegation roles](advanced_usage.md#work-with-delegation-roles).
  Delegation keys are held by anyone from the collection owner or administrator to
  collection collaborators.
@y
- Delegation keys sign
  [delegation metadata files](https://github.com/theupdateframework/tuf/blob/1bed3e09a478c2c918ffbff10b9118f6e52ee129/docs/tuf-spec.txt#L678){:target="_blank" class="_"},
  which lists filenames in the collection, and their sizes and respective
  [hashes](https://en.wikipedia.org/wiki/Cryptographic_hash_function){:target="_blank" class="_"}.
  These files are used to verify the integrity of some or all of the actual contents of the repository.
  They are also used to
  [delegate trust to other collaborators via lower level [delegation roles](advanced_usage.md#work-with-delegation-roles).
  Delegation keys are held by anyone from the collection owner or administrator to
  collection collaborators.
@z

@x
## Architecture and components
@y
## Architecture and components
@z

@x
Notary clients pull metadata from one or more (remote) Notary services. Some
Notary clients push metadata to one or more Notary services.
@y
Notary clients pull metadata from one or more (remote) Notary services. Some
Notary clients push metadata to one or more Notary services.
@z

@x
A Notary service consists of a Notary server, which stores and updates the
signed
[TUF metadata files](https://github.com/theupdateframework/tuf/blob/1bed3e09a478c2c918ffbff10b9118f6e52ee129/docs/tuf-spec.txt#L348){:target="_blank" class="_"}
for multiple trusted collections in an associated database, and a Notary signer, which
stores private keys for and signs metadata for the Notary server. The following
diagram illustrates this architecture:
@y
A Notary service consists of a Notary server, which stores and updates the
signed
[TUF metadata files](https://github.com/theupdateframework/tuf/blob/1bed3e09a478c2c918ffbff10b9118f6e52ee129/docs/tuf-spec.txt#L348){:target="_blank" class="_"}
for multiple trusted collections in an associated database, and a Notary signer, which
stores private keys for and signs metadata for the Notary server. The following
diagram illustrates this architecture:
@z

@x
![Notary Service Architecture Diagram](/notary/images/service-architecture.svg)
@y
![Notary Service Architecture Diagram](/notary/images/service-architecture.svg)
@z

@x
Root, targets, and (sometimes) snapshot metadata are generated and signed by
clients, who upload the metadata to the Notary server. The server is
responsible for:
@y
Root, targets, and (sometimes) snapshot metadata are generated and signed by
clients, who upload the metadata to the Notary server. The server is
responsible for:
@z

@x
- ensuring that any uploaded metadata is valid, signed, and self-consistent
- generating the timestamp (and sometimes snapshot) metadata
- storing and serving to clients the latest valid metadata for any trusted collection
@y
- ensuring that any uploaded metadata is valid, signed, and self-consistent
- generating the timestamp (and sometimes snapshot) metadata
- storing and serving to clients the latest valid metadata for any trusted collection
@z

@x
The Notary signer is responsible for:
@y
The Notary signer is responsible for:
@z

@x
- storing the private signing keys
  [wrapped](https://tools.ietf.org/html/draft-ietf-jose-json-web-algorithms-31#section-4.4){:target="_blank" class="_"}
  and
  [encrypted](https://tools.ietf.org/html/draft-ietf-jose-json-web-algorithms-31#section-4.8){:target="_blank" class="_"}
  using [Javascript Object Signing and Encryption](https://github.com/dvsekhvalnov/jose2go){:target="_blank" class="_"}
  in a database separate from the Notary server database
- performing signing operations with these keys whenever the Notary server requests
@y
- storing the private signing keys
  [wrapped](https://tools.ietf.org/html/draft-ietf-jose-json-web-algorithms-31#section-4.4){:target="_blank" class="_"}
  and
  [encrypted](https://tools.ietf.org/html/draft-ietf-jose-json-web-algorithms-31#section-4.8){:target="_blank" class="_"}
  using [Javascript Object Signing and Encryption](https://github.com/dvsekhvalnov/jose2go){:target="_blank" class="_"}
  in a database separate from the Notary server database
- performing signing operations with these keys whenever the Notary server requests
@z

@x
## Example client-server-signer interaction
@y
## Example client-server-signer interaction
@z

@x
The following diagram illustrates the interactions between the Notary client,
server, and signer:
@y
The following diagram illustrates the interactions between the Notary client,
server, and signer:
@z

@x
![Notary Service Sequence Diagram](https://cdn.rawgit.com/docker/notary/27469f01fe244bdf70f34219616657b336724bc3/docs/images/metadata-sequence.svg)
@y
![Notary Service Sequence Diagram](https://cdn.rawgit.com/docker/notary/27469f01fe244bdf70f34219616657b336724bc3/docs/images/metadata-sequence.svg)
@z

@x
1.  Notary server optionally supports authentication from clients using
    [JWT](http://jwt.io/){:target="_blank" class="_"} tokens. This requires an
    authorization server that manages access controls, and a cert bundle from this
    authorization server containing the public key it uses to sign tokens.
@y
1.  Notary server optionally supports authentication from clients using
    [JWT](http://jwt.io/){:target="_blank" class="_"} tokens. This requires an
    authorization server that manages access controls, and a cert bundle from this
    authorization server containing the public key it uses to sign tokens.
@z

@x
    If token authentication is enabled on Notary server, then any connecting
    client that does not have a token is redirected to the authorization
    server.
@y
    If token authentication is enabled on Notary server, then any connecting
    client that does not have a token is redirected to the authorization
    server.
@z

@x
    See the docs for
    [Docker Registry v2 authentication]( https://github.com/docker/distribution/blob/master/docs/spec/auth/token.md)
    for more information.
@y
    See the docs for
    [Docker Registry v2 authentication]( https://github.com/docker/distribution/blob/master/docs/spec/auth/token.md)
    for more information.
@z

@x
2.  The client logs in to the authorization server via basic auth over HTTPS,
    obtain a bearer token, and then present the token to Notary server on future
    requests.
@y
2.  The client logs in to the authorization server via basic auth over HTTPS,
    obtain a bearer token, and then present the token to Notary server on future
    requests.
@z

@x
3.  When clients uploads new metadata files, Notary server checks them against
    any previous versions for conflicts, and verifies the signatures, checksums,
    and validity of the uploaded metadata.
@y
3.  When clients uploads new metadata files, Notary server checks them against
    any previous versions for conflicts, and verifies the signatures, checksums,
    and validity of the uploaded metadata.
@z

@x
4.  Once all the uploaded metadata has been validated, Notary server
    generates the timestamp (and maybe snapshot) metadata. It sends this
    generated metadata to the Notary signer to be signed.
@y
4.  Once all the uploaded metadata has been validated, Notary server
    generates the timestamp (and maybe snapshot) metadata. It sends this
    generated metadata to the Notary signer to be signed.
@z

@x
5.  Notary signer retrieves the necessary encrypted private keys from its database
    if available, decrypts the keys, and uses them to sign the metadata. If
    successful, it sends the signatures back to Notary server.
@y
5.  Notary signer retrieves the necessary encrypted private keys from its database
    if available, decrypts the keys, and uses them to sign the metadata. If
    successful, it sends the signatures back to Notary server.
@z

@x
6.  Notary server is the source of truth for the state of a trusted collection of
    data, storing both client-uploaded and server-generated metadata in the TUF
    database. The generated timestamp and snapshot metadata certify that the
    metadata files the client uploaded are the most recent for that trusted collection.
@y
6.  Notary server is the source of truth for the state of a trusted collection of
    data, storing both client-uploaded and server-generated metadata in the TUF
    database. The generated timestamp and snapshot metadata certify that the
    metadata files the client uploaded are the most recent for that trusted collection.
@z

@x
    Finally, Notary server notifies the client that their upload was successful.
@y
    Finally, Notary server notifies the client that their upload was successful.
@z

@x
7.  The client can now immediately download the latest metadata from the server,
    using the still-valid bearer token to connect. Notary server only needs to
    obtain the metadata from the database, since none of the metadata has expired.
@y
7.  The client can now immediately download the latest metadata from the server,
    using the still-valid bearer token to connect. Notary server only needs to
    obtain the metadata from the database, since none of the metadata has expired.
@z

@x
    In the case that the timestamp has expired, Notary server would go through
    the entire sequence where it generates a new timestamp, request Notary signer
    for a signature, stores the newly signed timestamp in the database. It then
    sends this new timestamp, along with the rest of the stored metadata, to the
    requesting client.
@y
    In the case that the timestamp has expired, Notary server would go through
    the entire sequence where it generates a new timestamp, request Notary signer
    for a signature, stores the newly signed timestamp in the database. It then
    sends this new timestamp, along with the rest of the stored metadata, to the
    requesting client.
@z

@x
## Threat model
@y
## Threat model
@z

@x
Both the server and the signer are potential attack vectors against all users
of the Notary service. Client keys are also a potential attack vector, but
not necessarily against all collections at a time. This section
discusses how our architecture is designed to deal with compromises.
@y
Both the server and the signer are potential attack vectors against all users
of the Notary service. Client keys are also a potential attack vector, but
not necessarily against all collections at a time. This section
discusses how our architecture is designed to deal with compromises.
@z

@x
### Notary server compromise
@y
### Notary server compromise
@z

@x
In the event of a Notary server compromise, an attacker would have direct access to
the metadata stored in the database as well as access to the credentials
used to communicate with Notary signer, and therefore, access to arbitrary signing
operations with any key the Signer holds.
@y
In the event of a Notary server compromise, an attacker would have direct access to
the metadata stored in the database as well as access to the credentials
used to communicate with Notary signer, and therefore, access to arbitrary signing
operations with any key the Signer holds.
@z

@x
- **Denial of Service** - An attacker could reject client requests and corrupt
  or delete metadata from the database, thus preventing clients from the ability
  to download or upload metadata.
@y
- **Denial of Service** - An attacker could reject client requests and corrupt
  or delete metadata from the database, thus preventing clients from the ability
  to download or upload metadata.
@z

@x
- **Malicious Content** - An attacker can create, store, and serve arbitrary
  metadata content for one or more trusted collections. However, the attacker
  has no access to any client-side keys, such as root, targets, and potentially
  the snapshot keys for the existing trusted collections.
@y
- **Malicious Content** - An attacker can create, store, and serve arbitrary
  metadata content for one or more trusted collections. However, the attacker
  has no access to any client-side keys, such as root, targets, and potentially
  the snapshot keys for the existing trusted collections.
@z

@x
  A client can only be tricked into downloading and trusting the malicious
  content for these trusted collections if it has never seen the trusted
  collections and does not have any form of pinned trust.
@y
  A client can only be tricked into downloading and trusting the malicious
  content for these trusted collections if it has never seen the trusted
  collections and does not have any form of pinned trust.
@z

@x
  If a client has previously interacted with any trusted collection or has its
  trust pinned to a specific certificate for the collections, the client
  immediately detects that the content is malicious and doesn't trust any root,
  targets, or (maybe) snapshot metadata for these collections.
@y
  If a client has previously interacted with any trusted collection or has its
  trust pinned to a specific certificate for the collections, the client
  immediately detects that the content is malicious and doesn't trust any root,
  targets, or (maybe) snapshot metadata for these collections.
@z

@x
- **Rollback, Freeze, Mix and Match** - The attacker can request that
  the Notary signer sign any arbitrary timestamp (and maybe snapshot) metadata
  they want. Attackers can launch a freeze attack, and, depending on whether
  the snapshot key is available, a mix-and-match attack up to the expiration
  of the targets file.
@y
- **Rollback, Freeze, Mix and Match** - The attacker can request that
  the Notary signer sign any arbitrary timestamp (and maybe snapshot) metadata
  they want. Attackers can launch a freeze attack, and, depending on whether
  the snapshot key is available, a mix-and-match attack up to the expiration
  of the targets file.
@z

@x
  Clients both with and without pinned trust would be vulnerable to these
  attacks, so long as the attacker ensures that the version number of their
  malicious metadata is higher than the version number of the most recent
  good metadata that any client may have.
@y
  Clients both with and without pinned trust would be vulnerable to these
  attacks, so long as the attacker ensures that the version number of their
  malicious metadata is higher than the version number of the most recent
  good metadata that any client may have.
@z

@x
> **Note**: the timestamp and snapshot keys cannot be compromised in a server-only
> compromise, so a key rotation would not be necessary. Once the Server
> compromise is mitigated, an attacker cannot generate valid timestamp or
> snapshot metadata and serve them on a malicious mirror, for example.
@y
> **Note**: the timestamp and snapshot keys cannot be compromised in a server-only
> compromise, so a key rotation would not be necessary. Once the Server
> compromise is mitigated, an attacker cannot generate valid timestamp or
> snapshot metadata and serve them on a malicious mirror, for example.
@z

@x
### Notary signer compromise
@y
### Notary signer compromise
@z

@x
In the event of a Notary signer compromise, an attacker would have access to
all the (timestamp and snapshot) private keys stored in a database.
If the keys are stored in an HSM, they would have the ability to sign arbitrary
content with, and to delete, the keys in the HSM, but not to exfiltrate the
private material.
@y
In the event of a Notary signer compromise, an attacker would have access to
all the (timestamp and snapshot) private keys stored in a database.
If the keys are stored in an HSM, they would have the ability to sign arbitrary
content with, and to delete, the keys in the HSM, but not to exfiltrate the
private material.
@z

@x
- **Denial of Service** - An attacker could reject all Notary server requests
  and corrupt or delete keys from the database (or even delete keys from an
  HSM), and thus prevent Notary servers from signing generated
  timestamps or snapshots.
@y
- **Denial of Service** - An attacker could reject all Notary server requests
  and corrupt or delete keys from the database (or even delete keys from an
  HSM), and thus prevent Notary servers from signing generated
  timestamps or snapshots.
@z

@x
- **Key Compromise** - If the Notary signer uses a database as its backend,
  an attacker can exfiltrate all the (timestamp and snapshot) private material.
  The capabilities of an attacker are the same as of a Notary server
  compromise in terms of signing arbitrary metadata, with the important detail
  that in this particular case key rotations are necessary to recover from
  the attack.
@y
- **Key Compromise** - If the Notary signer uses a database as its backend,
  an attacker can exfiltrate all the (timestamp and snapshot) private material.
  The capabilities of an attacker are the same as of a Notary server
  compromise in terms of signing arbitrary metadata, with the important detail
  that in this particular case key rotations are necessary to recover from
  the attack.
@z

@x
### Notary client keys and credentials compromise
@y
### Notary client keys and credentials compromise
@z

@x
The security of keys held and administered by users depends on measures taken by
the users. If the Notary Client CLI was used to create them, then they are password
protected and the Notary CLI does not provide options to export them in
plaintext.
@y
The security of keys held and administered by users depends on measures taken by
the users. If the Notary Client CLI was used to create them, then they are password
protected and the Notary CLI does not provide options to export them in
plaintext.
@z

@x
It is up to the user to choose an appropriate password, and to protect their key
from offline brute-force attacks.
@y
It is up to the user to choose an appropriate password, and to protect their key
from offline brute-force attacks.
@z

@x
The severity of the compromise of a trust collection owner/administrator's
decrypted key depends on the type and combination of keys compromised. For
example, were the snapshot and targets key both compromised, or just the targets
key?
@y
The severity of the compromise of a trust collection owner/administrator's
decrypted key depends on the type and combination of keys compromised. For
example, were the snapshot and targets key both compromised, or just the targets
key?
@z

@x
#### Possible attacks given the credentials compromised:
@y
#### Possible attacks given the credentials compromised:
@z

@x
##### Decrypted Delegation Key, only
@y
##### Decrypted Delegation Key, only
@z

@x
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| Delegation key   | no                | no                              | no                |
@y
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| Delegation key   | no                | no                              | no                |
@z

@x
##### Decrypted Delegation Key + Notary Service write-capable credentials
@y
##### Decrypted Delegation Key + Notary Service write-capable credentials
@z

@x
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| Delegation key   | limited, maybe*   | limited, maybe*                 | limited, maybe*   |
@y
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| Delegation key   | limited, maybe*   | limited, maybe*                 | limited, maybe*   |
@z

@x
If the Notary Service holds the snapshot key and the attacker has Notary Service
write credentials, then they have effective access to the snapshot and timestamp
keys because the server generates and signs the snapshot and timestamp for them.
@y
If the Notary Service holds the snapshot key and the attacker has Notary Service
write credentials, then they have effective access to the snapshot and timestamp
keys because the server generates and signs the snapshot and timestamp for them.
@z

@x
An attacker can add malicious content, remove legitimate content from a collection, and
mix up the targets in a collection, but only within the particular delegation
roles that the key can sign for. Depending on the restrictions on that role,
they may be restricted in what type of content they can modify. They may also
add or remove the capabilities of other delegation keys below it on the key hierarchy
For example, if `DelegationKey2` in the above key hierarchy is compromised, the
compromised key could
only modify the capabilities of `DelegationKey4` and `DelegationKey5`.
@y
An attacker can add malicious content, remove legitimate content from a collection, and
mix up the targets in a collection, but only within the particular delegation
roles that the key can sign for. Depending on the restrictions on that role,
they may be restricted in what type of content they can modify. They may also
add or remove the capabilities of other delegation keys below it on the key hierarchy
For example, if `DelegationKey2` in the above key hierarchy is compromised, the
compromised key could
only modify the capabilities of `DelegationKey4` and `DelegationKey5`.
@z

@x
##### Decrypted Delegation Key + Decrypted Snapshot Key, only
@y
##### Decrypted Delegation Key + Decrypted Snapshot Key, only
@z

@x
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| Delegation key,  Snapshot key  | no    | no                        | no                |
@y
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| Delegation key,  Snapshot key  | no    | no                        | no                |
@z

@x
The attacker does not have access to the timestamp key, which is always held by the Notary
Service, and cannot set up a malicious mirror.
@y
The attacker does not have access to the timestamp key, which is always held by the Notary
Service, and cannot set up a malicious mirror.
@z

@x
##### Decrypted Delegation Key + Decrypted Snapshot Key + Notary Service write-capable credentials
@y
##### Decrypted Delegation Key + Decrypted Snapshot Key + Notary Service write-capable credentials
@z

@x
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| Delegation key,  Snapshot key  | limited   | limited               | limited           |
@y
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| Delegation key,  Snapshot key  | limited   | limited               | limited           |
@z

@x
The Notary Service always holds the timestamp key. If the attacker has Notary Service
write credentials, then they have effective access to the timestamp key because the server
generates and signs the timestamp for them.
@y
The Notary Service always holds the timestamp key. If the attacker has Notary Service
write credentials, then they have effective access to the timestamp key because the server
generates and signs the timestamp for them.
@z

@x
An attacker can add malicious content, remove legitimate content from a collection, and
mix up the targets in a collection, but only within the particular delegation
roles that the key can sign for. Depending on the restrictions on that role,
they may be restricted in what type of content they can modify. A key may also
add or remove the capabilities of other delegation keys below it on the key hierarchy
For example, if `DelegationKey2` in the above key hierarchy is compromised, it can
only modify the capabilities of `DelegationKey4` and `DelegationKey5`.
@y
An attacker can add malicious content, remove legitimate content from a collection, and
mix up the targets in a collection, but only within the particular delegation
roles that the key can sign for. Depending on the restrictions on that role,
they may be restricted in what type of content they can modify. A key may also
add or remove the capabilities of other delegation keys below it on the key hierarchy
For example, if `DelegationKey2` in the above key hierarchy is compromised, it can
only modify the capabilities of `DelegationKey4` and `DelegationKey5`.
@z

@x
##### Decrypted Targets Key, only
@y
##### Decrypted Targets Key, only
@z

@x
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| Targets key      | no                | no                              | no                |
@y
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| Targets key      | no                | no                              | no                |
@z

@x
##### Decrypted Targets Key + Notary Service write-capable credentials
@y
##### Decrypted Targets Key + Notary Service write-capable credentials
@z

@x
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| Targets key      | maybe*            | maybe*                          | limited, maybe*   |
@y
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| Targets key      | maybe*            | maybe*                          | limited, maybe*   |
@z

@x
If the Notary Service holds the snapshot key and the attacker has Notary Service
write credentials, then they have effective access to the snapshot and timestamp
keys because the server generates and signs the snapshot and timestamp for them.
@y
If the Notary Service holds the snapshot key and the attacker has Notary Service
write credentials, then they have effective access to the snapshot and timestamp
keys because the server generates and signs the snapshot and timestamp for them.
@z

@x
An attacker can add any malicious content, remove any legitimate content from a
collection, and mix up the targets in a collection. They may also add or remove
the capabilities of any top level delegation key or role, such as `Delegation1`,
`Delegation2`, and `Delegation3` in the key hierarchy diagram. If they remove
the roles entirely, they break the trust chain to the lower delegation roles,
such as `Delegation4` or `Delegation5`.
@y
An attacker can add any malicious content, remove any legitimate content from a
collection, and mix up the targets in a collection. They may also add or remove
the capabilities of any top level delegation key or role, such as `Delegation1`,
`Delegation2`, and `Delegation3` in the key hierarchy diagram. If they remove
the roles entirely, they break the trust chain to the lower delegation roles,
such as `Delegation4` or `Delegation5`.
@z

@x
##### Decrypted Targets Key + Decrypted Snapshot Key, only
@y
##### Decrypted Targets Key + Decrypted Snapshot Key, only
@z

@x
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| Targets key,  Snapshot key     | no    | no                        | no                |
@y
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| Targets key,  Snapshot key     | no    | no                        | no                |
@z

@x
The attacker does not have access to the timestamp key, which is always held by the Notary
Service, and cannot set up a malicious mirror.
@y
The attacker does not have access to the timestamp key, which is always held by the Notary
Service, and cannot set up a malicious mirror.
@z

@x
##### Decrypted Targets Key + Decrypted Snapshot Key + Notary Service write-capable credentials
@y
##### Decrypted Targets Key + Decrypted Snapshot Key + Notary Service write-capable credentials
@z

@x
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| Targets key,  Snapshot key       | yes   | yes                     | limited           |
@y
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| Targets key,  Snapshot key       | yes   | yes                     | limited           |
@z

@x
The Notary Service always holds the timestamp key. If the attacker has Notary Service
write credentials, then they have effective access to the timestamp key because the server
generates and signs the timestamp for them.
@y
The Notary Service always holds the timestamp key. If the attacker has Notary Service
write credentials, then they have effective access to the timestamp key because the server
generates and signs the timestamp for them.
@z

@x
An attacker can add any malicious content, remove any legitimate content from a
collection, and mix up the targets in a collection. They may also add or remove
the capabilities of any top level delegation key or role, for example, `Delegation1`,
`Delegation2`, and `Delegation3` in the key hierarchy diagram. If they remove
the roles entirely, they'd break the trust chain to the lower delegation roles,
such as `Delegation4` or `Delegation5`.
@y
An attacker can add any malicious content, remove any legitimate content from a
collection, and mix up the targets in a collection. They may also add or remove
the capabilities of any top level delegation key or role, for example, `Delegation1`,
`Delegation2`, and `Delegation3` in the key hierarchy diagram. If they remove
the roles entirely, they'd break the trust chain to the lower delegation roles,
such as `Delegation4` or `Delegation5`.
@z

@x
##### Decrypted Root Key + none or any combination of decrypted keys, only
@y
##### Decrypted Root Key + none or any combination of decrypted keys, only
@z

@x
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| All keys         | yes               | yes                             | yes               |
@y
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| All keys         | yes               | yes                             | yes               |
@z

@x
No other keys are needed, since the attacker can just any rotate or all of them to ones that they
generate. With these keys, they can set up a mirror to serve malicious data - any malicious data
at all, given that they have access to all the keys.
@y
No other keys are needed, since the attacker can just any rotate or all of them to ones that they
generate. With these keys, they can set up a mirror to serve malicious data - any malicious data
at all, given that they have access to all the keys.
@z

@x
##### Decrypted Root Key + none or any combination of decrypted keys + Notary Service write-capable credentials
@y
##### Decrypted Root Key + none or any combination of decrypted keys + Notary Service write-capable credentials
@z

@x
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| All keys         | yes               | yes                             | yes               |
@y
| Keys compromised | Malicious Content | Rollback, Freeze, Mix and Match | Denial of Service |
|------------------|-------------------|---------------------------------|-------------------|
| All keys         | yes               | yes                             | yes               |
@z

@x
If the Notary Service holds the snapshot key and the attacker has Notary Service
write credentials, then they don't even need to rotate the snapshot and timestamp
keys because the server generates and signs the snapshot and timestamp for them.
@y
If the Notary Service holds the snapshot key and the attacker has Notary Service
write credentials, then they don't even need to rotate the snapshot and timestamp
keys because the server generates and signs the snapshot and timestamp for them.
@z

@x
#### Mitigations
@y
#### Mitigations
@z

@x
If a root key compromise is detected, the root key holder should contact
whomever runs the notary service to manually reverse any malicious changes to
the repository, and immediately rotate the root key. This creates a fork
of the repository history, and thus break existing clients who have downloaded
any of the malicious changes.
@y
If a root key compromise is detected, the root key holder should contact
whomever runs the notary service to manually reverse any malicious changes to
the repository, and immediately rotate the root key. This creates a fork
of the repository history, and thus break existing clients who have downloaded
any of the malicious changes.
@z

@x
If a targets key compromise is detected, the root key holder
must rotate the compromised key and push a clean set of targets using the new key.
@y
If a targets key compromise is detected, the root key holder
must rotate the compromised key and push a clean set of targets using the new key.
@z

@x
If a delegations key compromise is detected, a higher level key
holder must rotate the compromised key, and push a clean set of targets using the new key.
@y
If a delegations key compromise is detected, a higher level key
holder must rotate the compromised key, and push a clean set of targets using the new key.
@z

@x
If a Notary Service credential compromise is detected, the credentials should be
changed immediately.
@y
If a Notary Service credential compromise is detected, the credentials should be
changed immediately.
@z

@x
## Related information
@y
## Related information
@z

@x
* [Run a Notary service](running_a_service.md)
* [Notary configuration files](reference/index.md)
@y
* [Run a Notary service](running_a_service.md)
* [Notary configuration files](reference/index.md)
@z
