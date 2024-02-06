#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

## tag (and push tagged version to github.com and hub.docker.com)
##
## -h            print this help
## -v <version>  specify current version
##               (default: increment patch version of file VERSION)

cd "${0%/*}"

usage() {
    grep '^##' "$0" | cut -c4- > /dev/stderr
}

version="$(awk '{
    split($0, v, ".")
    printf("%s.%s.%s", v[1], v[2], v[3] + 1)
}' < VERSION)"
while getopts hv: opt; do
    case "${opt}" in
        v) version="${OPTARG}" ;;
        h) usage; exit 0 ;;
        \?) usage; exit 1 ;;
    esac
done

printf -- '%s' "$version" > VERSION

git add VERSION
git commit -m "Bump version to $version" || :

git tag -f "$version"
git tag -f latest

docker build -t hcwalfisch/tools:"$version" -t hcwalfisch/tools:latest .
docker push hcwalfisch/tools:"$version"
docker push hcwalfisch/tools:latest

git push -f --tags
git push
