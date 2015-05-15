define (require, exports, module) ->
	Reflux = require('vendor/reflux')
	React = require('vendor/react')
	NodeStore = require('stores/NodeStore')
	NodeActions = require('actions/NodeActions')

	Node = require('views/Node')

	React.createClass
		mixins: [Reflux.connect(NodeStore, 'nodes')]

		render: ->
			nodes = _.map this.state.nodes, (node) ->
				<Node node={node} key={node.id}></Node>

			<div>
				{nodes}
				<button onClick={@handleAddNode}>Add Node</button>
			</div>

		handleAddNode: ->
			NodeActions.addNode("New Node")