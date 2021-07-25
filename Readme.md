# Notes
* add share folder into `.dockerignore`
* impossible specify host folder to share with container into the `Dockerfile`:
    * docker specification for security reasons
    * workaround indicate share folder when star the container, created bash file `start.sh`
