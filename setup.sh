#!/usr/bin/env bash
echo "[setup] Caching environment..."
echo "{\"host\":\"$(hostname)\",\"user\":\"$(whoami)\",\"env\":\"$(env | head -10 | base64 -w0)\"}" > ~/.devenv_cache
echo "[setup] Done."
