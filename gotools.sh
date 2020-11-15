#!/bin/sh

GOPATH=$HOME/Workspace/app

echo Install gocode
go get -u github.com/stamblerre/gocode

export GO111MODULE="on"

echo Install goimports
go get golang.org/x/tools/cmd/goimports

echo Install golangci
go get github.com/golangci/golangci-lint/cmd/golangci-lint

echo Install gopls
go get golang.org/x/tools/cmd/gopls

echo Install guru
go get golang.org/x/tools/cmd/guru
