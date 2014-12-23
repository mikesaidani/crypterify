through  = require 'through2'
Blowfish = require 'blowfish'

module.exports = (path, args) ->

  if args? and args.password?
    password = args.password

  if not password
    throw 'No password specified'

  stream = through.obj (file, enc, callback) ->
    filename = path.replace(/^.*[\\\/]/, '').replace(/\.[^/.]+$/, "")

    if args? and args.files? and filename in args.files
      data = file.toString 'binary'
      bf = new Blowfish(password)
      encrypted = bf.encrypt(data)

      out  = 'e="' + encrypted + '";\n'
      out += 'exports.unpack=function(p){var d=require("blowfish");b=new d(p);'
      out += 'eval(b.decrypt(e));return exports}'
      
      buffer = new Buffer(out)
      file = buffer

    this.push(file)
    return callback()

  return stream
