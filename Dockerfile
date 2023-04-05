FROM alpine:3.16.0

RUN apk add bash unzip

LABEL "com.github.actions.name"="Trickest Execute"
LABEL "com.github.actions.description"="Execute Workflows on Trickest Platform"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="purple"

WORKDIR /tmp

RUN wget https://github.com/trickest/trickest-cli/releases/download/v1.1.2/trickest-cli-1.1.2-linux-amd64.zip

# Unzip
RUN unzip trickest-cli-1.1.2-linux-amd64.zip

RUN mv trickest-cli-1.1.2-linux-amd64 cvedb

# Make binary executable
RUN chmod +x cvedb

# Move binary to path
RUN mv cvedb /usr/bin/cvedb

WORKDIR /

COPY entrypoint.sh .

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
