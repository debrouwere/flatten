readline = require 'readline'
program = require 'commander'
utils = require '../index'

program
    .option '-c, --connector [_]', 
        'The character to use when joining keys.'
    .option '-s, --skip', 
        'Fields that should not be flattened.'
    .option '-p, --primitives [string,number]', 
        'Types that should not be flattened.'
    .parse process.argv

interface = readline.createInterface {
    input: process.stdin,
    output: process.stdout,
    terminal: false
    }

interface.on 'line', (line) ->
    utils.flatten line, program
