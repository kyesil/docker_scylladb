#!/bin/bash
SCYLLA_SEEDS=scy1,scy2,scy3
SCYLLA_LISTEN_ADDRESS=auto
SCYLLA_RPC_ADDRESS=0.0.0.0
SCYLLA_BROADCAST_ADDRESS=eth0
SCYLLA_BROADCAST_RPC_ADDRESS=eth0



if [[ "$HOSTNAME" == "scy1" ]]; then
  echo "leader ..."
else
  echo "follower.."
  # sleep 18
fi

(/entrypoint.sh) & echo "$!" >/entrypoint.pid
python3 /start_scylla.py 

# /usr/bin/supervisord  -c /etc/supervisord.conf
# start entrypoint background
# /usr/lib/scylla/jmx/scylla-jmx -l /usr/lib/scylla/jmx&
# scylla --options-file /etc/scylla/scylla.yaml --io-properties-file /etc/scylla.d/io.conf --developer-mode=1 --listen-address $SCYLLA_LISTEN_ADDRESS --rpc-address $SCYLLA_RPC_ADDRESS --seed-provider-parameters seeds=$SCYLLA_SEEDS --alternator-address $HOSTNAME  --log-to-syslog 0 --log-to-stdout 1 --default-log-level info --network-stack posix --overprovisioned --blocked-reactor-notify-ms 999999999

# scylla --options-file /etc/scylla/scylla.yaml   --seed-provider-parameters seeds=$SCYLLA_SEEDS
# --developer-mode=1 # wait scylla

# ENV PATH=/opt/scylladb/python3/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# /usr/bin/supervisord  -c /etc/supervisord.conf&
#
# execsudo /usr/bin/env SCYLLA_HOME=$SCYLLA_HOME SCYLLA_CONF=$SCYLLA_CONF "$bindir"/scylla $SCYLLA_ARGS $SEASTAR_IO $DEV_MODE $CPUSET $SCYLLA_DOCKER_ARGS

# scylla --options-file /etc/scylla/scylla.yaml --listen-address $HOSTNAME --rpc-address $HOSTNAME --seed-provider-parameters seeds=scy1 --alternator-address $HOSTNAME --log-to-syslog 0 --log-to-stdout 1 --default-log-level info --network-stack posix --developer-mode=1 --overprovisioned --blocked-reactor-notify-ms 999999999

##/usr/bin/scylla --log-to-syslog 0 --log-to-stdout 1 --default-log-level info --network-stack posix --developer-mode=1 --overprovisioned --listen-address 172.20.0.4 --rpc-address 172.20.0.4 --seed-provider-parameters seeds=scy1,scy2,scy3 --alternator-address 172.20.0.4 --blocked-reactor-notify-ms 999999999
##/usr/bin/scylla --log-to-syslog 0 --log-to-stdout 1 --default-log-level info --network-stack posix --developer-mode=1 --overprovisioned --listen-address 172.27.0.2 --rpc-address 172.27.0.2 --seed-provider-parameters seeds=172.27.0.2 --alternator-address 172.27.0.2 --blocked-reactor-notify-ms 999999999 --seed-provider-parameters seeds=scy1,scy2,scy3
# while true; do
# echo "$HOSTNAME leader starting.."
# echo "leader failed start $? wait..."
# done
# exec "$scylladir"/jmx/scylla-jmx $SCYLLA_JMX_PORT $SCYLLA_API_PORT $SCYLLA_API_ADDR $SCYLLA_JMX_ADDR $SCYLLA_JMX_FILE $SCYLLA_JMX_LOCAL $SCYLLA_JMX_REMOTE $SCYLLA_JMX_DEBUG
# ned: 'rsyslog' with pid 28
# 2023-03-29 11:15:07,394 INFO spawnerr: command at '/opt/scylladb/supervisor/scylla-server.sh' is not executable
# 2023-03-29 11:15:07,394 INFO spawned: 'scylla-housekeeping' with pid 29
# 2023-03-29 11:15:07,395 INFO spawned: 'scylla-jmx' with pid 30
# 2023-03-29 11:15:07,397 INFO spawned: 'scylla-node-exporter' with pid 31
# 2023-03-29 11:15:07,398 INFO spawned: 'sshd' with pid 35