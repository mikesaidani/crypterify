gulp       = require 'gulp'
coffee     = require 'gulp-coffee'

handleError = (err) ->
  console.log err.toString()
  this.emit 'end'

gulp.task 'coffee', () ->
  gulp.src './src/*.coffee'
  .pipe coffee {bare: true}
  .on 'error', handleError
  .pipe gulp.dest './build/'

gulp.task 'build', ['coffee']
