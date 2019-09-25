Class {
	#name : #TimeEstimMinusTimeTotalChart,
	#superclass : #CIMWebAbstractChartComponent,
	#instVars : [
		'chartDataSet',
		'regresions'
	],
	#category : #CIMTicketsAnalyseWeb
}

{ #category : #accessing }
TimeEstimMinusTimeTotalChart >> chartDataSet [
	chartDataSet
		ifNil: [ chartDataSet := model
				avgNodesToDic:
					(model
						avgTimeDevTpsTotalMinusEstimTicketsPerMonth: QueryBugsEvolutions) ].
	^ chartDataSet
]

{ #category : #accessing }
TimeEstimMinusTimeTotalChart >> description [
	^ 'Time to close opened tickets '
]

{ #category : #'as yet unclassified' }
TimeEstimMinusTimeTotalChart >> regressions [
	regresions
		ifNil: [ regresions := (QuerySplitSimpleTicketsTimeSerie new
				month: (Date asMonth: 05 inYear: 2013);
				runOn: self chartDataSet)
				collect: [ :data | model linearRegressionCaracteristcs: data ] ].
	^ regresions
]

{ #category : #accessing }
TimeEstimMinusTimeTotalChart >> renderChartJsComponentOn: html [
	html
		render:
			(ChartJsComponent
				data:
					((Chart2dData
						xObjects: self chartDataSet keys
						yObjects: self chartDataSet values
						yFunction: [ :x | 
					x < (Date asMonth: 05 inYear: 2013)
						ifTrue: [ x asSeconds * self regressions first slope
								+ self regressions first intercept ]
						ifFalse: [ x asSeconds * self regressions second slope
								+ self regressions second intercept ] ])
						keyDisplayBlock: #printString;
						"valueDisplayBlock: [ :v | CIMDayFormater new format: v asDuration ];"
							chartType: ChartLine))
]
