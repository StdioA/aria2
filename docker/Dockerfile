FROM ubuntu AS build-stage
RUN apt-get update && apt-get install -yy ca-certificates
COPY docker/sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -yy libssh2-1 libgnutls28-dev nettle-dev \
        libgmp-dev libssh2-1-dev libc-ares-dev libxml2-dev \
        zlib1g-dev libsqlite3-dev pkg-config \
        make binutils autoconf automake autotools-dev libtool \
        pkg-config curl dpkg-dev gcc-mingw-w64 g++-mingw-w64 \
        autopoint libcppunit-dev libxml2-dev libgcrypt11-dev lzip
COPY . /aria2
WORKDIR /aria2
RUN bash /aria2/build.sh

FROM ubuntu
RUN apt-get update && apt-get install -yy ca-certificates
COPY docker/sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -yy aria2 libssh2-1 && rm -rf /var/lib/apt/dists/*
COPY --from=build-stage /aria2/src/aria2c /usr/bin
EXPOSE 6800
ENTRYPOINT ["/usr/bin/aria2c"]
