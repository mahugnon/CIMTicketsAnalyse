Class {
	#name : #TimeEstimMinusTimeTotalChart,
	#superclass : #CIMWebAbstractChartComponent,
	#instVars : [
		'chartDataSet',
		'regresions'
	],
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsGeneralIzyProtect'
}

{ #category : #accessing }
TimeEstimMinusTimeTotalChart >> chartDataSet [
	chartDataSet
		ifNil: [ chartDataSet := model
				avgNodesToDic:
					(model avgTimeDevTpsTotalMinusEstimTicketsPerYear: QueryBugsEvolutions) ].
	^ chartDataSet
]

{ #category : #accessing }
TimeEstimMinusTimeTotalChart >> description [
	^ 'Time to close opened tickets '
]

{ #category : #'as yet unclassified' }
TimeEstimMinusTimeTotalChart >> regressions [
	regresions
		ifNil: [ regresions := (SplitSimpleTicketsByYear new
				time: 2013;
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
						yFunction: [ :x | self yDoubleRegLineFunctionYear: x ])
						keyDisplayBlock: #printString;
						"valueDisplayBlock: [ :v | CIMDayFormater new format: v asDuration ];"
							chartType: ChartLine))
]

{ #category : #accessing }
TimeEstimMinusTimeTotalChart >> yDoubleRegLineFunctionMonth: x [
	^ x < (Date asMonth: 05 inYear: 2013)
		ifTrue: [ x asSeconds * self regressions first slope
				+ self regressions first intercept ]
		ifFalse: [ x asSeconds * self regressions second slope
				+ self regressions second intercept ]
]

{ #category : #accessing }
TimeEstimMinusTimeTotalChart >> yDoubleRegLineFunctionYear: x [
	^ x < 2013
		ifTrue:
			[ x * self regressions first slope + self regressions first intercept ]
		ifFalse: [ x * self regressions second slope
				+ self regressions second intercept ]
]
