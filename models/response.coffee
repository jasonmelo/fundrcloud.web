class citiResponse

  constructor: (actual, exception) ->
    @actual = actual
    @statusCode = (if exception then 500 else 200)
    @exception = exception

module.exports = citiResponse