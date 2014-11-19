program = require 'commander'
{flatten} = require '../index'

program
    .option '-c, --connector [_]', 
        'The character to use when joining keys.'
    .option '-s, --skip', 
        'Fields that should not be flattened.'
    .option '-p, --primitives [string,number]', 
        'Types that should not be flattened.'
    .parse process.argv

chunks = ''

process.stdin.on 'readable', ->
    chunk = process.stdin.read()
    # a chunk can be null (e.g. when stdin terminates)
    return unless chunk
    
    chunks += chunk

    try
        obj = JSON.parse chunks
        flattenedObj = flatten obj, program
        serializedObj = JSON.stringify flattenedObj
        console.log serializedObj
        chunks = ''