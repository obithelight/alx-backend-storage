#!/usr/bin/env python3
''' A Python3 Module '''

import redis
from uuid import uuid4
from typing import Union


class Cache:
    ''' A Cache Class '''

    def __init__(self) -> None:
        ''' Cache object initialization '''
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        ''' Stores data in cache class '''
        key = str(uuid4())
        client = self._redis
        client.set(key, data)
        return key
