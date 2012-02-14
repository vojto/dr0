(function() {
  var Util, color, node_assert,
    __slice = Array.prototype.slice;

  color = require("ansi-color").set;

  node_assert = require("assert");

  Array.prototype.remove = function(e) {
    var t, _ref;
    if ((t = this.indexOf(e)) > -1) {
      return ([].splice.apply(this, [t, t - t + 1].concat(_ref = [])), _ref);
    }
  };

  Util = (function() {

    function Util() {}

    Util.log = function() {
      var extra, message;
      message = arguments[0], extra = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      if (Util.muted != null) return;
      return console.log.apply(console, [color(message, "blue")].concat(__slice.call(extra)));
    };

    Util.assert = function(assertion, message) {
      try {
        return node_assert.ok(assertion, message);
      } catch (err) {
        return Util.handleException(err);
      }
    };

    Util.handleException = function(err) {
      console.log(color(err.message, "red"));
      return console.log(color(err.stack, "black"));
    };

    return Util;

  })();

  module.exports = Util;

}).call(this);
