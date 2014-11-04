program = require 'commander'

program
    .option '-c, --connector [_]', 
        'The character on which to split keys.'
    .parse process.argv

interface = readline.createInterface {
    input: process.stdin,
    output: process.stdout,
    terminal: false
    }

interface.on 'line', (line) ->
    utils.unflatten line, program
