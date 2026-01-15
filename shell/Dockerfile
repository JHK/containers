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
  git git-delta dumb-init htop nano command-not-found ripgrep sudo ssh-client moreutils screen \
\
  # networking
  dnsutils iproute2 tcpdump net-tools inetutils-traceroute inetutils-telnet inetutils-ping nmap \
\
  # web stuff
  # https://httpie.org/
  # https://jqlang.github.io/jq/
  # https://github.com/mikefarah/yq
  curl httpie jq wget \
\
  # https://fishshell.com/
  fish fzf locales

RUN wget https://github.com/fullstorydev/grpcurl/releases/download/v1.9.3/grpcurl_1.9.3_linux_amd64.deb && \
    dpkg -i grpcurl_1.9.3_linux_amd64.deb && \
    rm grpcurl_1.9.3_linux_amd64.deb

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
