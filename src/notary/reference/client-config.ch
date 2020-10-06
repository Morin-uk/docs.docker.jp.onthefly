%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Configuring the Notary client, server and signer.
keywords: docker, notary, notary-client, notary-server, notary server, notary-signer, notary signer
title: Notary client configuration file
---
@y
---
description: Configuring the Notary client, server and signer.
keywords: docker, notary, notary-client, notary-server, notary server, notary-signer, notary signer
title: Notary client configuration file
---
@z

@x
This document is for power users of the [Notary client](../advanced_usage.md)
who want to facilitate CLI interaction or specify custom options.
@y
This document is for power users of the [Notary client](../advanced_usage.md)
who want to facilitate CLI interaction or specify custom options.
@z

@x
The configuration file for Notary client normally resides at `~/.notary/config.json`,
but the path to a different configuration file can be specified using the
`-c` or `--configFile` command line flag.
@y
The configuration file for Notary client normally resides at `~/.notary/config.json`,
but the path to a different configuration file can be specified using the
`-c` or `--configFile` command line flag.
@z

@x
## Overview of the file
@y
## Overview of the file
@z

@x
In addition to the configuration file format, see the optional password
[environment variables](client-config.md#environment-variables-optional) that the Notary client
can take for ease of use.
@y
In addition to the configuration file format, see the optional password
[environment variables](client-config.md#environment-variables-optional) that the Notary client
can take for ease of use.
@z

@x
Here is a full client configuration file example; click on the top level
JSON keys to learn more about the configuration section corresponding to that key:
@y
Here is a full client configuration file example; click on the top level
JSON keys to learn more about the configuration section corresponding to that key:
@z

@x
<pre><code class="language-json">{
  <a href="#trust_dir-section-optional">"trust_dir"</a> : "~/.docker/trust",
  <a href="#remote_server-section-optional">"remote_server"</a>: {
    "url": "https://my-notary-server.my-private-registry.com",
    "root_ca": "./fixtures/root-ca.crt",
    "tls_client_cert": "./fixtures/secure.example.com.crt",
    "tls_client_key": "./fixtures/secure.example.com.crt"
  },
  <a href="#trust_pinning-section-optional">"trust_pinning"</a>: {
    "certs": {
      "docker.com/notary": ["49cf5c6404a35fa41d5a5aa2ce539dfee0d7a2176d0da488914a38603b1f4292"]
    }
  }
}
</code></pre>
@y
<pre><code class="language-json">{
  <a href="#trust_dir-section-optional">"trust_dir"</a> : "~/.docker/trust",
  <a href="#remote_server-section-optional">"remote_server"</a>: {
    "url": "https://my-notary-server.my-private-registry.com",
    "root_ca": "./fixtures/root-ca.crt",
    "tls_client_cert": "./fixtures/secure.example.com.crt",
    "tls_client_key": "./fixtures/secure.example.com.crt"
  },
  <a href="#trust_pinning-section-optional">"trust_pinning"</a>: {
    "certs": {
      "docker.com/notary": ["49cf5c6404a35fa41d5a5aa2ce539dfee0d7a2176d0da488914a38603b1f4292"]
    }
  }
}
</code></pre>
@z

@x
## trust_dir section (optional)
@y
## trust_dir section (optional)
@z

@x
The `trust_dir` specifies the location (as an absolute path or a path
relative to the directory of the configuration file) where the TUF metadata
and private keys are stored.
@y
The `trust_dir` specifies the location (as an absolute path or a path
relative to the directory of the configuration file) where the TUF metadata
and private keys are stored.
@z

@x
This is normally defaults to `~/.notary`, but specifying `~/.docker/trust`
facilitates interoperability with content trust.
@y
This is normally defaults to `~/.notary`, but specifying `~/.docker/trust`
facilitates interoperability with content trust.
@z

@x
This option can be overridden with the command line flag `--trustDir`.
@y
This option can be overridden with the command line flag `--trustDir`.
@z

@x
## remote_server section (optional)
@y
## remote_server section (optional)
@z

@x
The `remote_server` specifies how to connect to a Notary server to download
metadata updates and publish metadata changes.
@y
The `remote_server` specifies how to connect to a Notary server to download
metadata updates and publish metadata changes.
@z

@x
Remote server example:
@y
Remote server example:
@z

@x
```json
"remote_server": {
  "url": "https://my-notary-server.my-private-registry.com",
  "root_ca": "./fixtures/root-ca.crt",
  "tls_client_cert": "./fixtures/secure.example.com.crt",
  "tls_client_key": "./fixtures/secure.example.com.crt"
}
```
@y
```json
"remote_server": {
  "url": "https://my-notary-server.my-private-registry.com",
  "root_ca": "./fixtures/root-ca.crt",
  "tls_client_cert": "./fixtures/secure.example.com.crt",
  "tls_client_key": "./fixtures/secure.example.com.crt"
}
```
@z

@x
<table>
	<tr>
		<th>Parameter</th>
		<th>Required</th>
		<th>Description</th>
	</tr>
	<tr>
		<td valign="top"><code>url</code></td>
		<td valign="top">no</td>
		<td valign="top">URL of the Notary server: defaults to https://notary.docker.io
			This configuration option can be overridden with the command line flag
			`-s` or `--server`.</td>
	</tr>
	<tr>
		<td valign="top"><code>root_ca</code></td>
		<td valign="top">no</td>
		<td valign="top"><p>The path to the file containing the root CA with which to verify
			the TLS certificate of the Notary server, for example if it is self-signed.
			The path is relative to the directory of the configuration file.</p>
			<p>This configuration option can overridden with the command line flag
			`--tlscacert`, which would specify a path relative to the current working
			directory where the Notary client is invoked.</p></td>
	</tr>
	<tr>
		<td valign="top"><code>tls_client_cert</code></td>
		<td valign="top">no</td>
		<td valign="top"><p>The path to the client certificate to use for mutual TLS with
			the Notary server.  Must be provided along with <code>tls_client_key</code>
			or not provided at all.  The path is relative to the directory of the
			configuration file.</p>
			<p>This configuration option can overridden with the command line flag
			`--tlscert`, which would specify a path relative to the current working
			directory where the Notary client is invoked.</p></td>
	</tr>
	<tr>
		<td valign="top"><code>tls_client_key</code></td>
		<td valign="top">no</td>
		<td valign="top"><p>The path to the client key to use for mutual TLS with
			the Notary server. Must be provided along with <code>tls_client_cert</code>
			or not provided at all.  The path is relative to the directory of the
			configuration file.</p>
			<p>This configuration option can overridden with the command line flag
			`--tlskey`, which would specify a path relative to the current working
			directory where the Notary client is invoked.</p></td>
	</tr>
</table>
@y
<table>
	<tr>
		<th>Parameter</th>
		<th>Required</th>
		<th>Description</th>
	</tr>
	<tr>
		<td valign="top"><code>url</code></td>
		<td valign="top">no</td>
		<td valign="top">URL of the Notary server: defaults to https://notary.docker.io
			This configuration option can be overridden with the command line flag
			`-s` or `--server`.</td>
	</tr>
	<tr>
		<td valign="top"><code>root_ca</code></td>
		<td valign="top">no</td>
		<td valign="top"><p>The path to the file containing the root CA with which to verify
			the TLS certificate of the Notary server, for example if it is self-signed.
			The path is relative to the directory of the configuration file.</p>
			<p>This configuration option can overridden with the command line flag
			`--tlscacert`, which would specify a path relative to the current working
			directory where the Notary client is invoked.</p></td>
	</tr>
	<tr>
		<td valign="top"><code>tls_client_cert</code></td>
		<td valign="top">no</td>
		<td valign="top"><p>The path to the client certificate to use for mutual TLS with
			the Notary server.  Must be provided along with <code>tls_client_key</code>
			or not provided at all.  The path is relative to the directory of the
			configuration file.</p>
			<p>This configuration option can overridden with the command line flag
			`--tlscert`, which would specify a path relative to the current working
			directory where the Notary client is invoked.</p></td>
	</tr>
	<tr>
		<td valign="top"><code>tls_client_key</code></td>
		<td valign="top">no</td>
		<td valign="top"><p>The path to the client key to use for mutual TLS with
			the Notary server. Must be provided along with <code>tls_client_cert</code>
			or not provided at all.  The path is relative to the directory of the
			configuration file.</p>
			<p>This configuration option can overridden with the command line flag
			`--tlskey`, which would specify a path relative to the current working
			directory where the Notary client is invoked.</p></td>
	</tr>
</table>
@z

@x
## trust_pinning section (optional)
@y
## trust_pinning section (optional)
@z

@x
The `trust_pinning` specifies how to bootstrap trust for the root of a
Notary client's trusted collection.
@y
The `trust_pinning` specifies how to bootstrap trust for the root of a
Notary client's trusted collection.
@z

@x
This section is optional, Notary uses TOFU over HTTPS by default and
trust certificates in the downloaded root file.
@y
This section is optional, Notary uses TOFU over HTTPS by default and
trust certificates in the downloaded root file.
@z

@x
In this section, one can provide specific certificates to pin to, or a CA
to pin to as a root of trust for a GUN.  Multiple sections can be specified,
but the pinned certificates take highest priority for validation, followed
by the pinned CA, followed by TOFUS (TOFU over HTTPS).  The diagram below
describes this validation flow:
@y
In this section, one can provide specific certificates to pin to, or a CA
to pin to as a root of trust for a GUN.  Multiple sections can be specified,
but the pinned certificates take highest priority for validation, followed
by the pinned CA, followed by TOFUS (TOFU over HTTPS).  The diagram below
describes this validation flow:
@z

@x
![validation flow](https://cdn.rawgit.com/docker/notary/27469f01fe244bdf70f34219616657b336724bc3/docs/images/trust-pinning-flow.png)
@y
![validation flow](https://cdn.rawgit.com/docker/notary/27469f01fe244bdf70f34219616657b336724bc3/docs/images/trust-pinning-flow.png)
@z

@x
Only one trust pinning option is used to validate a GUN even if multiple
sections are specified, and any validation failure results in a failed
bootstrapping of the repo.
@y
Only one trust pinning option is used to validate a GUN even if multiple
sections are specified, and any validation failure results in a failed
bootstrapping of the repo.
@z

@x
<table>
	<tr>
		<th>Parameter</th>
		<th>Required</th>
		<th>Description</th>
	</tr>
	<tr>
		<td valign="top"><code>certs</code></td>
		<td valign="top">no</td>
		<td valign="top"><p>Mapping of GUN to certificate IDs to pin to.
		    Both are strings in the JSON object.</p></td>
	</tr>
	<tr>
		<td valign="top"><code>ca</code></td>
		<td valign="top">no</td>
		<td valign="top"><p>Mapping of GUN prefixes to filepaths containing
		    the root CA file with which to verify the certificates in the root file.
		    This file can contain multiple root certificates, bundled in separate
		    PEM blocks.
			The path is relative to the directory of the configuration file.</p></td>
	</tr>
	<tr>
		<td valign="top"><code>disable_tofu</code></td>
		<td valign="top">no</td>
		<td valign="top"><p>Boolean value determining whether to use trust
		    on first use when bootstrapping validation on a collection's
		    root file.  This keeps TOFUs on by default.</p></td>
	</tr>
</table>
@y
<table>
	<tr>
		<th>Parameter</th>
		<th>Required</th>
		<th>Description</th>
	</tr>
	<tr>
		<td valign="top"><code>certs</code></td>
		<td valign="top">no</td>
		<td valign="top"><p>Mapping of GUN to certificate IDs to pin to.
		    Both are strings in the JSON object.</p></td>
	</tr>
	<tr>
		<td valign="top"><code>ca</code></td>
		<td valign="top">no</td>
		<td valign="top"><p>Mapping of GUN prefixes to filepaths containing
		    the root CA file with which to verify the certificates in the root file.
		    This file can contain multiple root certificates, bundled in separate
		    PEM blocks.
			The path is relative to the directory of the configuration file.</p></td>
	</tr>
	<tr>
		<td valign="top"><code>disable_tofu</code></td>
		<td valign="top">no</td>
		<td valign="top"><p>Boolean value determining whether to use trust
		    on first use when bootstrapping validation on a collection's
		    root file.  This keeps TOFUs on by default.</p></td>
	</tr>
</table>
@z

@x
## Environment variables (optional)
@y
## Environment variables (optional)
@z

@x
The following environment variables containing signing key passphrases can
be used to facilitate [Notary client CLI interaction](../advanced_usage.md).
If provided, these passwords are used initially to sign TUF metadata.
If the passphrase is incorrect, you are prompted to enter the correct
passphrase.
@y
The following environment variables containing signing key passphrases can
be used to facilitate [Notary client CLI interaction](../advanced_usage.md).
If provided, these passwords are used initially to sign TUF metadata.
If the passphrase is incorrect, you are prompted to enter the correct
passphrase.
@z

@x
| Environment Variable          | Description                               |
| ----------------------------- | ----------------------------------------- |
|`NOTARY_ROOT_PASSPHRASE`       | The root/offline key passphrase           |
|`NOTARY_TARGETS_PASSPHRASE`    | The targets (an online) key passphrase    |
|`NOTARY_SNAPSHOT_PASSPHRASE`   | The snapshot (an online) key passphrase   |
|`NOTARY_DELEGATION_PASSPHRASE` | The delegation (an online) key passphrase |
|`NOTARY_AUTH`                  | The notary server credentials: `<username>:<password>` encoded in base64 |
@y
| Environment Variable          | Description                               |
| ----------------------------- | ----------------------------------------- |
|`NOTARY_ROOT_PASSPHRASE`       | The root/offline key passphrase           |
|`NOTARY_TARGETS_PASSPHRASE`    | The targets (an online) key passphrase    |
|`NOTARY_SNAPSHOT_PASSPHRASE`   | The snapshot (an online) key passphrase   |
|`NOTARY_DELEGATION_PASSPHRASE` | The delegation (an online) key passphrase |
|`NOTARY_AUTH`                  | The notary server credentials: `<username>:<password>` encoded in base64 |
@z

@x
If provided, the passphrase in `NOTARY_DELEGATION_PASSPHRASE`
is tried for all delegation roles that notary attempts to sign with.
@y
If provided, the passphrase in `NOTARY_DELEGATION_PASSPHRASE`
is tried for all delegation roles that notary attempts to sign with.
@z
