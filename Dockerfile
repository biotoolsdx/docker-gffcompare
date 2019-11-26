FROM ubuntu:16.04
MAINTAINER CHEN, Yuelong <yuelong.chen.btr@gmail.com>

RUN apt-get update && apt-get install -y build-essential cmake git && \
    mkdir -p /opt/

WORKDIR /opt/
RUN git clone https://github.com/gpertea/gclib \
&&  git clone https://github.com/gpertea/gffcompare \
&&  cd gffcompare \
&& make release

ENV PATH "/opt/gffcompare:$PATH"

CMD bash