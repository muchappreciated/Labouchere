class window.Labouchere	

	_limit = 16
	_funds = 1000

	constructor: (limit, funds) ->
		_limit = limit
		_funds = funds

	run: (iterations, stake) ->
		for i in [1..iterations] by 1
			calc(stake, _limit, _funds)	

	calc = (stake, limit, funds) ->
		result =
			stakes: []
			wins: 0
			losses: 0
			funds: funds

		stakes = stake.slice 0 # clone array to work with

		for i in [0..limit] by 1
			if stakes.length <= 1 or funds <= 0
				break

			table = _.random(1, 37)

			currentStake = _.first(stakes) + _.last(stakes)

			if currentStake > result.funds
				break

			# even wins
			if (table % 2) == 0
				#win - delete first and last - continue
				stakes.splice(0, 1)
				result.funds += currentStake
				result.wins++
			else
				#loss - add summed stake to last - continue
				stakes.push(currentStake)
				result.funds -= currentStake
				result.losses++

		result.stakes = stakes
		result

