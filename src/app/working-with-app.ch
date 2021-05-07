%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker App
description: Learn about Docker App
keywords: Docker App, applications, compose, orchestration
---
@y
---
title: Docker App
description: Docker App について
keywords: Docker App, applications, compose, orchestration
---
@z

@x
>This is an experimental feature.
>
>{% include experimental.md %}
@y
>これは試験的な（experimental）機能です。
>
>{% include experimental.md %}
@z

@x
## Overview
@y
{: #overview }
## 概要
@z

@x
Docker App is a CLI plug-in that introduces a top-level `docker app` command to bring 
the _container experience_ to applications. The following table compares Docker containers with Docker applications.
@y
Docker App は CLI プラグインの 1 つです。
トップレベルの`docker app`コマンドを導入し、アプリケーションに対して **コンテナー感覚の** 機能を提供します。
以下の表は、Docker コンテナーと Docker アプリケーションを比較したものです。
@z

@x
| Object        | Config file   | Build with         | Execute with          | Share with        |
| ------------- |---------------| -------------------|-----------------------|-------------------|
| Container     | Dockerfile    | docker image build | docker container run  | docker image push |
| App           | App Package   | docker app bundle  | docker app install    | docker app push   |
@y
| オブジェクト  | 設定ファイル     | ビルドコマンド     | 実行コマンド          | プッシュコマンド  |
| ------------- |------------------| -------------------|-----------------------|-------------------|
| コンテナー    | Dockerfile       | docker image build | docker container run  | docker image push |
| アプリ        | アプリパッケージ | docker app bundle  | docker app install    | docker app push   |
@z

@x
With Docker App, entire applications can now be managed as easily as images and containers. For example, 
Docker App lets you  _build_, _validate_ and _deploy_ applications with the `docker app` command. You can 
even leverage secure supply-chain features such as signed `push` and `pull` operations.
@y
Docker App を利用すると、イメージやコンテナーと同じ感覚で、簡単にアプリケーション全体を管理できるようになります。
たとえば Docker App では`docker app`コマンドによって、アプリケーションの **ビルド**、**検証**、**デプロイ** が可能になります。
さらに認証機能を含めた`push`や`pull`操作のような、セキュアなサプライチェーンを活用することができます。
@z

@x
> **NOTE**: `docker app` works with `Docker 19.03` or higher. 
@y
> **メモ**
>
> `docker app`は`Docker 19.03`またはそれ以降において動作します。
@z

@x
This guide walks you through two scenarios:
@y
以下のガイドでは 2 つのシナリオを進めていきます。
@z

@x
1. Initialize and deploy a new Docker App project from scratch.
1. Convert an existing Compose app into a Docker App project (added later in the beta process).
@y
1. Docker アプリケーションプロジェクトを初期化から始めてデプロイを行います。
1. 既存の Compose アプリを Docker アプリケーションプロジェクトに変換します。
   （added later in the beta process）
@z

@x
The first scenario describes basic components of a Docker App with tools and workflow.
@y
1 つめのシナリオは、ツールや作業の流れを通じて Docker App の基本的なコンポーネントを説明します。
@z

@x
## Initialize and deploy a new Docker App project from scratch
@y
{: #initialize-and-deploy-a-new-docker-app-project-from-scratch }
## Docker アプリプロジェクトの初期化からデプロイまで
@z

@x
This section describes the steps for creating a new Docker App project to familiarize you with the workflow and most important commands.
@y
この節では、新たに Docker アプリケーションプロジェクトを生成する手順を示し、作業の流れをつかむと同時に、最も重要なコマンドを示すものです。
@z

@x
1. Prerequisites
1. Initialize an empty new project
1. Populate the project
1. Validate the app
1. Deploy the app
1. Push the app to Docker Hub
1. Install the app directly from Docker Hub
@y
1. 前提条件
1. 新しい空のプロジェクトの初期化
1. プロジェクトの構築
1. アプリの検証
1. アプリのデプロイ
1. Docker Hub へのアプリのプル
1. Docker Hub からのアプリの直接インストール
@z

@x
### Prerequisites
@y
{: #prerequisites }
### 前提条件
@z

@x
You need at least one Docker node operating in Swarm mode. You also need the latest build of the Docker CLI 
with the App CLI plugin included.
@y
まずは Swarm モードで稼動する Docker ノードが、最低でも 1 つ必要です。
また Docker CLI の最新版と、そこに Docker App の CLI プラグインが含まれている必要があります。
@z

@x
Depending on your Linux distribution and your security context, you might need to prepend commands with `sudo`.
@y
利用する Linux ディストリビューションやセキュリティ方針の違いによっては、コマンドに`sudo`をつける必要があります。
@z

@x
### Initialize a new empty project
@y
{: #initialize-a-new-empty-project }
### 新たな空のプロジェクト生成
@z

@x
The `docker app init` command is used to initialize a new Docker application project. If you run it on 
its own, it initializes a new empty project. If you point it to an existing `docker-compose.yml` file, 
it initializes a new project based on the Compose file.
@y
`docker app init`コマンドは、新たに Docker アプリケーションプロジェクトを初期化する際に用います。
このコマンドを単純に実行した場合は、新たな空のプロジェクトを初期化します。
コマンド実行の際に既存の`docker-compose.yml`ファイルを指定した場合は、この Compose ファイルに基づくプロジェクトが新たに初期化されます。
@z

@x
Use the following command to initialize a new empty project called "hello-world".
@y
そこで以下のコマンドを実行して、「hello-world」という名前で空のプロジェクトを初期化します。
@z

@x
```
$ docker app init hello-world
Created "hello-world.dockerapp"
```
@y
```
$ docker app init hello-world
Created "hello-world.dockerapp"
```
@z

@x
The command produces a new directory containing three YAML files. The name of the directory is the name of the
project with `.dockerapp` appended, and the three YAML files are:
@y
このコマンド実行によって、新たなディレクトリとその中に 3 つの YAML ファイルが生成されます。
ディレクトリ名は、そのプロジェクト名に`.dockerapp`がつけられたものになります。
そして 3 つの YAML ファイルとは以下のものです。
@z

@x
- `docker-compose.yml`
- `metadata.yml`
- `parameters.yml`
@y
- `docker-compose.yml`
- `metadata.yml`
- `parameters.yml`
@z

@x
Inspect the YAML files with the following commands.
@y
YAML ファイルの内容を以下のコマンドにより確認します。
@z

@x
```
$ cd hello-world.dockerapp/

$ cat docker-compose.yml
version: "3.6"
services: {}

$ cat metadata.yml
version: 0.1.0
name: hello-world
description:

$ cat parameters.yml

```
@y
```
$ cd hello-world.dockerapp/

$ cat docker-compose.yml
version: "3.6"
services: {}

$ cat metadata.yml
version: 0.1.0
name: hello-world
description:

$ cat parameters.yml

```
@z

@x
Your files might be more verbose.
@y
生成された実際のファイルには、もっとたくさんの情報が含まれているかもしれません。
@z

@x
Let's quickly describe each file.
@y
各ファイルを簡単に説明します。
@z

@x
`docker-compose.yml` describes the application.
@y
`docker-compose.yml`はアプリケーションを記述しています。
@z

@x
`metadata.yml` specifies identification metadata such as name, version, description and maintainers. It accepts
key-value pairs.
@y
`metadata.yml`は、名前、バージョン、内容説明、保守担当者といった識別のためのメタデータ情報が示されます。
これらはキーバリューペアにより表現されます。
@z

@x
`parameters.yml` specifies default values for application parameters.
@y
`parameters.yml`は、アプリケーションパラメーターのデフォルト値を定めます。
@z

@x
### Populate the project
@y
{: #populate-the-project }
### プロジェクトの構築
@z

@x
This section describes editing the project YAML files so that it runs a simple web app.
@y
この節では、プロジェクトを定義する YAML ファイルの編集を行います。
これによって単純なウェブアプリを実行します。
@z

@x
Use your preferred editor to edit the `docker-compose.yml` YAML file and update it with 
the following information:
@y
好みのエディターを使って、YAML ファイル`docker-compose.yml`を編集します。
そして以下に示す情報に書き換えます。
@z

@x
```
version: "3.6"
services:
  hello:
    image: hashicorp/http-echo
    command: ["-text", "${hello.text}"]
    ports:
      - ${hello.port}:5678
```
@y
```
version: "3.6"
services:
  hello:
    image: hashicorp/http-echo
    command: ["-text", "${hello.text}"]
    ports:
      - ${hello.port}:5678
```
@z

@x
Update the `parameters.yml` file to the following:
@y
`parameters.yml`ファイルは以下のようにします。
@z

@x
```
hello:
  port: 8080
  text: Hello world!
```
@y
```
hello:
  port: 8080
  text: Hello world!
```
@z

@x
Save the changes.
@y
変更を保存します。
@z

@x
The application is updated to run a single-container application based on the `hashicorp/http-echo` web server image. 
This image has it execute a single command that displays some text and exposes itself on a network port.
@y
アプリケーションが更新されて、`hashicorp/http-echo`というウェブサーバーイメージに基づいた、単一コンテナーのアプリケーションが動くものになりました。
このイメージでは、文字列を表示するコマンドが一つあり、ネットワークポート上にイメージを公開しています。
@z

@x
Following best practices, the configuration of the application is decoupled from the application itself using variables. 
In this case, the text displayed by the app and the port on which it will be published are controlled by two variables defined in the `Parameters` section of the file.
@y
ベストプラクティスに従って、アプリケーションの設定は、変数を用いてアプリケーション本体からは切り離します。
この例では、アプリが出力する文字列、アプリが公開されるポートは、いずれも設定ファイル内の`Parameters`セクションにおいて 2 つの変数として定義され、これにより制御されます。
@z

@x
Docker App provides the `inspect` subcommand to provide a prettified summary of the application configuration. 
It is a quick way to check how to configure the application before deployment, without having to read 
the `Compose file`. It's important to note that the application is not running at this point, and that 
the `inspect` operation inspects the configuration file(s).
@y
Docker App にはサブコマンド`inspect`があり、アプリケーション設定についてわかりやすく概要を示してくれます。
デプロイを行う前に、アプリケーション設定の様子を確認する手軽な方法です。
わざわざ Compose ファイルを見る必要はありません。
この時点でアプリケーションは実行されていないわけですから、`inspect`コマンドは設定ファイルを見にいくものであるのがわかります。
@z

@x
```
$ docker app inspect hello-world.dockerapp
hello-world 0.1.0
@y
```
$ docker app inspect hello-world.dockerapp
hello-world 0.1.0
@z

@x
Service (1) Replicas Ports Image
----------- -------- ----- -----
hello       1        8080  hashicorp/http-echo
@y
Service (1) Replicas Ports Image
----------- -------- ----- -----
hello       1        8080  hashicorp/http-echo
@z

@x
Parameters (2) Value
-------------- -----
hello.port     8080
hello.text     Hello world!
```
@y
Parameters (2) Value
-------------- -----
hello.port     8080
hello.text     Hello world!
```
@z

@x
`docker app inspect` operations fail if the `Parameters` section doesn't specify a default value for 
every parameter expressed in the app section.
@y
アプリケーションの設定において用いられているパラメーターが、`Parameters`セクションにおいてデフォルト設定がされていない場合、`docker app inspect`コマンドは失敗します。
@z

@x
The application is ready to be validated and rendered.
@y
アプリケーションの検証と公開が可能な状態になりました。
@z

@x
### Validate the app
@y
{: #validate-the-app }
### アプリの検証
@z

@x
Docker App provides the `validate` subcommand to check syntax and other aspects of the configuration. 
If the app passes validation, the command returns no arguments.
@y
Docker App では、サブコマンド`validate`を提供しています。
これは設定ファイルに対して、文法や他の観点のチェックを行うものです。
アプリの検証に成功した場合は、コマンドは正常終了します。
@z

@x
```
$ docker app validate hello-world.dockerapp
Validated "hello-world.dockerapp"
```
@y
```
$ docker app validate hello-world.dockerapp
Validated "hello-world.dockerapp"
```
@z

@x
`docker app validate` operations fail if the `Parameters` section doesn't specify a default value for 
every parameter expressed in the app section.
@y
`docker app validate`コマンドは、アプリケーションセクションに記述されたパラメーターすべてに対して、`Parameters`セクションにおいてそのデフォルト値が定められていない場合に、エラー終了します。
@z

@x
As the `validate` operation has returned no problems, the app is ready to be deployed.
@y
`validate`操作に問題がなかったので、アプリケーションをデプロイする準備が整いました。
@z

@x
### Deploy the app
@y
{: #deploy-the-app }
### アプリのデプロイ
@z

@x
There are several options for deploying a Docker App project.
@y
Docker アプリケーションプロジェクトをデプロイするには、いくつかの方法があります。
@z

@x
- Deploy as a native Docker App application
- Deploy as a Compose app application
- Deploy as a Docker Stack application
@y
- ネイティブな Docker App アプリケーションとしてデプロイする。
- Compose App アプリケーションとしてデプロイする。
- Docker Stack アプリケーションとしてデプロイする。
@z

@x
All three options are discussed, starting with deploying as a native Docker App application.
@y
上の 3 つの方法について、以下に述べていきます。
まずはネイティブな Docker App アプリケーションとしてデプロイする方法からです。
@z

@x
#### Deploy as a native Docker App
@y
{: #deploy-as-a-native-docker-app }
#### ネイティブ Docker App アプリとしてのデプロイ
@z

@x
The process for deploying as a native Docker app is as follows:
@y
ネイティブな Docker アプリとしてデプロイするには、以下の手順を進めます。
@z

@x
Use `docker app install` to deploy the application.
@y
`docker app install`を実行してアプリケーションをデプロイします。
@z

@x
Use the following command to deploy (install) the application.
@y
以下のコマンドはアプリケーションをデプロイ（インストール）するものです。
@z

@x
```
$ docker app install hello-world.dockerapp --name my-app
Creating network my-app_default
Creating service my-app_hello
Application "my-app" installed on context "default"
```
@y
```
$ docker app install hello-world.dockerapp --name my-app
Creating network my-app_default
Creating service my-app_hello
Application "my-app" installed on context "default"
```
@z

@x
By default, `docker app` uses the [current context](/engine/context/working-with-contexts) to run the 
installation container and as a target context to deploy the application. You can override the second context 
using the flag `--target-context` or by using the environment variable `DOCKER_TARGET_CONTEXT`. This flag is also 
available for the commands `status`, `upgrade`, and `uninstall`.
@y
`docker app`はデフォルトでは、インストールするコンテナーに対しての [カレントなコンテキスト]({{site.baseurl}}/engine/context/working-with-contexts) を利用します。
これはアプリケーションをデプロイする際の対象コンテキストでもあります。
デプロイ対象とするコンテキストは、`--target-context`フラグを利用するか、あるいは環境変数`DOCKER_TARGET_CONTEXT`を利用することでオーバーライドできます。
そのフラグは`status`、`upgrade`、`uninstall`においても利用できます。
@z

@x
```
$ docker app install hello-world.dockerapp --name my-app --target-context=my-big-production-cluster
Creating network my-app_default
Creating service my-app_hello
Application "my-app" installed on context "my-big-production-cluster"
```
@y
```
$ docker app install hello-world.dockerapp --name my-app --target-context=my-big-production-cluster
Creating network my-app_default
Creating service my-app_hello
Application "my-app" installed on context "my-big-production-cluster"
```
@z

@x
> **Note**: Two applications deployed on the same target context cannot share the same name, but this is 
valid if they are deployed on different target contexts.
@y
> **メモ**: 2 つのアプリケーションをデプロイする際に、同一のデプロイ対象コンテキストを用いた場合、アプリケーション名を同一にすることはできません。
> ただし、別の対象コンテキストを使ってデプロイするのであれば、同一名であってもかまいません。
@z

@x
You can check the status of the app with the `docker app status <app-name>` command.
@y
アプリの状態を確認するには`docker app status <アプリ名>`コマンドを実行します。
@z

@x
```
$ docker app status my-app
INSTALLATION
------------
Name:         my-app
Created:      35 seconds
Modified:     31 seconds
Revision:     01DCMY7MWW67AY03B029QATXFF
Last Action:  install
Result:       SUCCESS
Orchestrator: swarm
@y
```
$ docker app status my-app
INSTALLATION
------------
Name:         my-app
Created:      35 seconds
Modified:     31 seconds
Revision:     01DCMY7MWW67AY03B029QATXFF
Last Action:  install
Result:       SUCCESS
Orchestrator: swarm
@z

@x
APPLICATION
-----------
Name:      hello-world
Version:   0.1.0
Reference:
@y
APPLICATION
-----------
Name:      hello-world
Version:   0.1.0
Reference:
@z

@x
PARAMETERS
----------
hello.port: 8080
hello.text: Hello, World!
@y
PARAMETERS
----------
hello.port: 8080
hello.text: Hello, World!
@z

@x
STATUS
------
ID              NAME            MODE          REPLICAS    IMAGE             PORTS
miqdk1v7j3zk    my-app_hello    replicated    1/1         hashicorp/http-echo:latest   *:8080->5678/tcp
```
@y
STATUS
------
ID              NAME            MODE          REPLICAS    IMAGE             PORTS
miqdk1v7j3zk    my-app_hello    replicated    1/1         hashicorp/http-echo:latest   *:8080->5678/tcp
```
@z

@x
The app is deployed using the stack orchestrator. This means you can also inspect it using the regular `docker stack` commands.
@y
アプリケーションはスタックオーケストレーターを使ってデプロイされます。
つまり通常の `docker stack`コマンドを使って確認ができるということです。
@z

@x
```
$ docker stack ls
NAME                SERVICES            ORCHESTRATOR
my-app              1                   Swarm
```
@y
```
$ docker stack ls
NAME                SERVICES            ORCHESTRATOR
my-app              1                   Swarm
```
@z

@x
Now that the app is running, you can point a web browser at the DNS name or public IP of the Docker node on 
port 8080 and see the app. You must ensure traffic to port 8080 is allowed on 
the connection from your browser to your Docker host.
@y
アプリケーションが実行されたので、ウェブブラウザー上から DNS 名を指定するか、Docker ノードの公開 IP アドレスを用いるかして、ポート 8080 にアクセスしてアプリを確認します。
ブラウザーから Docker ホストに向けての接続にあたっては、ポート 8080 を通じてのトラフィックしか許可されない点に注意してください。
@z

@x
Now change the port of the application using `docker app upgrade <app-name>` command.
@y
そこでアプリケーションのポートを変更してみます。
これには`docker app upgrade <アプリ名>`コマンドを使います。
@z

@x
```
$ docker app upgrade my-app --set hello.port=8181
Upgrading service my-app_hello
Application "my-app" upgraded on context "default"
```
@y
```
$ docker app upgrade my-app --set hello.port=8181
Upgrading service my-app_hello
Application "my-app" upgraded on context "default"
```
@z

@x
You can uninstall the app with `docker app uninstall my-app`.
@y
`docker app uninstall my-app`コマンドを実行すれば、アプリをアンインストールできます。
@z

@x
#### Deploy as a Docker Compose app
@y
{: #deploy-as-a-docker-compose-app }
#### Compose App アプリとしてのデプロイ
@z

@x
The process for deploying as a Compose app comprises two major steps:
@y
Compose アプリとしてデプロイするには、大きな以下の 2 つの手順を進めます。
@z

@x
1. Render the Docker app project as a `docker-compose.yml` file.
2. Deploy the app using `docker-compose up`.
@y
1. Docker アプリケーションプロジェクトから`docker-compose.yml`ファイルへの書き換え（render）を行います。
2. `docker-compose up`を実行してアプリをデプロイします。
@z

@x
You need a recent version of Docker Compose to complete these steps.
@y
この手順を進めるには、最新の Docker Compose が必要です。
@z

@x
Rendering is the process of reading the entire application configuration and outputting it as a single `docker-compose.yml` file. This creates a Compose file with hard-coded values wherever a parameter was specified as a variable.
@y
Compose ファイルへの書き換え（render）とは、アプリケーションの全設定を読み取って、単一の`docker-compose.yml`ファイルとして書き出す処理のことです。
これを行うと、それまでパラメーターが変数の形で設定されていたものが、Compose ファイル内にハードコーディングされることになります。
@z

@x
Use the following command to render the app to a Compose file called `docker-compose.yml` in the current directory.
@y
以下のコマンドを使って、アプリを書き換えた結果として、カレントディレクトリ内に`docker-compose.yml`という Compose ファイルを生成します。
@z

@x
```
$ docker app render --output docker-compose.yml hello-world.dockerapp
```
@y
```
$ docker app render --output docker-compose.yml hello-world.dockerapp
```
@z

@x
Check the contents of the resulting `docker-compose.yml` file.
@y
できあがった`docker-compose.yml`ファイルの中身を確認してみます。
@z

@x
```
$ cat docker-compose.yml
version: "3.6"
services:
  hello:
    command:
    - -text
    - Hello world!
    image: hashicorp/http-echo
    ports:
    - mode: ingress
      target: 5678
      published: 8080
      protocol: tcp
```
@y
```
$ cat docker-compose.yml
version: "3.6"
services:
  hello:
    command:
    - -text
    - Hello world!
    image: hashicorp/http-echo
    ports:
    - mode: ingress
      target: 5678
      published: 8080
      protocol: tcp
```
@z

@x
Notice that the file contains hard-coded values that were expanded based on the contents of the `Parameters` 
section of the project's YAML file. For example, `${hello.text}` has been expanded to "Hello world!".
@y
やはりこのファイルにはハードコーディングされた値が含まれることになりました。
これまでプロジェクト YAML ファイルの`Parameters`セクションに記述された内容が展開された結果です。
たとえば`${hello.text}`は「Hello world!」という文字列に展開されています。
@z

@x
> **Note**: Almost all the `docker app` commands propose the `--set key=value` flag to override a default parameter.
@y
> **メモ**
>
> たいていの`docker app`コマンドは`--set key=value`フラグを使って、デフォルトパラメーターをオーバーライドするようにしています。
@z

@x
Try to render the application with a different text:
@y
アプリケーションの書き換えにあたって、別の文字列を与えてみます。
@z

@x
```
$ docker app render hello-world.dockerapp --set hello.text="Hello whales!" 
version: "3.6"
services:
  hello:
    command:
    - -text
    - Hello whales!
    image: hashicorp/http-echo
    ports:
    - mode: ingress
      target: 5678
      published: 8080
      protocol: tcp
```
@y
```
$ docker app render hello-world.dockerapp --set hello.text="Hello whales!" 
version: "3.6"
services:
  hello:
    command:
    - -text
    - Hello whales!
    image: hashicorp/http-echo
    ports:
    - mode: ingress
      target: 5678
      published: 8080
      protocol: tcp
```
@z

@x
Use `docker-compose up` to deploy the app.
@y
アプリのデプロイには`docker-compose up`を実行します。
@z

@x
```
$ docker-compose up --detach
WARNING: The Docker Engine you're using is running in swarm mode.
<Snip>
```
@y
```
$ docker-compose up --detach
WARNING: The Docker Engine you're using is running in swarm mode.
<省略>
```
@z

@x
The application is now running as a Docker Compose app and should be reachable on port `8080` on your Docker host. 
You must ensure traffic to port `8080` is allowed on the connection form your browser to your Docker host.
@y
アプリケーションが Docker Compose アプリとして起動しました。
Docker ホストからはポート`8080`からアクセスできます。
ブラウザーから Docker ホストに向けての接続にあたっては、ポート`8080`を通じてのトラフィックしか許可されない点に注意してください。
@z

@x
You can use `docker-compose down` to stop and remove the application.
@y
`docker-compose down`コマンドを実行すれば、アプリを停止して削除することができます。
@z

@x
#### Deploy as a Docker Stack
@y
{: #deploy-as-a-docker-stack }
#### Docker Stack としてのデプロイ
@z

@x
Deploying the app as a Docker stack is a two-step process very similar to deploying it as a Docker Compose app.
@y
Docker Stack としてアプリをデプロイするには、Docker Compose アプリの場合に非常によく似た、二段階の手順を行います。
@z

@x
1. Render the Docker app project as a `docker-compose.yml` file.
2. Deploy the app using `docker stack deploy`.
@y
1. Docker アプリケーションプロジェクトから`docker-compose.yml`ファイルへの書き換え（render）を行います。
2. `docker stack deploy`を実行してアプリをデプロイします。
@z

@x
Complete the steps in the previous section to render the Docker app project as a Compose file and make sure 
you're ready to deploy it as a Docker Stack. Your Docker host must be in Swarm mode.
@y
前節において示した手順、つまり Docker アプリケーションプロジェクトを Compose ファイルとして書き換える（renderする）手順を行ってください。
そこまで行って、Docker Stack としてのデプロイを行う準備ができます。
なお Docker ホストは Swarm モードでなければなりません。
@z

@x
```
$ docker stack deploy hello-world-app -c docker-compose.yml
Creating network hello-world-app_default
Creating service hello-world-app_hello
```
@y
```
$ docker stack deploy hello-world-app -c docker-compose.yml
Creating network hello-world-app_default
Creating service hello-world-app_hello
```
@z

@x
The app is now deployed as a Docker stack and can be reached on port `8080` on your Docker host.
@y
アプリが Docker Stack としてデプロイできました。
Docker ホストからは、ポート`8080`によりアクセス可能です。
@z

@x
Use the `docker stack rm hello-world-app` command to stop and remove the stack. You must ensure traffic to 
port `8080` is allowed on the connection form your browser to your Docker host.
@y
`docker stack rm hello-world-app`コマンドを実行すれば、スタックを停止し削除することができます。
ブラウザーから Docker ホストに向けての接続にあたっては、ポート`8080`を通じてのトラフィックしか許可されない点に注意してください。
@z

@x
### Push the app to Docker Hub
@y
{: #push-the-app-to-docker-hub }
### Docker Hub へのアプリのプッシュ
@z

@x
As mentioned in the introduction, `docker app` lets you manage entire
applications the same way that you currently manage container images. For
example, you can push and pull entire applications from registries like Docker
Hub with `docker app push` and `docker app pull`. Other `docker app` commands,
such as `install`, `upgrade`, `inspect`, and `render` can be performed directly
on applications while they are stored in a registry.
@y
概要のところですでに述べたように、`docker app`を使うと、コンテナーイメージをこれまで管理してきたやり方と同じようにして、アプリケーション全体を管理することができます。
たとえば Docker Hub のようなレジストリに対して、`docker app push`や`docker app pull`を使って、アプリケーション全体をプッシュおよびプルすることができます。
その他の`docker app`コマンドとして、`install`、`upgrade`、`inspect`、`render`などは、アプリケーションがレジストリに保存されている状態で、直接コマンドを実行することができます。
@z

@x
Push the application to Docker Hub. To complete this step, you need a valid
Docker ID and you must be logged in to the registry to which you are pushing
the app.
@y
Docker Hub にアプリケーションをプッシュします。
この手順を実施するには、正規の Docker ID が必要であり、アプリをプッシュしようとしているレジストリにログインしている必要があります。
@z

@x
By default, all platform architectures are pushed to the registry. If you are
pushing an official Docker image as part of your app, you may find your app
bundle becomes large with all image architectures embedded. To just push the
architecture required, you can add the `--platform` flag.
@y
デフォルトでは、どのようなプラットフォームアーキテクチャーであっても、レジストリにプッシュすることができます。
アプリの一部として公式の Docker イメージをプッシュした場合、アプリにバンドルされるものが、埋め込まれているすべてのアーキテクチャーイメージによって、膨大なものになってしまうのがわかります。
必要となるアーキテクチャーのみをプッシュするには`--platform`フラグを用います。
@z

@x
```bash
$ docker login 
@y
```bash
$ docker login 
@z

@x
$ docker app push my-app --platform="linux/amd64" --tag <hub-id>/<repo>:0.1.0
```
@y
$ docker app push my-app --platform="linux/amd64" --tag <hub-id>/<repo>:0.1.0
```
@z

@x
### Install the app directly from Docker Hub
@y
{: #install-the-app-directly-from-docker-hub }
### Docker Hub からのアプリの直接インストール
@z

@x
Now that the app is pushed to the registry, try an `inspect` and `install` command against it. 
The location of your app is different from the one provided in the examples.
@y
アプリをレジストリにプッシュした状態に対して、`inspect`と`install`のコマンドを試してみます。
各自のアプリが保存されている場所は、本例のものとは異なるはずです。
@z

@x
```
$ docker app inspect myuser/hello-world:0.1.0
hello-world 0.1.0
@y
```
$ docker app inspect myuser/hello-world:0.1.0
hello-world 0.1.0
@z

@x
Service (1) Replicas Ports Image
----------- -------- ----- -----
hello       1        8080  myuser/hello-world@sha256:ba27d460cd1f22a1a4331bdf74f4fccbc025552357e8a3249c40ae216275de96
@y
Service (1) Replicas Ports Image
----------- -------- ----- -----
hello       1        8080  myuser/hello-world@sha256:ba27d460cd1f22a1a4331bdf74f4fccbc025552357e8a3249c40ae216275de96
@z

@x
Parameters (2) Value
-------------- -----
hello.port     8080
hello.text     Hello world!
```
@y
Parameters (2) Value
-------------- -----
hello.port     8080
hello.text     Hello world!
```
@z

@x
This action was performed directly against the app in the registry.
@y
上の処理は、レジストリ内にアプリに対して直接行われました。
@z

@x
Now install it as a native Docker App by referencing the app in the registry, with a different port.
@y
そこで今度は、レジストリにあるアプリをもとにして、ネイティブな Docker App としてインストールしてみます。
利用するポートは別のものにします。
@z

@x
```
$ docker app install myuser/hello-world:0.1.0 --set hello.port=8181
Creating network hello-world_default
Creating service hello-world_hello
Application "hello-world" installed on context "default"
```
@y
```
$ docker app install myuser/hello-world:0.1.0 --set hello.port=8181
Creating network hello-world_default
Creating service hello-world_hello
Application "hello-world" installed on context "default"
```
@z

@x
Test that the app is working.
@y
アプリが動作しているかどうかを確認してください。
@z

@x
The app used in these examples is a simple web server that displays the text "Hello world!" on port 8181, 
your app might be different.
@y
これまでの例に用いてきたアプリは単純なウェブサーバーであり、「Hello world!」という文字列を表示し、ポート 8181 を利用します。
各自のアプリは本例とは異なるかもしれません。
@z

@x
```
$ curl http://localhost:8181
Hello world!
```
@y
```
$ curl http://localhost:8181
Hello world!
```
@z

@x
Uninstall the app.
@y
最後はアプリをアンインストールします。
@z

@x
```
$ docker app uninstall hello-world
Removing service hello-world_hello
Removing network hello-world_default
Application "hello-world" uninstalled on context "default"
```
@y
```
$ docker app uninstall hello-world
Removing service hello-world_hello
Removing network hello-world_default
Application "hello-world" uninstalled on context "default"
```
@z

@x
You can see the name of your Docker App with the `docker stack ls` command.
@y
Docker App アプリ名は`docker stack ls`コマンドにより確認することができます。
@z
