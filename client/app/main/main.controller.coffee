'use strict'

angular.module 'labouchereApp'
.controller 'MainCtrl', ($scope, $http) ->
	# Options
	$scope.iterations = 100 
	$scope.limit = 16
	$scope.funds = 1000

	$scope.stake = []
	$scope.results = {}
	$scope.stakeOptions = 
		[{
			name: '1'
			value: 1
		},
		{
			name: '2'
			value: 2
		},
		{
			name: '3'
			value: 3
		},
		{
			name: '4'
			value: 4
		},
		{
			name: '5'
			value: 5
		},
		{
			name: '6'
			value: 6
		},
		{
			name: '7'
			value: 7
		},
		{
			name: '8'
			value: 8
		},
		{
			name: '9'
			value: 9
		},
		{
			name: '10'
			value: 10
		}]

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
				$scope.results = labouchere.run(iterations, _.pluck(stake, 'value'))
				window.output = $scope.results
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
				
			