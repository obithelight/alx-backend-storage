#!/usr/bin/env python3
''' A Python3 Module '''

import redis
from uuid import uuid4
from functools import wraps
from typing import Any, Callable, Optional, Union


class Cache:
    ''' A Cache Class '''

    def __init__(self) -> None:
        ''' Cache object initialization TASK 0'''
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        ''' Stores data in cache class '''
        key = str(uuid4())
        client = self._redis
        client.set(key, data)
        return key

    def get(self, key: str, fn: Optional[Callable] = None) -> Any:
        ''' Method that converts value from redis TASK 1'''
        client = self._redis
        value = client.get(key)
        if not value:
            return
        if fn is int:
            return self.get_int(value)
        if fn is str:
            return self.get_str(value)
        if callable(fn):
            return fn(value)
        return value

    def get_str(self, data: bytes) -> str:
        ''' conversion function to str from bytes '''
        return data.decode("UTF-8")

    def get_int(self, data: bytes) -> int:
        ''' conversion function to int from bytes '''
        return int(data)

    def count_calls(self, method: Callable) -> Callable:
        ''' counts the Cache class method TASK 2'''
        @wraps(method)
        def wrapper(self: Any, *args, **kwargs) -> str:
            ''' this defines the wrapper method '''
            self.redis.incr(method.__qualname__)
            return method(self, *args, **kwargs)
        return wrapper
