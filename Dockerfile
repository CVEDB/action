FROM --platform=linux/amd64 golang:1.19-alpine as build

RUN go install github.com/cvedb/cvedb-cli@latest


FROM alpine:3.16.0

RUN apk add bash curl jq

LABEL "com.github.actions.name"="CVEDB Execute"
LABEL "com.github.actions.description"="Execute Workflows on CVEDB Platform"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="purple"

COPY --from=build /go/bin/cvedb-cli /usr/bin/cvedb

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
