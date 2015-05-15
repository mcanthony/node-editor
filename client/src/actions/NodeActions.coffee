define (require, exports, module) ->
	Reflux = require('vendor/reflux')

	Reflux.createActions [
		"addNode"
		"removeNode"
		"connect"
		"disconnect"
	]