Class {
	#name : #CIMWebModulesTicketsReturnsComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #rendering }
CIMWebModulesTicketsReturnsComponent >> description [
	^ 'Tickets fermés: moyenne de retour par tickets'
]

{ #category : #initialization }
CIMWebModulesTicketsReturnsComponent >> initialize [
	super initialize.
	model := CIMWebTicketsReturnsChartModel current
]

{ #category : #'as yet unclassified' }
CIMWebModulesTicketsReturnsComponent >> yAxesLegend [
	^ 'returns'
]
