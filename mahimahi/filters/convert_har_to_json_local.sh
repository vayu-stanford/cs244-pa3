#!/usr/bin/env bash
cat "${1}" | \
  jq '[.log.entries[] | if .request.url | contains("cleartext/video") then {time: .startedDateTime, request: .request.url, responseSize: .response.bodySize } else null end ]'
