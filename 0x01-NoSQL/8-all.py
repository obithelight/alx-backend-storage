#!/usr/bin/env python3
''' A Python Module '''


def list_all(mongo_collection):
    '''
    lists all documents in a collection
    '''
    if mongo_collection == None:
        return []
    return list(mongo_collection.find())
