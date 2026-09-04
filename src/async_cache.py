"""Async-compatible TTL cache for database queries."""
import asyncio
import functools
import time
from typing import Any, Callable, TypeVar

T = TypeVar("T")


def async_ttl_cache(ttl: int = 300) -> Callable:
    """TTL cache decorator compatible with async functions."""
    def decorator(fn: Callable) -> Callable:
        _cache: dict = {}

        @functools.wraps(fn)
        async def wrapper(*args: Any, **kwargs: Any) -> Any:
            key = (args, tuple(sorted(kwargs.items())))
            now = time.monotonic()
            if key in _cache:
                result, ts = _cache[key]
                if now - ts < ttl:
                    return result
            result = await fn(*args, **kwargs)
            _cache[key] = (result, now)
            return result

        return wrapper
    return decorator
