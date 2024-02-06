FROM alpine:latest

RUN apk update
RUN apk add --no-cache \
    # "programming languages"
        bash \
        perl \
        python3 \
        ruby \
    # networking
        # dig, host, nslookup, ...
        bind-tools \
        dog \
        # http and more
        curl \
        lftp \
        openssh \
        rsync \
        wget \
    # database
        mysql-client \
        postgresql-client \
        sqlite \
    # archives
        unzip \
        zip \
    # misc
        # awk, ftpget, ftpput, ping, telnet, tftp, traceroute, ...
        busybox-extras \
        py3-pip \
        vim \
        wrk \
        jq \
        yq

RUN pip3 install --break-system-packages \
    awscli \
    xq

CMD ["/bin/bash"]
