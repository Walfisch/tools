FROM alpine:latest

RUN apk update
RUN apk add --no-cache \
    bash \
    perl \
    python3 \
    ruby \

    # dig, host, nslookup, ...
    bind-tools \

    # awk, ftpget, ftpput, ping, telnet, tftp, traceroute, ...
    busybox-extras \

    mysql-client \
    postgresql-client \
    sqlite \

    unzip \
    zip \

    curl \
    wget

RUN python3 -m ensurepip
RUN pip3 install \
    jq \
    xq \
    yq

CMD ["/bin/bash"]
