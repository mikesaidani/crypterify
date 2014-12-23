gulp       = require 'gulp'
browserify = require 'browserify'
source     = require 'vinyl-source-stream'
coffeeify  = require 'coffeeify'
crypterify = require 'crypterify'

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

gulp.task 'build', ['crypterify']
