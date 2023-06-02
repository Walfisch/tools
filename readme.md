# tools

To test connections and outputs.  
https://hub.docker.com/repository/docker/hcwalfisch/tools

## run

    docker build -t tools . && docker run -it --rm tools

## tag & push

    docker login docker.io # just once or so
    ./tag

## I solemnly swear that I am up to no good

    kubectl -n $NAMESPACE run -it --tty --rm debug --image=hcwalfisch/tools:latest --restart=Never -- bash
