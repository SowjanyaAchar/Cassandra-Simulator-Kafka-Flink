#!/bin/sh

find_cassandra_pods="kubectl get pods -l name=cassandra"

first_running_seed=$($find_cassandra_pods --no-headers | \
    grep Running | \
    grep 1/1 | \
    head -1 | \
    awk '{print $1}')

kubectl cp schema1.cql $first_running_seed:/home/



kubectl exec -it $first_running_seed -- bash -c "cqlsh -e \"SOURCE '/home/schema1.cql'"\"
