

# scyllaDB run on 3 docker node 
quick start: `docker compose up`

look `.env` file for select which docker compose file start with `docker compose up & down`

## auto way generated from chat gpt 3.5  docker-compose-auto.yml
- all config 

## manual way: docker-compose-manual.yml
- docker build from `./manual.Dockerfile `
- start from `./init_sv.sh`


## error solving :  
- error: Could not setup Async I/O: Not enough request capacity in /proc/sys/fs/aio-max-nr.
 
- solving: On the docker host Open `/etc/sysctl.conf` file  and add lines below:
(on the wsl sub system where the docker is runing )
```
fs.aio-max-nr = 1048576
fs.file-max = 1048576
```
then: `docker restart`

## Ref links
- https://lindevs.com/install-scylladb-inside-docker-container-in-linux
- https://www.arothuis.nl/posts/running-cql-when-booting-a-scylla-container/
- https://github.com/QXIP/scylladb-docker/blob/master/entrypoint.sh

# MyNotes:
- all documentation run with `docker run --bla --blabla ...`  ok it's run & i can test it. but i want to create config for portability 
- docker compose file and all images build from .Dockerfile is good idea for portability and development.
- i try create a configuration in this repository.


## fresh start 
docker system prune --all --volumes