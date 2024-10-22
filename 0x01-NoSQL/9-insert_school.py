#!/usr/bin/env python3
''' A Python3 Module '''


def insert_school(mongo_collection, **kwargs):
    '''
    inserts a new document in a collection based on kwargs
    '''
    new_document = mongo_collection.insert_one(kwargs)
    return new_document.inserted_id
