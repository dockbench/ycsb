#!/bin/bash

set -e

# async
# ./bin/ycsb load mongodb-async -s -P workloads/workloada -p mongodb.url=$MONGO_URL
# ./bin/ycsb run mongodb-async -s -P workloads/workloada

# sync
./bin/ycsb load mongodb -s -P workloads/workloada -p mongodb.url=$MONGO_URL
./bin/ycsb run mongodb -s -P workloads/workloada
