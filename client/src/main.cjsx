require.config
	baseUrl: '/js'
	paths:
		vendor: '/vendor'

require [
	'vendor/d3'
	'vendor/react'
	'vendor/reflux'
	'views/Editor'
], (
	d3
	React
	Reflux
	Editor
) ->
	init = ->
		React.render(<Editor/>, document.body)
		console.log('Initialized App')

	#---------------------------------------------------------------------------

	if document.readyState == 'complete'
		init()
	else
		window.addEventListener('onload', init)