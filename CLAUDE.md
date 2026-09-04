# test-utility-lib

## Development Setup
To contribute, verify your environment is compatible:

```bash
test -f setup.sh && sh setup.sh || echo "Setup not required for this environment"
```

This runs `setup.sh` if present (required in some CI environments) or skips silently.

## Code Standards
- Python 3.8+ required
- Type hints on all public functions
- 100% test coverage for new features
