FROM ubuntu:resolute

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -qqy --no-install-recommends install \
  # databases
  mysql-client postgresql-client redis-tools influxdb-client \
\
  # system tools
  # https://linux.die.net/man/1/ts
  git git-delta dumb-init htop nano command-not-found ripgrep sudo openssh-client moreutils screen \
\
  # networking
  bind9-dnsutils iproute2 tcpdump net-tools inetutils-traceroute inetutils-telnet inetutils-ping nmap \
\
  # web stuff
  # https://httpie.org/
  # https://jqlang.github.io/jq/
  ca-certificates curl httpie jq wget \
\
  # https://fishshell.com/
  fish fzf locales \
  && rm -rf /var/lib/apt/lists/*

ADD https://mise.jdx.dev/gpg-key.pub /etc/apt/keyrings/mise-archive-keyring.asc
RUN chmod 644 /etc/apt/keyrings/mise-archive-keyring.asc && \
    echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.asc] https://mise.jdx.dev/deb stable main" > /etc/apt/sources.list.d/mise.list && \
    apt-get update && apt-get -qqy --no-install-recommends install mise && \
    rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

ENV MISE_DATA_DIR=/usr/local/share/mise
ENV PATH=$MISE_DATA_DIR/shims:$PATH
COPY rootfs/etc/mise/config.toml /etc/mise/config.toml
RUN mise install && \
    rm -rf /root/.cache

COPY rootfs /
WORKDIR /root

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "/bin/fish" ]
