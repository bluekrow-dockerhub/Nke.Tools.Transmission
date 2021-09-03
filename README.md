# Nke.Tools.Transmission 

![GTHB Workflow Status](https://img.shields.io/github/workflow/status/bluekrow-dockerhub/Nke.Tools.Transmission/Auto-Versioning?label=Auto%20Version&logo=github&logoColor=gainsboro)
![DCKR Cloud Build Status](https://img.shields.io/docker/cloud/build/bluekrow/nke-tools-transmission?label=Auto%20Build&logo=docker&logoColor=gainsboro)
![GTHB Last Commit](https://img.shields.io/github/last-commit/bluekrow-dockerhub/Nke.Tools.Transmission?label=Last%20Commit&logo=github&logoColor=gainsboro)
![GTHB Latest Tag (by date)](https://img.shields.io/github/v/tag/bluekrow-dockerhub/Nke.Tools.Transmission?label=Latest%20Tag&logo=github&logoColor=gainsboro)

Customized [Transmission](https://transmissionbt.com/) image to execute on an [Alpine](https://alpinelinux.org) container  

## NOTICE: THIS IS A WORK IN PROGRESS
- Currently in Beta Level
- The container is usable as is, some manual pre config is required 
- Will add use of environment variables when using installer
- An initially empty volume named transmission-config is required for the container to work. Will add volume creation on install later, but for now it must be created manually.
- When all of these are tested, will change to 1.0 version

## Automation
### Auto Versioning
Using GitHub Actions, and a [VERSION](VERSION) file, for auto tagging, only when pushing commits to master.  
The current alternatives for VERSION file content are:
- Alpha.\<number>
- Beta.\<number>
- \<number>.\<number>
 
**Next Step**: would be auto semantic versioning
### Auto Build
Using DockerHub automatic builds, to build the following docker tags every time a tag is created on GitHub repository master branch:
- Latest
- \<major>
- \<major>.\<minor>
- \<major>.\<minor>.\<builtAtDay>.\<builtAtSecond>
### Auto Test 
Using DockerHub automatic testing with a System Under Test (SUT) service after every build and before every push to the DockerHub registry.

## User Guide
Following there are two options for running the container
Remember to replace the values in "<...>" delimiters for your own when using the examples provided (both in the inline example, and in the installer script) 

### Running once manually 
A common script  to run this container can be executed as follows
```
sudo docker run \
    -d \
    -p 9091:9091 \
    -p 57841:57841 \
    -e RPC_USERNAME=<WebUsername> \
    -e RPC_PASSWORD=<WebPassword> \
    -v <PathToConfig>:/trx/Config \
    -v <PathToDownloads>:/trx/Downloads \
    -v <PathToIncomplete>:/trx/Incomplete \
    -v <PathToWatchDir>:/trx/WatchDir \
    --name transmission \
    bluekrow/nke-tools-transmission trx   
```
Internally, the container will use a predefined settings file for transmission ([settings.json](Dockerfile.Scripts/110.settings.json))

We can use _-it_ flags if we want to see/interact with the containers console

### Running as a service 
- First of all, get the latest installer:
  ```
  $ curl -L https://github.com/bluekrow-dockerhub/Nke.Tools.Transmission/releases/latest/download/trx-installer.zip > trx-installer.zip
  $ unzip trx-installer.zip
  ```
- Then modify [transmission-start.sh](/Install/transmission-start.sh) replacing values in "<...>" with your own values
- Finally run installer
  ```
  sudo ./install.sh
  ```

## Troubleshooting
### 1. Permissions error when executing SUTs on Dockerhub
  ```
  ERROR: for buiwe9sh63hwrcjhglrerqm_sut_1 Cannot start service sut: OCI runtime create failed: container_linux.go:349: starting container process caused "exec: \"/entrypoint.sh\": permission denied": unknown  

  ERROR: for sut Cannot start service sut: OCI runtime create failed: container_linux.go:349: starting container process caused "exec: \"/entrypoint.sh\": permission denied": unknown

  Encountered errors while bringing up the project.

  starting "sut" service in dockerhub.test.yml (1)
  ```
  **Solution**  
The `entrypoint.sh` and other files executed inside the container, should be made executable
```
git update-index --chmod=+x entrypoint.sh
```

### 2.Transmission RPC Web error 403: Forbidden
- Must add docker container network to whitelist. By default the docker container network is: `172.17.0.0`. This can be added on `settings.json` like this:
  ```
  "rpc-whitelist": "127.0.0.1,172.17.*.*",
  ```
  Or this:
  ```
  transmission-daemon -a "127.0.0.1,172.17.*.*"
  ```

### 3. Transmission RPC Web Error 409 Conflict
An error is shown with the following content:
```
409:Conlfict
Your request had an invalid session-id header.
To fix this, follow these steps:
  1. When reading a response, get its X-Transmission-Session-Id header and remember it
  2. Add the updated header to your outgoing requests
  3. When you get this 409 error message, resend your request with the updated header
This requirement has been added to help prevent CSRF attacks.
X-Transmission-Session-Id: <session-id-token>
```
**Solution**
- Some internet will suggest reocompile trasmission binaries. There is no need of that, simply take into account that the default url for transmission is:
  ```
  http://localhost:9091/trasnmission/web/
  ``` 
  and **must** include the trailing slash after the _web_ part