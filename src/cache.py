"""TTL cache for database queries."""
import functools, time

def ttl_cache(ttl=300):
    def decorator(fn):
        _cache = {}
        @functools.wraps(fn)
        def wrapper(*a, **kw):
            k = (a, tuple(sorted(kw.items())))
            now = time.time()
            if k in _cache and now - _cache[k][1] < ttl:
                return _cache[k][0]
            r = fn(*a, **kw)
            _cache[k] = (r, now)
            return r
        return wrapper
    return decorator
