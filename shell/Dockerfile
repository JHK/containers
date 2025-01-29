FROM ubuntu:noble

RUN apt update && apt upgrade -qqy && apt -qqy --fix-missing install \
  # languages
  golang-go ruby ruby-bundler build-essential default-jdk-headless gradle rustup \
\
  # databases
  mysql-client postgresql-client redis-tools influxdb-client \
\
  # system tools
  # https://linux.die.net/man/1/ts
  git git-delta dumb-init htop nano command-not-found dnsutils ripgrep sudo ssh-client net-tools moreutils screen \
\
  # web stuff
  # https://httpie.org/
  # https://jqlang.github.io/jq/
  # https://github.com/mikefarah/yq
  curl httpie jq \
\
  # https://fishshell.com/
  fish fzf locales

RUN locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 && \
    dpkg-reconfigure -f noninteractive tzdata

ENV GOPATH=/go
ENV PATH=$GOPATH/bin:$PATH
RUN go install github.com/rakyll/hey@master && \
    rm -rf /root/.cache/go-build && \
    rm -rf /go/pkg

RUN rustup default stable && \
    cargo install oha && \
    cp /root/.cargo/bin/oha /usr/local/bin && \
    rm -rf /root/.cargo && \
    rm -rf /root/.rustup

ADD rootfs /
WORKDIR /root

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "/bin/fish" ]
