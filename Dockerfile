FROM alpine:3.16.0

RUN apk add bash unzip

LABEL "com.github.actions.name"="CVEDB Execute"
LABEL "com.github.actions.description"="Execute Workflows on CVEDB Platform"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="purple"

WORKDIR /tmp

RUN wget 
https://github.com/trickest/trickest-cli/releases/download/v1.1.7/trickest-cli-1.1.7-linux-amd.zip
# Unzip
RUN unzip trickest-cli-1.1.7-linux-amd.zip

RUN mv trickest-cli-1.1.7-linux-amd cvedb

# Make binary executable
RUN chmod +x cvedb

# Move binary to path
RUN mv cvedb /usr/bin/cvedb

WORKDIR /

COPY entrypoint.sh .

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
