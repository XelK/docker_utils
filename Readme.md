# Notes
* add share folder into `.dockerignore`
* impossible specify host folder to share with container into the `Dockerfile`:
    * docker specification for security reasons
    * workaround indicate share folder when star the container, created bash file `start.sh`
* need to install `coreutils` for prevent this error : `BusyBox v1.33.1 () multi-call binary.` (https://github.com/vishnubob/wait-for-it/issues/71)
* for correct checksum: need to add another empty space into `echo "$(<kubectl.sha256) kubectl" | sha256sum --check` as per (https://github.com/gliderlabs/docker-alpine/issues/174)