#!/bin/sh

GOPATH=$HOME/Workspace/app

echo Install gocode
go get -u github.com/stamblerre/gocode

echo Install goimports
go get -u golang.org/x/tools/cmd/goimports

echo Install golangci
go get -u github.com/golangci/golangci-lint/cmd/golangci-lint

echo Install gopls
go get -u golang.org/x/tools/cmd/gopls

echo Install guru
go get -u golang.org/x/tools/cmd/guru
