%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Runs a one-off command on a service.
keywords: fig, composition, compose, docker, orchestration, cli, run
title: docker-compose run
notoc: true
---
@y
---
description: Runs a one-off command on a service.
keywords: fig, composition, compose, docker, orchestration, cli, run
title: docker-compose run
notoc: true
---
@z

@x
```none
Usage:
    run [options] [-v VOLUME...] [-p PORT...] [-e KEY=VAL...] [-l KEY=VALUE...]
        SERVICE [COMMAND] [ARGS...]
@y
```none
Usage:
    run [options] [-v VOLUME...] [-p PORT...] [-e KEY=VAL...] [-l KEY=VALUE...]
        SERVICE [COMMAND] [ARGS...]
@z

@x
Options:
    -d, --detach          Detached mode: Run container in the background, print
                          new container name.
    --name NAME           Assign a name to the container
    --entrypoint CMD      Override the entrypoint of the image.
    -e KEY=VAL            Set an environment variable (can be used multiple times)
    -l, --label KEY=VAL   Add or override a label (can be used multiple times)
    -u, --user=""         Run as specified username or uid
    --no-deps             Don't start linked services.
    --rm                  Remove container after run. Ignored in detached mode.
    -p, --publish=[]      Publish a container's port(s) to the host
    --service-ports       Run command with the service's ports enabled and mapped
                          to the host.
    --use-aliases         Use the service's network aliases in the network(s) the
                          container connects to.
    -v, --volume=[]       Bind mount a volume (default [])
    -T                    Disable pseudo-tty allocation. By default `docker-compose run`
                          allocates a TTY.
    -w, --workdir=""      Working directory inside the container
```
@y
Options:
    -d, --detach          Detached mode: Run container in the background, print
                          new container name.
    --name NAME           Assign a name to the container
    --entrypoint CMD      Override the entrypoint of the image.
    -e KEY=VAL            Set an environment variable (can be used multiple times)
    -l, --label KEY=VAL   Add or override a label (can be used multiple times)
    -u, --user=""         Run as specified username or uid
    --no-deps             Don't start linked services.
    --rm                  Remove container after run. Ignored in detached mode.
    -p, --publish=[]      Publish a container's port(s) to the host
    --service-ports       Run command with the service's ports enabled and mapped
                          to the host.
    --use-aliases         Use the service's network aliases in the network(s) the
                          container connects to.
    -v, --volume=[]       Bind mount a volume (default [])
    -T                    Disable pseudo-tty allocation. By default `docker-compose run`
                          allocates a TTY.
    -w, --workdir=""      Working directory inside the container
```
@z

@x
Runs a one-time command against a service. For example, the following command starts the `web` service and runs `bash` as its command.
@y
Runs a one-time command against a service. For example, the following command starts the `web` service and runs `bash` as its command.
@z

@x
    docker-compose run web bash
@y
    docker-compose run web bash
@z

@x
Commands you use with `run` start in new containers with configuration defined by that of the service, including volumes, links, and other details. However, there are two important differences.
@y
Commands you use with `run` start in new containers with configuration defined by that of the service, including volumes, links, and other details. However, there are two important differences.
@z

@x
First, the command passed by `run` overrides the command defined in the service configuration. For example, if the  `web` service configuration is started with `bash`, then `docker-compose run web python app.py` overrides it with `python app.py`.
@y
First, the command passed by `run` overrides the command defined in the service configuration. For example, if the  `web` service configuration is started with `bash`, then `docker-compose run web python app.py` overrides it with `python app.py`.
@z

@x
The second difference is that the `docker-compose run` command does not create any of the ports specified in the service configuration. This prevents port collisions with already-open ports. If you *do want* the service's ports to be created and mapped to the host, specify the `--service-ports` flag:
@y
The second difference is that the `docker-compose run` command does not create any of the ports specified in the service configuration. This prevents port collisions with already-open ports. If you *do want* the service's ports to be created and mapped to the host, specify the `--service-ports` flag:
@z

@x
    docker-compose run --service-ports web python manage.py shell
@y
    docker-compose run --service-ports web python manage.py shell
@z

@x
Alternatively, manual port mapping can be specified with the `--publish` or `-p` options, just as when using `docker run`:
@y
Alternatively, manual port mapping can be specified with the `--publish` or `-p` options, just as when using `docker run`:
@z

@x
    docker-compose run --publish 8080:80 -p 2022:22 -p 127.0.0.1:2021:21 web python manage.py shell
@y
    docker-compose run --publish 8080:80 -p 2022:22 -p 127.0.0.1:2021:21 web python manage.py shell
@z

@x
If you start a service configured with links, the `run` command first checks to see if the linked service is running and starts the service if it is stopped.  Once all the linked services are running, the `run` executes the command you passed it. For example, you could run:
@y
If you start a service configured with links, the `run` command first checks to see if the linked service is running and starts the service if it is stopped.  Once all the linked services are running, the `run` executes the command you passed it. For example, you could run:
@z

@x
    docker-compose run db psql -h db -U docker
@y
    docker-compose run db psql -h db -U docker
@z

@x
This opens an interactive PostgreSQL shell for the linked `db` container.
@y
This opens an interactive PostgreSQL shell for the linked `db` container.
@z

@x
If you do not want the `run` command to start linked containers, use the `--no-deps` flag:
@y
If you do not want the `run` command to start linked containers, use the `--no-deps` flag:
@z

@x
    docker-compose run --no-deps web python manage.py shell
@y
    docker-compose run --no-deps web python manage.py shell
@z

@x
If you want to remove the container after running while overriding the container's restart policy, use the `--rm` flag:
@y
If you want to remove the container after running while overriding the container's restart policy, use the `--rm` flag:
@z

@x
    docker-compose run --rm web python manage.py db upgrade
@y
    docker-compose run --rm web python manage.py db upgrade
@z

@x
This runs a database upgrade script, and removes the container when finished running, even if a restart policy is specified in the service configuration.
@y
This runs a database upgrade script, and removes the container when finished running, even if a restart policy is specified in the service configuration.
@z
