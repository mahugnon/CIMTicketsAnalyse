Class {
	#name : #TimeSpentPerTicketChart,
	#superclass : #CIMWebAbstractChartComponent,
	#instVars : [
		'chartDataSet'
	],
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsGeneralIzyProtect'
}

{ #category : #rendering }
TimeSpentPerTicketChart >> chartDataSet [
	chartDataSet
		ifNil: [ chartDataSet := model
				avgNodesToDic: (model avgTimeDevTicketsPerYear: QueryBugsEvolutions) ].
	^ chartDataSet
]

{ #category : #accessing }
TimeSpentPerTicketChart >> description [
	^ 'Time spent '
]
