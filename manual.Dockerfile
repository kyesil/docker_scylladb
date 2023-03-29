# FROM ubuntu:devel as scylldb
FROM scylladb/scylla as scylldb


COPY ./link/sample.cql /sample.cql
COPY ./link/init_sv.sh /init_sv.sh
COPY ./link/entrypoint.sh /entrypoint.sh
COPY ./link/start_scylla.py /start_scylla.py

ENTRYPOINT ["/bin/bash","/init_sv.sh"]
# CMD ["/bin/bash","/init_sv.sh"]
# CMD ["--seeds=scy1,scy2,scy3"]
# /usr/bin/scylla --log-to-syslog 0 --log-to-stdout 1 --default-log-level info --network-stack posix --developer-mode=1 --overprovisioned --listen-address 172.24.0.2 --rpc-address 172.24.0.2 --seed-provider-parameters seeds=scy1 --alternator-address 172.24.0.2 --blocked-reactor-notify-ms 999999999

# /usr/bin/scylla --log-to-syslog 0 --log-to-stdout 1 --default-log-level info --network-stack posix --developer-mode=1 --overprovisioned --listen-address 172.26.0.3 --rpc-address 172.26.0.3 --seed-provider-parameters seeds=172.26.0.3 --alternator-address 172.26.0.3 --blocked-reactor-notify-ms 999999999