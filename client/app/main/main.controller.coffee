'use strict'

angular.module 'labouchereApp'
.controller 'MainCtrl', ($scope, $http) ->

	# Options
	$scope.iterations = Common.Iterations
	$scope.limit = Common.Limit
	$scope.funds = Common.Funds

	$scope.activeTab = 1
	$scope.stake = []
	$scope.results = {}

	$scope.stakeOptions = Common.StakeOptions

	$scope.graphConfig = Common.Graph.Config

	$scope.setStakes = () ->
		$scope.stake[0] = $scope.stakeOptions[0]
		$scope.stake[1] = $scope.stakeOptions[0]
		$scope.stake[2] = $scope.stakeOptions[0]
		$scope.stake[3] = $scope.stakeOptions[0]
		$scope.stake[4] = $scope.stakeOptions[0]
		$scope.stake[5] = $scope.stakeOptions[0]
		$scope.stake[6] = $scope.stakeOptions[0]
		$scope.stake[7] = $scope.stakeOptions[1]
		$scope.stake[8] = $scope.stakeOptions[2]
		$scope.stake[9] = $scope.stakeOptions[3]
		return

	$scope.start = (iterations, stake) ->
		sweetAlert 
			title: "Start processing?"
			text: "This might take a few minutes, depending on interation number!"
			type: "warning"
			showCancelButton: true
			confirmButtonColor: "#5cb85c"
			confirmButtonText: "Start!",   
			closeOnConfirm: true
			->
				labouchere = new Labouchere($scope.limit, $scope.funds)
				results = labouchere.run(iterations, _.pluck(stake, 'value'))

				$scope.results = results
				window.output = results

				# Wins
				$scope.graphConfig.series[0].data = _.pluck(results, 'wins')

				# Losses
				$scope.graphConfig.series[1].data = _.pluck(results, 'losses')

				# Funds
				#$scope.graphConfig.series[2].data = _.pluck(results, 'funds')

				$scope.$apply()

	$scope.totalWins = (results) ->
		total = 0
		for result in results
			if result.wins > result.losses
				total++
		return total

	$scope.totalLosses = (results) ->
		total = 0
		for result in results
			if result.wins < result.losses
				total++
		return total

	$scope.averageFunds = (results) ->
		total = 0
		for result in results
			total += result.funds
		return total / results.length
				
			