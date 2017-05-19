#!/usr/bin/env bash
cat "${1}" | \
  jq '[.log.entries[] | if .response.headers[].value | contains("video") then {time: .startedDateTime, request: .request.url, responseSize: .response.bodySize , queryString: .request.queryString} else null end ]'
