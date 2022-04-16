FROM debian:buster-slim AS build

RUN apt update && \
	apt install -y \
		libcrypto++ \
		libpcrecpp0v5 \
		libc-ares-dev \
		zlib1g-dev \
		libuv1 \
		libssl-dev \
		libsodium-dev \
		readline-common \
		sqlite3 \
		curl \
		autoconf \
		libtool \
		g++ \
		libcrypto++-dev \
		libz-dev \
		libsqlite3-dev \
		libssl-dev \
		libcurl4-gnutls-dev \
		libreadline-dev \
		libpcre++-dev \
		libsodium-dev \
		libc-ares-dev \
		libfreeimage-dev \
		libavcodec-dev \
		libavutil-dev \
		libavformat-dev \
		libswscale-dev \
		libmediainfo-dev \
		libzen-dev \
		make \
	&& \
	apt clean

RUN mkdir /build

WORKDIR /build

COPY . .

RUN sh autogen.sh && \
	./configure --disable-dependency-tracking && \
	make && \
	make install
