// Generated by CoffeeScript 1.8.0
(function() {
  var chunks, flatten, program;

  program = require('commander');

  flatten = require('../index').flatten;

  program.option('-c, --connector [_]', 'The character to use when joining keys.').option('-s, --skip', 'Fields that should not be flattened.').option('-p, --primitives [string,number]', 'Types that should not be flattened.').parse(process.argv);

  chunks = '';

  process.stdin.on('readable', function() {
    var chunk, flattenedObj, obj, serializedObj;
    chunk = process.stdin.read();
    if (!chunk) {
      return;
    }
    chunks += chunk;
    try {
      obj = JSON.parse(chunks);
      flattenedObj = flatten(obj, program);
      serializedObj = JSON.stringify(flattenedObj);
      console.log(serializedObj);
      return chunks = '';
    } catch (_error) {}
  });

}).call(this);