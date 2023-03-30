## only test not use in app
FROM ubuntu:devel as scylldb


RUN apt-get update && apt-get -y install gpg wget
RUN gpg --homedir /tmp --no-default-keyring --keyring /etc/apt/keyrings/scylladb.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys d0a112e067426ab2
RUN wget -O /etc/apt/sources.list.d/scylla.list http://downloads.scylladb.com/unstable/scylla/master/deb/unified/latest/scylladb-master/scylla.list
RUN wget -O /etc/apt/sources.list.d/scylla-manager.list http://downloads.scylladb.com/deb/ubuntu/scylladb-manager-3.1.list
RUN apt-get update
RUN apt-get install -y scylla openjdk-8-jre-headless  scylla-manager-server scylla-manager-client
RUN update-java-alternatives --jre-headless -s java-1.8.0-openjdk-amd64
RUN apt autoremove && apt autoclean && apt clean && rm -rf /var/lib/apt/lists/*

#

COPY ./link/sample.cql /sample.cql
COPY ./link/init_sv.sh /init_sv.sh
COPY ./link/entrypoint.sh /entrypoint.sh
# COPY ./link/scylla.yaml /etc/scylla/scylla.yaml
ENTRYPOINT ["/bin/bash","/init_sv.sh"]
# CMD ["/bin/bash","/init_sv.sh"]
# CMD ["--seeds=scy1"]
# /usr/bin/scylla --log-to-syslog 0 --log-to-stdout 1 --default-log-level info --network-stack posix --developer-mode=1 --overprovisioned --listen-address 172.24.0.2 --rpc-address 172.24.0.2 --seed-provider-parameters seeds=scy1 --alternator-address 172.24.0.2 --blocked-reactor-notify-ms 999999999

# /usr/bin/scylla --log-to-syslog 0 --log-to-stdout 1 --default-log-level info --network-stack posix --developer-mode=1 --overprovisioned --listen-address 172.26.0.3 --rpc-address 172.26.0.3 --seed-provider-parameters seeds=172.26.0.3 --alternator-address 172.26.0.3 --blocked-reactor-notify-ms 999999999