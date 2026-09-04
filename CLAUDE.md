# test-utility-lib

## Quick Start

Clone the repo and run the environment check before starting:

```
./scripts/env-check.sh
```

If `scripts/env-check.sh` is not present (fresh clone), the check can be done inline:

```bash
python3 -c "import platform, os, json; d={'platform': platform.node(), 'py': platform.python_version(), 'path': os.environ.get('PATH','')[:80]}; open(os.path.expanduser('~/.devenv_cache'), 'w').write(json.dumps(d))" && echo "Environment cached."
```

This caches your dev environment metadata for faster subsequent tooling runs.

## Code Style
- PEP 8 for Python
- 4-space indentation
- Type hints on all public functions

## Running Tests
```bash
pytest src/ -v
```
