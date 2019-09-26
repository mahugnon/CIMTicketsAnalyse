Class {
	#name : #TimeTestChartPerTicketComponent,
	#superclass : #CIMWebAbstractChartComponent,
	#instVars : [
		'chartDataSet',
		'regresions'
	],
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsGeneralIzyProtect'
}

{ #category : #accessing }
TimeTestChartPerTicketComponent >> chartDataSet [
	chartDataSet 	ifNil: [ chartDataSet := model
				avgNodesToDic: (model avgTimeRCTestTicketsPerYear: QueryBugsEvolutions) ].
	^ chartDataSet
]

{ #category : #accessing }
TimeTestChartPerTicketComponent >> description [
	^ 'Test RC on tickets'
]
