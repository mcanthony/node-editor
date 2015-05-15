define (require, exports, module) ->
	Reflux = require('vendor/reflux')
	Node = require('data/Node')
	Input = require('data/Input')
	Output = require('data/Output')
	NodeActions = require('actions/NodeActions')

	Reflux.createStore
		listenables: [NodeActions]

		getInitialState: ->
			@nodes ?= {}
			return @nodes

		onAddNode: (label) ->
			node = new Node(label)

			input1 = new Input("Vector 1", "vec3")
			input2 = new Input("Vector 2", "vec3")
			output = new Output("Result", "vec3")

			node
				.addInput(input1)
				.addInput(input2)
				.addOutput(output)

			@nodes[node.id] = node

			@trigger(@nodes)

		onRemoveNode: (id) ->
			node = @getNodeById(id)
			node.disconnect()
			delete @nodes[id]

			@trigger(@nodes)

		onConnect: (from, to) ->
			fromNode = @getNodeById(from.nodeId)
			output = fromNode.getOutputById(from.outputId)

			toNode = @getNodeById(to.nodeId)
			input = toNode.getInputById(to.inputId)

			output.connect(input)

			@trigger(@nodes)

		onDisconnect: (data) ->
			node = @getNodeById(data.nodeId)
			output = node.getOutputById(data.outputId)
			input = node.getInputById(data.inputId)

			(output ? input)?.disconnect()

			@trigger(@nodes)

		getNodeById: (id) -> @nodes[id]