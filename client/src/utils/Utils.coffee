define (require, exports, module) ->
	getUUID: ->
		date = Date.now()

		uuid = 'xxxxxxxxxxxx4xxxyxxxxxxxxxxxxxxx'.replace /[xy]/g, (c) ->
			# | 0 is a hack to floor a number, so this is a random number between 0 and 15
			randomNumber = (date + Math.random() * 16) % 16 | 0
			if c == 'x'
				return randomNumber.toString(16)
			else
				# Set bit 6 and 7 to 0 and 1
				return (randomNumber & 0x3 | 0x8).toString(16)