

# scyllaDB run on 3 docker node 
quick start: `docker compose up` it's take time for ready nodes.  hot start: 2 minutes 
you will see ready nodes on console  : `scy1  | heartbeat ok`

look `.env` file for select which docker compose file start with `docker compose up & down`

## TEST 
- attach shell one of them run : 
` cqlsh -e "USE sample; SELECT * FROM users;" `

## auto way generated from chat gpt 3.5  docker-compose-auto.yml
- all config  in yml file.

## manual way: docker-compose-manual.yml lifecycle
- docker build from `./manual.Dockerfile `
- start from `/app/init_sv.sh`
- after start `entrypoint_db.sh` in background and start `start_scylla.py` 
- `start_scylla.py` run `supervisord`  
- after ready all nodes  `entrypoint_db.sh` import `sample.sql`



## error solving :  
- error: Could not setup Async I/O: Not enough request capacity in /proc/sys/fs/aio-max-nr.
 
- solving: On the docker host Open `/etc/sysctl.conf` file  and add lines below:
(on the wsl sub system where the docker is runing )
```
fs.aio-max-nr = 1048576
fs.file-max = 1048576
```
then apply settings with: `sysctl -p`

or temporary fixes : `run echo "1048576" > /proc/sys/fs/aio-max-nr`

## Ref links
- https://lindevs.com/install-scylladb-inside-docker-container-in-linux
- https://www.arothuis.nl/posts/running-cql-when-booting-a-scylla-container/
- https://github.com/QXIP/scylladb-docker/blob/master/entrypoint.sh
- https://medium.com/@rana.ash1997/all-about-scylla-7429ee12ebb8

# MyNotes:
- all documentation run with `docker run --bla --blabla ...`  ok it's run & i can test it. but i want to create config for portability 
- docker compose file and all images build from .Dockerfile is good idea for portability and development.
- i try create a configuration in this repository.


## fresh start 
docker system prune --all --volumes