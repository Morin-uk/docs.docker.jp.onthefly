%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Configuring the notary client, server and signer.
keywords: docker, notary, notary-client, notary-server, notary server, notary-signer, notary signer
title: Notary signer configuration file
---
@y
---
description: Configuring the notary client, server and signer.
keywords: docker, notary, notary-client, notary-server, notary server, notary-signer, notary signer
title: Notary signer configuration file
---
@z

@x
This document is for those who are [running their own Notary service](../running_a_service.md)
and want to specify custom options.
@y
This document is for those who are [running their own Notary service](../running_a_service.md)
and want to specify custom options.
@z

@x
## Overview
@y
## Overview
@z

@x
Notary signer [requires environment variables](signer-config.md#environment-variables-required-if-using-mysql)
to encrypt private keys at rest. It also requires a configuration file, the
path to which is specified on the command line using the `-config` flag.
@y
Notary signer [requires environment variables](signer-config.md#environment-variables-required-if-using-mysql)
to encrypt private keys at rest. It also requires a configuration file, the
path to which is specified on the command line using the `-config` flag.
@z

@x
Here is a full signer configuration file example:
@y
Here is a full signer configuration file example:
@z

@x
```json
{
  "server": {
    "http_addr": ":4444",
    "grpc_addr": ":7899",
    "tls_cert_file": "./fixtures/notary-signer.crt",
    "tls_key_file": "./fixtures/notary-signer.key",
    "client_ca_file": "./fixtures/notary-server.crt"
  },
  "logging": {
    "level": 2
  },
  "storage": {
    "backend": "mysql",
    "db_url": "user:pass@tcp(notarymysql:3306)/databasename?parseTime=true",
    "default_alias": "passwordalias1"
  },
  "reporting": {
    "bugsnag": {
      "api_key": "c9d60ae4c7e70c4b6c4ebd3e8056d2b8",
      "release_stage": "production"
    }
  }
}
```
@y
```json
{
  "server": {
    "http_addr": ":4444",
    "grpc_addr": ":7899",
    "tls_cert_file": "./fixtures/notary-signer.crt",
    "tls_key_file": "./fixtures/notary-signer.key",
    "client_ca_file": "./fixtures/notary-server.crt"
  },
  "logging": {
    "level": 2
  },
  "storage": {
    "backend": "mysql",
    "db_url": "user:pass@tcp(notarymysql:3306)/databasename?parseTime=true",
    "default_alias": "passwordalias1"
  },
  "reporting": {
    "bugsnag": {
      "api_key": "c9d60ae4c7e70c4b6c4ebd3e8056d2b8",
      "release_stage": "production"
    }
  }
}
```
@z

@x
For details on the `reporting` and `logging` sections, see the documentation on
[common Notary configuration sections](common-configs.md).
@y
For details on the `reporting` and `logging` sections, see the documentation on
[common Notary configuration sections](common-configs.md).
@z

@x
## server section (required)
@y
## server section (required)
@z

@x
"server" in this case refers to Notary signer's HTTP/GRPC server, not
"Notary server".
@y
"server" in this case refers to Notary signer's HTTP/GRPC server, not
"Notary server".
@z

@x
Example:
@y
Example:
@z

@x
```json
{
  "server": {
    "http_addr": ":4444",
    "grpc_addr": ":7899",
    "tls_cert_file": "./fixtures/notary-signer.crt",
    "tls_key_file": "./fixtures/notary-signer.key",
    "client_ca_file": "./fixtures/notary-server.crt"
  }
}
```
@y
```json
{
  "server": {
    "http_addr": ":4444",
    "grpc_addr": ":7899",
    "tls_cert_file": "./fixtures/notary-signer.crt",
    "tls_key_file": "./fixtures/notary-signer.key",
    "client_ca_file": "./fixtures/notary-server.crt"
  }
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
		<td valign="top"><code>http_addr</code></td>
		<td valign="top">yes</td>
		<td valign="top">The TCP address (IP and port) to listen for HTTP
			traffic on.  Examples:
			<ul>
			<li><code>":4444"</code> means listen on port 4444 on all IPs (and
				hence all interfaces, such as those listed when you run
				<code>ifconfig</code>)</li>
			<li><code>"127.0.0.1:4444"</code> means listen on port 4444 on
				localhost only.  That means that the server is not
				accessible except locally (via SSH tunnel, or just on a local
				terminal)</li>
			</ul>
		</td>
	</tr>
	<tr>
		<td valign="top"><code>grpc_addr</code></td>
		<td valign="top">yes</td>
		<td valign="top">The TCP address (IP and port) to listen for GRPC
			traffic.  Examples:
			<ul>
			<li><code>":7899"</code> means listen on port 7899 on all IPs (and
				hence all interfaces, such as those listed when you run
				<code>ifconfig</code>)</li>
			<li><code>"127.0.0.1:7899"</code> means listen on port 7899 on
				localhost only.  That means that the server is not
				accessible except locally (via SSH tunnel, or just on a local
				terminal)</li>
			</ul>
		</td>
	</tr>
	<tr>
		<td valign="top"><code>tls_key_file</code></td>
		<td valign="top">yes</td>
		<td valign="top">The path to the private key to use for
			HTTPS. The path is relative to the directory of the
			configuration file.</td>
	</tr>
	<tr>
		<td valign="top"><code>tls_cert_file</code></td>
		<td valign="top">yes</td>
		<td valign="top">The path to the certificate to use for
			HTTPS. The path is relative to the directory of the
			configuration file.</td>
	</tr>
	<tr>
		<td valign="top"><code>client_ca_file</code></td>
		<td valign="top">no</td>
		<td valign="top">The root certificate to trust for
			mutual authentication. If provided, any clients connecting to
			Notary signer need a client certificate signed by
			this root. If not provided, mutual authentication is not
			required. The path is relative to the directory of the
			configuration file.</td>
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
		<td valign="top"><code>http_addr</code></td>
		<td valign="top">yes</td>
		<td valign="top">The TCP address (IP and port) to listen for HTTP
			traffic on.  Examples:
			<ul>
			<li><code>":4444"</code> means listen on port 4444 on all IPs (and
				hence all interfaces, such as those listed when you run
				<code>ifconfig</code>)</li>
			<li><code>"127.0.0.1:4444"</code> means listen on port 4444 on
				localhost only.  That means that the server is not
				accessible except locally (via SSH tunnel, or just on a local
				terminal)</li>
			</ul>
		</td>
	</tr>
	<tr>
		<td valign="top"><code>grpc_addr</code></td>
		<td valign="top">yes</td>
		<td valign="top">The TCP address (IP and port) to listen for GRPC
			traffic.  Examples:
			<ul>
			<li><code>":7899"</code> means listen on port 7899 on all IPs (and
				hence all interfaces, such as those listed when you run
				<code>ifconfig</code>)</li>
			<li><code>"127.0.0.1:7899"</code> means listen on port 7899 on
				localhost only.  That means that the server is not
				accessible except locally (via SSH tunnel, or just on a local
				terminal)</li>
			</ul>
		</td>
	</tr>
	<tr>
		<td valign="top"><code>tls_key_file</code></td>
		<td valign="top">yes</td>
		<td valign="top">The path to the private key to use for
			HTTPS. The path is relative to the directory of the
			configuration file.</td>
	</tr>
	<tr>
		<td valign="top"><code>tls_cert_file</code></td>
		<td valign="top">yes</td>
		<td valign="top">The path to the certificate to use for
			HTTPS. The path is relative to the directory of the
			configuration file.</td>
	</tr>
	<tr>
		<td valign="top"><code>client_ca_file</code></td>
		<td valign="top">no</td>
		<td valign="top">The root certificate to trust for
			mutual authentication. If provided, any clients connecting to
			Notary signer need a client certificate signed by
			this root. If not provided, mutual authentication is not
			required. The path is relative to the directory of the
			configuration file.</td>
	</tr>
</table>
@z

@x
## storage section (required)
@y
## storage section (required)
@z

@x
This is used to store encrypted private keys.  We only support MySQL or an
in-memory store, currently.
@y
This is used to store encrypted private keys.  We only support MySQL or an
in-memory store, currently.
@z

@x
Example:
@y
Example:
@z

@x
```json
"storage": {
  "backend": "mysql",
  "db_url": "user:pass@tcp(notarymysql:3306)/databasename?parseTime=true",
  "default_alias": "passwordalias1"
}
```
@y
```json
"storage": {
  "backend": "mysql",
  "db_url": "user:pass@tcp(notarymysql:3306)/databasename?parseTime=true",
  "default_alias": "passwordalias1"
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
		<td valign="top"><code>backend</code></td>
		<td valign="top">yes</td>
		<td valign="top">Must be <code>"mysql"</code> or <code>"memory"</code>.
			If <code>"memory"</code> is selected, the <code>db_url</code>
			is ignored.</td>
	</tr>
	<tr>
		<td valign="top"><code>db_url</code></td>
		<td valign="top">yes if not <code>memory</code></td>
		<td valign="top">The <a href="https://github.com/go-sql-driver/mysql">
			the Data Source Name used to access the DB.</a>
			(include <code>parseTime=true</code> as part of the DSN)</td>
	</tr>
	<tr>
		<td valign="top"><code>default_alias</code></td>
		<td valign="top">yes if not <code>memory</code></td>
		<td valign="top">This parameter specifies the alias of the current
			password used to encrypt the private keys in the DB.  All new
			private keys are encrypted using this password, which
			must also be provided as the environment variable
			<code>NOTARY_SIGNER_&lt;DEFAULT_ALIAS_VALUE&gt;</code>.
			See the <a href="#environment-variables-required-if-using-mysql">environment variable</a>
			section for more information.</td>
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
		<td valign="top"><code>backend</code></td>
		<td valign="top">yes</td>
		<td valign="top">Must be <code>"mysql"</code> or <code>"memory"</code>.
			If <code>"memory"</code> is selected, the <code>db_url</code>
			is ignored.</td>
	</tr>
	<tr>
		<td valign="top"><code>db_url</code></td>
		<td valign="top">yes if not <code>memory</code></td>
		<td valign="top">The <a href="https://github.com/go-sql-driver/mysql">
			the Data Source Name used to access the DB.</a>
			(include <code>parseTime=true</code> as part of the DSN)</td>
	</tr>
	<tr>
		<td valign="top"><code>default_alias</code></td>
		<td valign="top">yes if not <code>memory</code></td>
		<td valign="top">This parameter specifies the alias of the current
			password used to encrypt the private keys in the DB.  All new
			private keys are encrypted using this password, which
			must also be provided as the environment variable
			<code>NOTARY_SIGNER_&lt;DEFAULT_ALIAS_VALUE&gt;</code>.
			See the <a href="#environment-variables-required-if-using-mysql">environment variable</a>
			section for more information.</td>
	</tr>
</table>
@z

@x
## Environment variables (required if using MySQL)
@y
## Environment variables (required if using MySQL)
@z

@x
Notary signer stores the private keys in encrypted form.
The alias of the passphrase used to encrypt the keys is also stored.  In order
to encrypt the keys for storage and decrypt the keys for signing, the
passphrase must be passed in as an environment variable.
@y
Notary signer stores the private keys in encrypted form.
The alias of the passphrase used to encrypt the keys is also stored.  In order
to encrypt the keys for storage and decrypt the keys for signing, the
passphrase must be passed in as an environment variable.
@z

@x
For example, the configuration above specifies the default password alias to be
`passwordalias1`.
@y
For example, the configuration above specifies the default password alias to be
`passwordalias1`.
@z

@x
If this configuration is used, then you must:
@y
If this configuration is used, then you must:
@z

@x
```bash
export NOTARY_SIGNER_PASSWORDALIAS1=mypassword
```
@y
```bash
export NOTARY_SIGNER_PASSWORDALIAS1=mypassword
```
@z

@x
so that that Notary signer knows to encrypt all keys with the passphrase
`mypassword`, and to decrypt any private key stored with password alias
`passwordalias1` with the passphrase `mypassword`.
@y
so that that Notary signer knows to encrypt all keys with the passphrase
`mypassword`, and to decrypt any private key stored with password alias
`passwordalias1` with the passphrase `mypassword`.
@z

@x
Older passwords may also be provided as environment variables.
@y
Older passwords may also be provided as environment variables.
@z

@x
Let's say that you wanted to change the password that is used to create new
keys (rotating the passphrase and re-encrypting all the private keys is not
supported yet).
@y
Let's say that you wanted to change the password that is used to create new
keys (rotating the passphrase and re-encrypting all the private keys is not
supported yet).
@z

@x
You could change the config to look like:
@y
You could change the config to look like:
@z

@x
```json
"storage": {
  "backend": "mysql",
  "db_url": "user:pass@tcp(notarymysql:3306)/databasename?parseTime=true",
  "default_alias": "passwordalias2"
}
```
@y
```json
"storage": {
  "backend": "mysql",
  "db_url": "user:pass@tcp(notarymysql:3306)/databasename?parseTime=true",
  "default_alias": "passwordalias2"
}
```
@z

@x
Then you can set:
@y
Then you can set:
@z

@x
```bash
export NOTARY_SIGNER_PASSWORDALIAS1=mypassword
export NOTARY_SIGNER_PASSWORDALIAS2=mynewfancypassword
```
@y
```bash
export NOTARY_SIGNER_PASSWORDALIAS1=mypassword
export NOTARY_SIGNER_PASSWORDALIAS2=mynewfancypassword
```
@z

@x
That way, all new keys are encrypted and decrypted using the passphrase
`mynewfancypassword`, but old keys that were encrypted using the passphrase
`mypassword` can still be decrypted.
@y
That way, all new keys are encrypted and decrypted using the passphrase
`mynewfancypassword`, but old keys that were encrypted using the passphrase
`mypassword` can still be decrypted.
@z

@x
The environment variables for the older passwords are optional, but Notary
Signer cannot decrypt older keys if they are not provided, and
attempts to sign data using those keys fail.
@y
The environment variables for the older passwords are optional, but Notary
Signer cannot decrypt older keys if they are not provided, and
attempts to sign data using those keys fail.
@z

@x
## Related information
@y
## Related information
@z

@x
* [Notary Server Configuration File](server-config.md)
* [Configuration sections common to the Notary server and signer](common-configs.md)
@y
* [Notary Server Configuration File](server-config.md)
* [Configuration sections common to the Notary server and signer](common-configs.md)
@z
