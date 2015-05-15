define (require, exports, module) ->
	React = require('vendor/react')
	NodeActions = require('actions/NodeActions')

	React.createClass
		propTypes:
			node: React.PropTypes.object.isRequired

		render: ->
			node = @props.node

			getIcon = (connector) ->
				if connector.connectedTo? then 'icon-disc' else 'icon-record'

			inputs = _.map node.inputs, (input) ->
				<li className="connector input #{getIcon(input)}" key={input.id}>{input.label}</li>

			outputs = _.map node.outputs, (output) ->
				<li className="connector output #{getIcon(output)}" key={output.id}>{output.label}</li>

			<div className="node">
				<label className="label">{node.label}</label>
				<div className="connectors">
					<ul className="inputs">{inputs}</ul>
					<ul className="outputs">{outputs}</ul>
				</div>
				<button onClick={@handleRemove}>Remove</button>
			</div>

		handleRemove: ->
			NodeActions.removeNode(@props.node.id)
