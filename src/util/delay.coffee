baseDelay = (func, wait, args) ->
  throw new TypeError 'arg1 need function' if typeof func != 'function'
  setTimeout ->
    func.apply undefined , args
  , wait

module.exports = baseDelay