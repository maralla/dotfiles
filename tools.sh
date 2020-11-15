#!/usr/bin/env bash

set -euf -o pipefail

# Go tools

GOPATH=$HOME/Workspace/app
GO111MODULE="on"

echo Install gocode
go get -u github.com/stamblerre/gocode

echo Install goimports
go get golang.org/x/tools/cmd/goimports

echo Install golangci
go get github.com/golangci/golangci-lint/cmd/golangci-lint

echo Install gopls
go get golang.org/x/tools/cmd/gopls

echo Install guru
go get golang.org/x/tools/cmd/guru


# System tools

if ! command -v delta &> /dev/null
then
    echo Install delta for git
    brew install git-delta
fi

if ! command -v gpg &> /dev/null
then
    echo Install gnupg
    brew install gnupg
fi
