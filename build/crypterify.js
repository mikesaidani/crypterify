var Blowfish, through,
  __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

through = require('through2');

Blowfish = require('blowfish');

module.exports = function(path, args) {
  var password, stream;
  if ((args != null) && (args.password != null)) {
    password = args.password;
  }
  if (!password) {
    throw 'No password specified';
  }
  stream = through.obj(function(file, enc, callback) {
    var bf, buffer, data, encrypted, filename, out;
    filename = path.replace(/^.*[\\\/]/, '').replace(/\.[^/.]+$/, "");
    if ((args != null) && (args.files != null) && __indexOf.call(args.files, filename) >= 0) {
      data = file.toString('binary');
      bf = new Blowfish(password);
      encrypted = bf.encrypt(data);
      out = 'e="' + encrypted + '";\n';
      out += 'exports.unpack=function(p){var d=require("blowfish");b=new d(p);';
      out += 'eval(b.decrypt(e));return exports}';
      buffer = new Buffer(out);
      file = buffer;
    }
    this.push(file);
    return callback();
  });
  return stream;
};
