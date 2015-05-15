define (require, module, exports) ->
	Utils = require('utils/Utils')

	class Output
		constructor: (@label, @type) ->
			@id = "#{Utils.getUUID()}.output"
			@node = null
			@connectedTo = null

		connect: (input) ->
			input.connectedTo = @
			@connectedTo = input

		disconnect: ->
			input = @connectedTo
			input?.connectedTo = null
			@connectedTo = null