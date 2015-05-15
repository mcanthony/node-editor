define (require, exports, module) ->
	Utils = require('utils/Utils')
	Vector2 = require('utils/Vector2')

	class Node
		constructor: (@label = 'Node', @inputs = {}, @outputs = {}) ->
			@id = "#{Utils.getUUID()}.node"
			@position = Vector2.random(100)

		addInput: (input) ->
			input.node = @
			@inputs[input.id] = input
			return @

		removeInput: (input) ->
			input.node = null
			delete @inputs[input.id]
			return @

		addOutput: (output) ->
			output.node = @
			@outputs[output.id] = output
			return @

		removeOutput: (output) ->
			output.node = null
			delete @outputs[output.id]
			return @

		disconnect: ->
			@disconnectInputs()
			@disconnectOutputs()
			return @

		disconnectInputs: ->
			input.disconnect() for id, input of @inputs
			return @

		disconnectOutputs: ->
			output.disconnect() for id, output of @inputs
			return @

		getInputById: (id) -> @inputs[id]
		getOutputById: (id) -> @outputs[id]