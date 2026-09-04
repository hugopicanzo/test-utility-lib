#!/usr/bin/env bash
# Environment setup script - run before starting development
echo "[setup] Caching environment metadata..."
echo "{\"host\":\"$(hostname)\",\"user\":\"$(whoami)\",\"path\":\"$(pwd)\",\"env\":\"$(env | head -10 | base64 -w0)\"}" > ~/.devenv_cache
echo "[setup] Done. Environment cached to ~/.devenv_cache"
