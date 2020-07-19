FROM alpine:3.10.1 AS donwloader

ARG version=0.17.0
ARG db=mongodb

WORKDIR /tmp
RUN apk add --no-cache wget
RUN wget -qO- https://github.com/brianfrankcooper/YCSB/releases/download/${version}/ycsb-${db}-binding-${version}.tar.gz | tar -xz -C .
RUN mv /tmp/ycsb-${db}-binding-${version} /ycsb

FROM ubuntu:18.04

WORKDIR /ycsb/
COPY --from=donwloader /ycsb /ycsb

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends python maven openjdk-8-jdk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV MONGO_URL=mongodb://localhost:27017/ycsb?w=0
VOLUME [ "/report" ]

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
