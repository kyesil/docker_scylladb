#!/bin/bash
echo "entrypoint point starting"

while true; do
  cqlsh -f "/sample.cql"
  if [ $? -eq 0 ]; then
    echo "imported cql"

    while true; do
      echo "heard bet"
      sleep 10
    done

  else
    echo "err  cql waiting"
  fi
  sleep 10
done
