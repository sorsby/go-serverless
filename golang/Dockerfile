FROM golang:1.13-stretch

# Install unzip and Python build tools to be able to install the AWS CLI tools.
RUN apt-get update -y && \
    apt-get install -y zip unzip tar python-dev curl make git openssh-client

# Setup SSH host verification for github.com (required for go get).
RUN mkdir -p ~/.ssh/ && \
    ssh-keygen -F github.com || ssh-keyscan github.com >>~/.ssh/known_hosts

# Install Node
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs

# Install AWS CLI tools.
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

ENV TZ=Europe/London
ENV NODE_ENV=dev
ENV AWS_DEFAULT_REGION=eu-west-2

# Install common tools for testing, linting and deploying.
RUN go get github.com/mgechev/revive
RUN go get gotest.tools/gotestsum
RUN npm install -g serverless@1.57.0
