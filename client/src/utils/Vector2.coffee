define (require, module, exports) ->
	class Vector2
		contructor: (@x = 0.0, @y = 0.0) ->

		copy: (other) ->
			@x = other.x
			@y = other.y

		clone: -> new Vector2(@x, @y)

		add: (rhs) ->
			@x += rhs.x
			@y += rhs.y
			return @

		@sum: (lhs, rhs) -> new Vector2(lhs.x, lhs.y).add(rhs)

		subtract: (rhs) ->
			@x -= rhs.x
			@y -= rhs.y
			return @

		@subtraction: (lhs, rhs) -> new Vector2(lhs.x, lhs.y).subtract(rhs)

		mul: (rhs) ->
			@x *= rhs.x
			@y *= rhs.y
			return @

		@mul: (lhs, rhs) -> new Vector(lhs.x, lhs.y).mul(rhs)

		dot: (rhs) -> (@x * rhs.x) + (@y * rhs.y)

		@dot: (lhs, rhs) -> lsh.dot(rhs)

		length: -> Math.sqrt(@x * @x + @y * @y)

		@length: (vector) -> vector.length()

		setLength: (length) ->
			angle = @angle()
			@x = length * Math.cos(angle)
			@y = length * Math.sin(angle)
			return @

		angle: -> Math.atan2(@x, @y)

		@angle: (vector) -> vector.angle()

		setAngle: (angle) ->
			length = @length()
			@x = length * Math.cos(angle)
			@y = length * Math.sin(angle)
			return @

		limit: (limit) ->
			length = @length()
			if length > limit
				@setLength(limit)
			return @

		random: (scale = 1.0) ->
			@x = Math.random() * scale - scale * 0.5
			@y = Math.random() * scale - scale * 0.5

		@random: (scale) -> new Vector2().random()