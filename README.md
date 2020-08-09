# Nke.Tools.Transmission

![GTHB Workflow Status](https://img.shields.io/github/workflow/status/bluekrow-dockerhub/nke.tools.transmission/Auto-Versioning?label=Auto%20Version&logo=github&logoColor=gainsboro)
![DCKR Cloud Build Status](https://img.shields.io/docker/cloud/build/bluekrow/nke-tools-transmission?label=Auto%20Build&logo=docker&logoColor=gainsboro)
![GTHB Last Commit](https://img.shields.io/github/last-commit/bluekrow-dockerhub/nke.tools.transmission?label=Last%20Commit&logo=github&logoColor=gainsboro)
![GTHB Latest Tag (by date)](https://img.shields.io/github/v/tag/bluekrow-dockerhub/nke.tools.transmission?label=Latest%20Tag&logo=github&logoColor=gainsboro)

Customized [Transmission][tx-web] image to execute on an [Alpine][alpine-web] container
[tx-web]: https://transmissionbt.com/
[alpine-web]: https://alpinelinux.org/

## Automation
### Auto Versioning
Using GitHub Actions, and a [VERSION](VERSION) file, for auto tagging, only when pushing commits to master.  
**Next Step**: would be auto semantic versioning.
### Auto Build
Using DockerHub automatic builds, to build the following **identical** docker tags when a tag is created on GitHub repository master branch:
- Latest
- \<major>
- \<major>.\<minor>
- \<major>.\<minor>.\<builtAtDay>.\<builtAtSecond>
### Auto Test 
Using DockerHub automatic testing with a System Under Test (SUT) service after every build and before every push to the DockerHub registry.

## User Guide
\<To be included>

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
