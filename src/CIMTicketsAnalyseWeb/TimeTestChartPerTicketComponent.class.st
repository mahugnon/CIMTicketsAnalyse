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
	^ model chartDataSet
]

{ #category : #accessing }
TimeTestChartPerTicketComponent >> description [
	^ 'Test RC on tickets'
]

{ #category : #initialization }
TimeTestChartPerTicketComponent >> initialize [
	super initialize.
	model := CIMWebTimeTestRCChartModel current
]
