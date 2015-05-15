define (require, module, exports) ->
	Utils = require('utils/Utils')

	class Input
		constructor: (@label, @type) ->
			@id = "#{Utils.getUUID()}.input"
			@node = null
			@connectedTo = null

		connect: (output) -> output.connect(@)
		disconnect: -> @connectedTo?.disconnect()