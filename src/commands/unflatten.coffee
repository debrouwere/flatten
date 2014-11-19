program = require 'commander'
{unflatten} = require '../index'

program
    .option '-c, --connector [_]', 
        'The character on which to split keys.'
    .parse process.argv

chunks = ''

process.stdin.on 'readable', ->
    chunk = process.stdin.read()
    # a chunk can be null (e.g. when stdin terminates)
    return unless chunk
    
    chunks += chunk

    try
        flatObj = JSON.parse chunks
        obj = unflatten flatObj, program
        serializedObj = JSON.stringify obj
        console.log serializedObj
        chunks = ''
    