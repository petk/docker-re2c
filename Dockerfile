FROM alpine

ENV RE2C_VERSION 1.0.3

RUN apk add --no-cache wget ca-certificates gcc g++ make \
    && mkdir -p /opt \
    && cd /opt \
    && wget https://github.com/skvadrik/re2c/releases/download/1.0.3/re2c-$RE2C_VERSION.tar.gz \
    && tar -xvf re2c-$RE2C_VERSION.tar.gz \
    && cd re2c-$RE2C_VERSION \
    && ./configure \
    && make -j$(nproc) \
    && make install \
    && cd /opt \
    && rm re2c-$RE2C_VERSION.tar.gz \
    && rm -rf re2c-$RE2C_VERSION

WORKDIR /opt
