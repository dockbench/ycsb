#!/bin/bash

# YCSBの概要とCassandraへのベンチマーク
# https://qiita.com/noralife/items/35a956f682b1aca475f6

for workload in workloada workloadb workloadc workloadd workloade workloadf
do
    ./bin/ycsb load mongodb -s -P workloads/$workload -p mongodb.url=$MONGO_URL > /report/load-$workload.log
    ./bin/ycsb run mongodb -s -P workloads/$workload -p mongodb.url=$MONGO_URL > /report/run-$workload.log
done
