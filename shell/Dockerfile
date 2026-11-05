FROM ubuntu:resolute

RUN apt update && apt upgrade -qqy && apt -qqy --fix-missing --no-install-recommends install \
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
  fish fzf locales

RUN install -dm 755 /etc/apt/keyrings && \
    curl -fsSL https://mise.jdx.dev/gpg-key.pub -o /etc/apt/keyrings/mise-archive-keyring.asc && \
    echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.asc] https://mise.jdx.dev/deb stable main" > /etc/apt/sources.list.d/mise.list && \
    apt update && apt -qqy --no-install-recommends install mise

RUN locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 && \
    dpkg-reconfigure -f noninteractive tzdata

ENV MISE_DATA_DIR=/usr/local/share/mise
ENV PATH=$MISE_DATA_DIR/shims:$PATH
COPY mise.toml /etc/mise/config.toml
RUN mise install && \
    rm -rf /root/.cache

ADD rootfs /
WORKDIR /root

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "/bin/fish" ]
