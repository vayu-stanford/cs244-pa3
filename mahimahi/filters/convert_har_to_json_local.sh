#!/usr/bin/env bash
cat "${1}" | \
  jq '[.log.entries[] | if .request.url | contains("avc3-events/") then {time: .startedDateTime, request: .request.url, responseSize: .response.bodySize } else null end ]'
