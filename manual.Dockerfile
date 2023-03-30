FROM scylladb/scylla as scylldb

# RUN apt install net-tools htop nano 
# COPY ./app/sample.cql /app/sample.cql
COPY ./app/init_sv.sh /app/init_sv.sh
# COPY ./app/entrypoint.sh /app/entrypoint.sh
# COPY ./app/start_scylla.py /app/start_scylla.py

ENTRYPOINT ["/bin/bash","/app/init_sv.sh"]
# CMD ["--seeds=scy1,scy2,scy3"]
