FROM alpine:latest

RUN apk update
RUN apk add --no-cache \
    bash \
    bind-tools \
    busybox-extras \
    curl \
    mysql-client \
    perl \
    postgresql-client \
    python3 \
    ruby \
    wget

RUN python3 -m ensurepip
RUN pip3 install \
    jq \
    xq \
    yq

CMD ["/bin/bash"]
