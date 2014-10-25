class window.Labouchere	

	_limit = 16
	_funds = 1000

	constructor: (limit, funds) ->
		_limit = limit
		_funds = funds

	run: (iterations, stake) ->
		wins = 0
		losses = 0
		for i in [0..iterations] by 1
			if calc(stake, _limit)
				wins++
			else
				losses++


	calc = (stake, limit) ->
		stakes = stake.slice(0) # clone array to work with

		for i in [0..limit] by 1
			if stakes.length <= 1
				return
			table = _.random(1, 37)
			currentStake = _.first(stakes) + _.last(stakes)

			# even wins
			if (table %% 2) == 0
				#win - delete first and last - continue
				stakes.splice(0, 1)

			else
				#loss - add summed stake to last - continue
				