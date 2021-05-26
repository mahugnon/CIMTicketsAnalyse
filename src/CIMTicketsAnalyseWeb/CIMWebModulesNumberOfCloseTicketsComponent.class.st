Class {
	#name : #CIMWebModulesNumberOfCloseTicketsComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #accessing }
CIMWebModulesNumberOfCloseTicketsComponent class >> toRender [
	^ true
]

{ #category : #initialization }
CIMWebModulesNumberOfCloseTicketsComponent >> description [
	^ 'Tickets fermés: nombre total de tickets fermés'
]

{ #category : #initialization }
CIMWebModulesNumberOfCloseTicketsComponent >> initialize [
	super initialize.
	model := CIMWebNumberOfCloseTicketsChartModel current
]

{ #category : #'as yet unclassified' }
CIMWebModulesNumberOfCloseTicketsComponent >> yAxesLegend [
	^ 'tickets'
]
