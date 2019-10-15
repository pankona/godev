FROM golang:1.13.1

RUN apt-get -q update --fix-missing

RUN apt-get -y install rsync
RUN apt-get -y install zip

# For cross-compilation for windows with cgo
RUN apt-get -y install mingw-w64                            

RUN apt-get -y install bzip2

# golangci-lint
RUN curl -sfL https://install.goreleaser.com/github.com/golangci/golangci-lint.sh | sh -s -- -b $GOPATH/bin v1.20.0

# enable sticky bit on GOPATH to allow installing tools by go get
RUN chmod o+u -R /go
