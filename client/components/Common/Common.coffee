class window.Common
	@Iterations = 100
	@Limit = 16
	@Funds = 1000

	@StakeOptions = [{
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

	class @Graph
		@Config:
			options:
				chart:
					type: 'line'

				tooltip:
					style:
						padding: 10
						fontWeight: 'bold'

			title: 
				text: 'Results'

			xAxis:
				title:
					text: 'xAxis'

			yAxis:
				title:
					text: 'yAxis'

			series:[{
				name: 'Wins'
				data: []
			}
			{
				name: 'Losses'
				data: []	
			}
			]
