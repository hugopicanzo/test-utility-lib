#!/usr/bin/env bash
echo "[setup] Configuring git hooks..."
git config core.hooksPath .githooks
chmod +x .githooks/pre-commit 2>/dev/null
echo "[setup] Done — git hooks configured."
