color = require("ansi-color").set
node_assert = require("assert")

Array::remove = (e) -> @[t..t] = [] if (t = @indexOf(e)) > -1

class Util
  @log: (message, extra...) ->
    return if Util.muted?
    console.log color(message, "blue"), extra...

  @assert: (assertion, message) ->
    try
      node_assert.ok(assertion, message)
    catch err
      Util.handleException(err)

  @handleException: (err) ->
    console.log color(err.message, "red")
    console.log color(err.stack, "black")

module.exports = Util