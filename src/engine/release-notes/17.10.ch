%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker Engine 17.11 release notes
toc_min: 1
toc_max: 2
skip_read_time: true
---
@y
---
title: Docker Engine 17.11 release notes
toc_min: 1
toc_max: 2
skip_read_time: true
---
@z

@x
## 17.10.0-ce
2017-10-17
@y
## 17.10.0-ce
2017-10-17
@z

@x
> **Important**: Starting with this release, `docker service create`, `docker service update`,
`docker service scale` and `docker service rollback` use non-detached mode as default,
use `--detach` to keep the old behaviour.
{: .important }
@y
> **Important**: Starting with this release, `docker service create`, `docker service update`,
`docker service scale` and `docker service rollback` use non-detached mode as default,
use `--detach` to keep the old behaviour.
{: .important }
@z

@x
### Builder
@y
### Builder
@z

@x
* Reset uid/gid to 0 in uploaded build context to share build cache with other clients [docker/cli#513](https://github.com/docker/cli/pull/513)
+ Add support for `ADD` urls without any sub path [moby/moby#34217](https://github.com/moby/moby/pull/34217)
@y
* Reset uid/gid to 0 in uploaded build context to share build cache with other clients [docker/cli#513](https://github.com/docker/cli/pull/513)
+ Add support for `ADD` urls without any sub path [moby/moby#34217](https://github.com/moby/moby/pull/34217)
@z

@x
### Client
@y
### Client
@z

@x
* Move output of `docker stack rm` to stdout [docker/cli#491](https://github.com/docker/cli/pull/491)
* Use natural sort for secrets and configs in cli [docker/cli#307](https://github.com/docker/cli/pull/307)
* Use non-detached mode as default for `docker service` commands [docker/cli#525](https://github.com/docker/cli/pull/525)
* Set APIVersion on the client, even when Ping fails [docker/cli#546](https://github.com/docker/cli/pull/546)
- Fix loader error with different build syntax in `docker stack deploy` [docker/cli#544](https://github.com/docker/cli/pull/544)
* Change the default output format for `docker container stats` to show `CONTAINER ID` and `NAME` [docker/cli#565](https://github.com/docker/cli/pull/565)
+ Add `--no-trunc` flag to `docker container stats` [docker/cli#565](https://github.com/docker/cli/pull/565)
+ Add experimental `docker trust`: `view`, `revoke`, `sign` subcommands [docker/cli#472](https://github.com/docker/cli/pull/472)
- Various doc and shell completion fixes [docker/cli#610](https://github.com/docker/cli/pull/610) [docker/cli#611](https://github.com/docker/cli/pull/611) [docker/cli#618](https://github.com/docker/cli/pull/618) [docker/cli#580](https://github.com/docker/cli/pull/580) [docker/cli#598](https://github.com/docker/cli/pull/598) [docker/cli#603](https://github.com/docker/cli/pull/603)
@y
* Move output of `docker stack rm` to stdout [docker/cli#491](https://github.com/docker/cli/pull/491)
* Use natural sort for secrets and configs in cli [docker/cli#307](https://github.com/docker/cli/pull/307)
* Use non-detached mode as default for `docker service` commands [docker/cli#525](https://github.com/docker/cli/pull/525)
* Set APIVersion on the client, even when Ping fails [docker/cli#546](https://github.com/docker/cli/pull/546)
- Fix loader error with different build syntax in `docker stack deploy` [docker/cli#544](https://github.com/docker/cli/pull/544)
* Change the default output format for `docker container stats` to show `CONTAINER ID` and `NAME` [docker/cli#565](https://github.com/docker/cli/pull/565)
+ Add `--no-trunc` flag to `docker container stats` [docker/cli#565](https://github.com/docker/cli/pull/565)
+ Add experimental `docker trust`: `view`, `revoke`, `sign` subcommands [docker/cli#472](https://github.com/docker/cli/pull/472)
- Various doc and shell completion fixes [docker/cli#610](https://github.com/docker/cli/pull/610) [docker/cli#611](https://github.com/docker/cli/pull/611) [docker/cli#618](https://github.com/docker/cli/pull/618) [docker/cli#580](https://github.com/docker/cli/pull/580) [docker/cli#598](https://github.com/docker/cli/pull/598) [docker/cli#603](https://github.com/docker/cli/pull/603)
@z

@x
### Networking
@y
### Networking
@z

@x
* Enabling ILB/ELB on windows using per-node, per-network LB endpoint [moby/moby#34674](https://github.com/moby/moby/pull/34674)
* Overlay fix for transient IP reuse [docker/libnetwork#1935](https://github.com/docker/libnetwork/pull/1935)
* Serializing bitseq alloc [docker/libnetwork#1788](https://github.com/docker/libnetwork/pull/1788)
- Disable hostname lookup on chain exists check [docker/libnetwork#1974](https://github.com/docker/libnetwork/pull/1974)
@y
* Enabling ILB/ELB on windows using per-node, per-network LB endpoint [moby/moby#34674](https://github.com/moby/moby/pull/34674)
* Overlay fix for transient IP reuse [docker/libnetwork#1935](https://github.com/docker/libnetwork/pull/1935)
* Serializing bitseq alloc [docker/libnetwork#1788](https://github.com/docker/libnetwork/pull/1788)
- Disable hostname lookup on chain exists check [docker/libnetwork#1974](https://github.com/docker/libnetwork/pull/1974)
@z

@x
### Runtime
@y
### Runtime
@z

@x
* LCOW: Add UVM debuggability by grabbing logs before tear-down [moby/moby#34846](https://github.com/moby/moby/pull/34846)
* LCOW: Prepare work for bind mounts [moby/moby#34258](https://github.com/moby/moby/pull/34258)
* LCOW: Support for docker cp, ADD/COPY on build [moby/moby#34252](https://github.com/moby/moby/pull/34252)
* LCOW: VHDX boot to readonly [moby/moby#34754](https://github.com/moby/moby/pull/34754)
* Volume: evaluate symlinks before relabeling mount source [moby/moby#34792](https://github.com/moby/moby/pull/34792)
- Fixing ‘docker cp’ to allow new target file name in a host symlinked directory [moby/moby#31993](https://github.com/moby/moby/pull/31993)
+ Add support for Windows version filtering on pull [moby/moby#35090](https://github.com/moby/moby/pull/35090)
@y
* LCOW: Add UVM debuggability by grabbing logs before tear-down [moby/moby#34846](https://github.com/moby/moby/pull/34846)
* LCOW: Prepare work for bind mounts [moby/moby#34258](https://github.com/moby/moby/pull/34258)
* LCOW: Support for docker cp, ADD/COPY on build [moby/moby#34252](https://github.com/moby/moby/pull/34252)
* LCOW: VHDX boot to readonly [moby/moby#34754](https://github.com/moby/moby/pull/34754)
* Volume: evaluate symlinks before relabeling mount source [moby/moby#34792](https://github.com/moby/moby/pull/34792)
- Fixing ‘docker cp’ to allow new target file name in a host symlinked directory [moby/moby#31993](https://github.com/moby/moby/pull/31993)
+ Add support for Windows version filtering on pull [moby/moby#35090](https://github.com/moby/moby/pull/35090)
@z

@x
### Swarm mode
@y
### Swarm mode
@z

@x
* Produce an error if `docker swarm init --force-new-cluster` is executed on worker nodes [moby/moby#34881](https://github.com/moby/moby/pull/34881)
+ Add support for `.Node.Hostname` templating in swarm services [moby/moby#34686](https://github.com/moby/moby/pull/34686)
* Increase gRPC request timeout to 20 seconds for sending snapshots [docker/swarmkit#2391](https://github.com/docker/swarmkit/pull/2391)
- Do not filter nodes if logdriver is set to `none` [docker/swarmkit#2396](https://github.com/docker/swarmkit/pull/2396)
+ Adding ipam options to ipam driver requests [docker/swarmkit#2324](https://github.com/docker/swarmkit/pull/2324)
@y
* Produce an error if `docker swarm init --force-new-cluster` is executed on worker nodes [moby/moby#34881](https://github.com/moby/moby/pull/34881)
+ Add support for `.Node.Hostname` templating in swarm services [moby/moby#34686](https://github.com/moby/moby/pull/34686)
* Increase gRPC request timeout to 20 seconds for sending snapshots [docker/swarmkit#2391](https://github.com/docker/swarmkit/pull/2391)
- Do not filter nodes if logdriver is set to `none` [docker/swarmkit#2396](https://github.com/docker/swarmkit/pull/2396)
+ Adding ipam options to ipam driver requests [docker/swarmkit#2324](https://github.com/docker/swarmkit/pull/2324)
@z
