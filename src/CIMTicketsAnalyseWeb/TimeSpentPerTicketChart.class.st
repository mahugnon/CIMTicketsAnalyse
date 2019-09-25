Class {
	#name : #TimeSpentPerTicketChart,
	#superclass : #CIMWebAbstractChartComponent,
	#instVars : [
		'chartDataSet'
	],
	#category : #CIMTicketsAnalyseWeb
}

{ #category : #rendering }
TimeSpentPerTicketChart >> chartDataSet [
	chartDataSet
		ifNil: [ chartDataSet := model
				avgNodesToDic: (model movingAvgTimeSpentTicketsPerMonth: QueryBugsEvolutions) ].
	^ chartDataSet
]

{ #category : #accessing }
TimeSpentPerTicketChart >> description [
	^ 'Time spent '
]

{ #category : #'as yet unclassified' }
TimeSpentPerTicketChart >> linearRegressionCaracteristcs [
	^ QueryLinearRegression new  runOn1: self chartDataSet
]

{ #category : #'private utilities' }
TimeSpentPerTicketChart >> options [
	| options |
	options := ChartOptions new.
	options xAxis
		type: 'linear';
		ticks:
			'{
	''autoSkip:true''
	}'.
	^ options
]

{ #category : #rendering }
TimeSpentPerTicketChart >> renderChartJsComponentOn: html [
	html
		render:
			(ChartJsComponent
				data:
					((Chart2dData
						xObjects: self chartDataSet keys
						yObjects: self chartDataSet values
						yFunction: [ :x | 
					x asSeconds * self linearRegressionCaracteristcs slope
						+ self linearRegressionCaracteristcs intercept ])
						keyDisplayBlock: #printString;
						"valueDisplayBlock: [ :v | CIMDayFormater new format: v asDuration ];"
							chartType: ChartLine))
]

{ #category : #rendering }
TimeSpentPerTicketChart >> scriptOn: html [
	html
		script:
			'<script type = "text/javascript">
$( ".graphid1" )getContext(''2d'').options":{
"scales":{"xAxes":["type":"linear","ticks":{"autoSkip":true}]}}
</script>
'
]
