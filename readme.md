# tools

To test connections and outputs.  
Anywhere. Even ad hoc in a k8s cluster.
https://hub.docker.com/repository/docker/hcwalfisch/tools

## run

    docker build -t tools . && docker run -it --rm tools

## tag & push

    docker login docker.io # just once or so
    ./tag

## I solemnly swear that I am up to no good

    kubectl -n default run -it --tty --rm debug-delete-me --image=hcwalfisch/tools:latest --restart=Never -- bash

Add a pod to your cluster, so that you can test the in cluster network
(or whatever). The pod *should* be auto-removed when finished.
