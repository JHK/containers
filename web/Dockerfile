FROM ubuntu:noble

RUN apt update \
  && apt -y install \
    dumb-init \
    wget \
    build-essential \
    libncurses5-dev \
    libpcre3-dev \
    libreadline-dev \
    libssl-dev \
    zlib1g-dev \
  && apt -q -y clean

ARG OPENRESTY_VERSION=1.25.3.2
RUN wget https://github.com/openresty/openresty/releases/download/v${OPENRESTY_VERSION}/openresty-${OPENRESTY_VERSION}.tar.gz \
  && tar xvfz openresty-${OPENRESTY_VERSION}.tar.gz \
  && cd openresty-${OPENRESTY_VERSION} \
  && ./configure --with-luajit --with-http_gzip_static_module  --with-http_ssl_module \
  && make -j4 \
  && make install \
  && rm -rf /openresty*

ADD entrypoint.sh /
ADD nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

EXPOSE 8080
ENTRYPOINT ["/usr/bin/dumb-init","--rewrite","15:3","--rewrite","2:3","--","/entrypoint.sh"]
