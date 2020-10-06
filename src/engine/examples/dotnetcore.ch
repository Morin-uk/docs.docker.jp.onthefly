%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Create a Docker image by layering your ASP.NET Core app on debian for Linux Containers or with Windows Nano Server containers using a Dockerfile.
keywords: dockerize, dockerizing, dotnet, .NET, Core, article, example, platform, installation, containers, images, image, dockerfile, build, asp.net, asp.net core
title: Dockerize an ASP.NET Core application
---
@y
---
description: Create a Docker image by layering your ASP.NET Core app on debian for Linux Containers or with Windows Nano Server containers using a Dockerfile.
keywords: dockerize, dockerizing, dotnet, .NET, Core, article, example, platform, installation, containers, images, image, dockerfile, build, asp.net, asp.net core
title: Dockerize an ASP.NET Core application
---
@z

@x
## Introduction
@y
## Introduction
@z

@x
This example demonstrates how to dockerize an ASP.NET Core application.
@y
This example demonstrates how to dockerize an ASP.NET Core application.
@z

@x
## Why build ASP.NET Core?
@y
## Why build ASP.NET Core?
@z

@x
- [Open-source](https://github.com/aspnet/home)
- Develop and run your ASP.NET Core apps cross-platform on Windows, MacOS, and
  Linux
- Great for modern cloud-based apps, such as web apps, IoT apps, and mobile
  backends
- ASP.NET Core apps can run on [.NET
  Core](https://www.microsoft.com/net/core/platform) or on the full [.NET
  Framework](https://www.microsoft.com/net/framework)
- Designed to provide an optimized development framework for apps that are
  deployed to the cloud or run on-premises
- Modular components with minimal overhead retain flexibility while
constructing your solutions
@y
- [Open-source](https://github.com/aspnet/home)
- Develop and run your ASP.NET Core apps cross-platform on Windows, MacOS, and
  Linux
- Great for modern cloud-based apps, such as web apps, IoT apps, and mobile
  backends
- ASP.NET Core apps can run on [.NET
  Core](https://www.microsoft.com/net/core/platform) or on the full [.NET
  Framework](https://www.microsoft.com/net/framework)
- Designed to provide an optimized development framework for apps that are
  deployed to the cloud or run on-premises
- Modular components with minimal overhead retain flexibility while
constructing your solutions
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
This example assumes you already have an ASP.NET Core app
on your machine. If you are new to ASP.NET you can follow a [simple
tutorial](https://www.asp.net/get-started) to initialize a project or clone our [ASP.NET Docker Sample](https://github.com/dotnet/dotnet-docker/tree/master/samples/aspnetapp).
@y
This example assumes you already have an ASP.NET Core app
on your machine. If you are new to ASP.NET you can follow a [simple
tutorial](https://www.asp.net/get-started) to initialize a project or clone our [ASP.NET Docker Sample](https://github.com/dotnet/dotnet-docker/tree/master/samples/aspnetapp).
@z

@x
## Create a Dockerfile for an ASP.NET Core application
@y
## Create a Dockerfile for an ASP.NET Core application
@z

@x
1.  Create a `Dockerfile` in your project folder.
2.  Add the text below to your `Dockerfile` for either Linux or [Windows
   Containers](https://docs.microsoft.com/virtualization/windowscontainers/about/).
    The tags below are multi-arch meaning they pull either Windows or
    Linux containers depending on what mode is set in
    [Docker Desktop for Windows](../../docker-for-windows/index.md). Read more on
    [switching containers](../../docker-for-windows/index.md#switch-between-windows-and-linux-containers).
3.  The `Dockerfile` assumes that your application is called `aspnetapp`. Change
   the `Dockerfile` to use the DLL file of your project.
@y
1.  Create a `Dockerfile` in your project folder.
2.  Add the text below to your `Dockerfile` for either Linux or [Windows
   Containers](https://docs.microsoft.com/virtualization/windowscontainers/about/).
    The tags below are multi-arch meaning they pull either Windows or
    Linux containers depending on what mode is set in
    [Docker Desktop for Windows](../../docker-for-windows/index.md). Read more on
    [switching containers](../../docker-for-windows/index.md#switch-between-windows-and-linux-containers).
3.  The `Dockerfile` assumes that your application is called `aspnetapp`. Change
   the `Dockerfile` to use the DLL file of your project.
@z

@x
```dockerfile
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app
@y
```dockerfile
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app
@z

@x
# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore
@y
# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore
@z

@x
# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out
@y
# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out
@z

@x
# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "aspnetapp.dll"]
```
@y
# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "aspnetapp.dll"]
```
@z

@x
4.  To make your build context as small as possible add a [`.dockerignore`
   file](/engine/reference/builder/#dockerignore-file)
   to your project folder and copy the following into it.
@y
4.  To make your build context as small as possible add a [`.dockerignore`
   file](/engine/reference/builder/#dockerignore-file)
   to your project folder and copy the following into it.
@z

@x
```dockerignore
bin/
obj/
```
@y
```dockerignore
bin/
obj/
```
@z

@x
## Build and run the Docker image
@y
## Build and run the Docker image
@z

@x
1.  Open a command prompt and navigate to your project folder.
2.  Use the following commands to build and run your Docker image:
@y
1.  Open a command prompt and navigate to your project folder.
2.  Use the following commands to build and run your Docker image:
@z

@x
```console
$ docker build -t aspnetapp .
$ docker run -d -p 8080:80 --name myapp aspnetapp
```
@y
```console
$ docker build -t aspnetapp .
$ docker run -d -p 8080:80 --name myapp aspnetapp
```
@z

@x
## View the web page running from a container
@y
## View the web page running from a container
@z

@x
* Go to [localhost:8080](http://localhost:8080) to access your app in a web browser.
* If you are using the Nano [Windows Container](../../docker-for-windows/index.md)
  and have not updated to the Windows Creator Update there is a bug affecting how
  [Windows 10 talks to Containers via "NAT"](https://github.com/Microsoft/Virtualization-Documentation/issues/181#issuecomment-252671828)
  (Network Address Translation). You must hit the IP of the container
  directly. You can get the IP address of your container with the following
  steps:
  1.  Run `docker inspect -f "{% raw %}{{ .NetworkSettings.Networks.nat.IPAddress }}{% endraw %}" myapp`
  2.  Copy the container IP address and paste into your browser.
  (For example, `172.16.240.197`)
@y
* Go to [localhost:8080](http://localhost:8080) to access your app in a web browser.
* If you are using the Nano [Windows Container](../../docker-for-windows/index.md)
  and have not updated to the Windows Creator Update there is a bug affecting how
  [Windows 10 talks to Containers via "NAT"](https://github.com/Microsoft/Virtualization-Documentation/issues/181#issuecomment-252671828)
  (Network Address Translation). You must hit the IP of the container
  directly. You can get the IP address of your container with the following
  steps:
  1.  Run `docker inspect -f "{% raw %}{{ .NetworkSettings.Networks.nat.IPAddress }}{% endraw %}" myapp`
  2.  Copy the container IP address and paste into your browser.
  (For example, `172.16.240.197`)
@z

@x
## Further reading
@y
## Further reading
@z

@x
  - [ASP.NET Core](https://docs.microsoft.com/aspnet/core/)
  - [Microsoft ASP.NET Core on Docker Hub](https://hub.docker.com/r/microsoft/dotnet/)
  - [Building Docker Images for ASP.NET Core](https://docs.microsoft.com/aspnet/core/host-and-deploy/docker/building-net-docker-images)
  - [Docker Tools for Visual Studio](https://docs.microsoft.com/dotnet/articles/core/docker/visual-studio-tools-for-docker)
@y
  - [ASP.NET Core](https://docs.microsoft.com/aspnet/core/)
  - [Microsoft ASP.NET Core on Docker Hub](https://hub.docker.com/r/microsoft/dotnet/)
  - [Building Docker Images for ASP.NET Core](https://docs.microsoft.com/aspnet/core/host-and-deploy/docker/building-net-docker-images)
  - [Docker Tools for Visual Studio](https://docs.microsoft.com/dotnet/articles/core/docker/visual-studio-tools-for-docker)
@z
