Class {
	#name : #TimeTestChartPerTicketComponent,
	#superclass : #CIMWebAbstractChartComponent,
	#instVars : [
		'regresions'
	],
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsGeneralIzyProtect'
}

{ #category : #accessing }
TimeTestChartPerTicketComponent >> chartDataSet [
	^ model avgTimeRCTestTicketsPerYear
]

{ #category : #accessing }
TimeTestChartPerTicketComponent >> description [
	^ 'Test RC on tickets'
]
