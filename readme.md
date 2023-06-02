# tools

To test connections and outputs.

## run

    docker build -t tools . && docker run -it --rm tools

## tag & push

    git tag 1.0.0 && docker build -t hcwalfisch/tools:1.0.0 . && docker push hcwalfisch/tools:1.0.0
    git push --tags

## latest is special, let's force

    git tag -f latest && docker build -t hcwalfisch/tools:latest . && docker push hcwalfisch/tools:latest
    git push --tags -f

## I solemnly swear that I am up to no good

    kubectl -n $NAMESPACE run -it --tty --rm debug --image=hcwalfisch/tools:latest --restart=Never -- bash
