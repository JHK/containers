FROM ubuntu:noble

RUN apt update && apt upgrade -qqy && apt -qqy --fix-missing install \
  # languages
  golang-go ruby ruby-bundler build-essential default-jdk gradle \
\
  # databases
  mysql-client postgresql-client redis-tools influxdb-client \
\
  # system tools
  # https://linux.die.net/man/1/ts
  git dumb-init htop nano command-not-found dnsutils ripgrep sudo ssh-client net-tools moreutils \
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

# git delta: https://github.com/dandavison/delta
RUN curl -sLO https://github.com/dandavison/delta/releases/download/0.18.2/git-delta_0.18.2_amd64.deb && \
    dpkg -i git-delta_0.18.2_amd64.deb && \
    rm git-delta_0.18.2_amd64.deb

ENV GOPATH=/go
ENV PATH=$GOPATH/bin:$PATH
RUN go install github.com/rakyll/hey@latest

ADD rootfs /
WORKDIR /root

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "/bin/fish" ]
