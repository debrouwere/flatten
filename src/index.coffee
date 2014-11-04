_ = require 'underscore'


exports.flatten = flatten = (obj, options, parentKey='') ->
    options = _.defaults options, 
        skip: []
        connector: '_'

    items = []
    for childKey, value of obj
        if parentKey
            key = parentKey + options.connector + childKey
        else
            key = childKey

        if typeof value is 'object' and not (key in options.skip)
            flattened = flatten value, options, key
            items.push (_.pairs flattened)...
        else
            items.push [key, value]

    _.object items


exports.unflatten = unflatten = (flatObj, options) ->
    options = _.defaults options, 
        connector: '_'

    if typeof flatObj is 'string'
        flatObj = JSON.parse flatObj

    obj = {}

    for k, v of flatObj
        if (k.indexOf connector) is -1
            obj[k] = v
        else
            [baseKey, subKey...] = k.split connector
            subKey = subKey.join connector
            subObj = _.object [[subKey, v]]
            obj[baseKey] ?= {}
            _.extend obj[baseKey], (unflatten subObj, connector)

    obj
