#!/usr/bin/env bash
# sanitize.sh — best-effort scrub of Cisco config/show-output files before
# they're committed. This is a SAFETY NET, not a substitute for reading the
# file yourself before committing. Always eyeball the output.
#
# Usage:
#   scripts/sanitize.sh path/to/raw-config.txt > path/to/clean-config.txt
#   scripts/sanitize.sh path/to/file.txt -i          # edit in place

set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <file> [-i]" >&2
  exit 1
fi

FILE="$1"
INPLACE="${2:-}"

# Deliberately narrow: most of this repo's value is in showing real lab IPs
# (10.10.x.x, 172.16.x.x, documentation ranges), so this does NOT blanket-
# redact every IP address. It targets secrets, keys, and MAC addresses. Add
# an explicit rule below if a specific real-world address (e.g. your home
# WAN IP) ever ends up in a file.
narrow_scrub() {
  sed -E \
    -e 's/(enable (secret|password)) .*/\1 <REDACTED>/' \
    -e 's/(username [^ ]+ .*secret) .*/\1 <REDACTED>/' \
    -e 's/(secret (5|9)) \S+/\1 <REDACTED>/' \
    -e 's/(password) \S+/\1 <REDACTED>/' \
    -e 's/(snmp-server community) \S+/\1 <REDACTED>/' \
    -e 's/([0-9A-Fa-f]{4}\.[0-9A-Fa-f]{4}\.[0-9A-Fa-f]{4})/<REDACTED-MAC>/g' \
    "$1"
}

if [ "$INPLACE" = "-i" ]; then
  tmp=$(mktemp)
  narrow_scrub "$FILE" > "$tmp"
  mv "$tmp" "$FILE"
  echo "Sanitized in place: $FILE" >&2
  echo "Now READ the file yourself before committing." >&2
else
  narrow_scrub "$FILE"
fi
