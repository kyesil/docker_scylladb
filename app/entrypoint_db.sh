#!/bin/bash
keyspace="sample"
echo "entrypoint point starting"

while true; do
  cqlsh -f "/app/$keyspace.cql" &>/dev/null
  if [ $? -eq 0 ]; then
    echo "imported cql"
    break
  else
    echo "err cql waiting"
  fi
  sleep 10
done

while true; do
  cqlsh -e "USE $keyspace;" &>/dev/null
  if [ $? -eq 0 ]; then
    echo "heartbeat ok"
  else
    echo "err keyspace accses "
  fi
  sleep 10
done
