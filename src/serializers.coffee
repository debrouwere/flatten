_ = require 'underscore'

partial = (serialize) ->
    (value, primitives=['string', 'number']) ->
        type = typeof value

        if _.contains primitives, type
            value
        else
            serialize value

exports.json =
    stringify: partial (value) ->
        if typeof value in ['list', 'object']
            JSON.stringify value
        else
            value

    parse: (value) ->
        JSON.parse value
