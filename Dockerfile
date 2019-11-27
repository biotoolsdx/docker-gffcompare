FROM ubuntu:16.04
MAINTAINER CHEN, Yuelong <yuelong.chen.btr@gmail.com>

RUN apt-get update && apt-get install -y build-essential cmake git && \
    mkdir -p /opt/

WORKDIR /opt/
RUN git clone https://github.com/gpertea/gclib \
    && git clone https://github.com/gpertea/gffcompare \
    && git clone https://github.com/gpertea/gffread \
    && cd gffcompare \
    && make release \
    && cd /opt/gffread \
    && make release

ENV PATH "/opt/gffcompare:/opt/gffread:$PATH"

CMD bash