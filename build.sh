#!/usr/bin/env bash

set -ex

export GOFLAGS="-buildvcs=false"
go mod download

go install github.com/onsi/ginkgo/ginkgo
go install github.com/onsi/gomega
ginkgo -r .

mkdir -p tmp/build

go build -o tmp/build/in in/main.go
go build -o tmp/build/check check/check.go
