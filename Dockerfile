FROM alpine:3.16.0

RUN apk add bash unzip

LABEL "com.github.actions.name"="CVEDB Execute"
LABEL "com.github.actions.description"="Execute Workflows on Trickest Platform"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="purple"

WORKDIR /tmp

RUN wget https://github.com/cvedb/cvedb-cli/releases/download/v1.1.2/cvedb-cli-1.1.2-linux-amd64.zip

# Unzip
RUN unzip cvedb-cli-1.1.2-linux-amd64.zip

RUN mv cvedb-cli-1.1.2-linux-amd64 trickest

# Make binary executable
RUN chmod +x cvedb

# Move binary to path
RUN mv cvedb /usr/bin/cvedb

WORKDIR /

COPY entrypoint.sh .

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
