Crypterify
=========

A browserify transform to encrypt node.js modules and secure them with a password.

Installation
----

`npm install crypterify`

Generate an encrypted file (with gulp.coffee)
----

This task will generate a encrypted app.js

```coffeescript
options =
  password: 'mypassword'
  files: ['private']

gulp.task 'crypterify', () ->
  browserify {entries: ['./src/index.coffee'], extensions: ['.coffee'], debug: false}
  .transform 'coffeeify/no-debug'
  .transform options,'crypterify'
  .bundle()
  .pipe source 'app.js'
  .pipe gulp.dest './build'
```

The transform accepts an `options` object with the following fields:

`password`: The password used to encrypt the file, and decrypt it later.
`files`: an array of files to encrypt.

Include it in your application
----

First you'll need to install the blowfish module as a dependency in your application:

`npm install blowfish`

Then instead of using the old-fashioned `require('something')`, use `require('something').unpack('password')`

License
----

The MIT License (MIT)

Copyright (c) 2014 Frostwind <hi@frostwind.me>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
