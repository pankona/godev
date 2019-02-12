FROM golang:1.11.5

RUN apt-get -q update --fix-missing

RUN apt-get -y install rsync
RUN apt-get -y install zip

# For cross-compilation for windows with cgo
RUN apt-get -y install mingw-w64                            

# Install gometalinter
RUN curl -L https://git.io/vp6lP | sh                       

# Install reviewdog
RUN go get -u github.com/haya14busa/reviewdog/cmd/reviewdog 

# Install dep
RUN curl -L https://raw.githubusercontent.com/golang/dep/master/install.sh | sh 

# enable sticky bit on GOPATH to allow installing tools by go get
RUN chmod o+u -R /go

RUN apt-get -y install bzip2

# golangci-lint
RUN curl -sfL https://install.goreleaser.com/github.com/golangci/golangci-lint.sh | sh -s -- -b $GOPATH/bin v1.12
