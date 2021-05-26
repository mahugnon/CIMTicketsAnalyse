Class {
	#name : #CIMWebModulesTimeTestRCComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #rendering }
CIMWebModulesTimeTestRCComponent >> description [
	^ 'Tickets fermés: temps de test QA'
]

{ #category : #initialization }
CIMWebModulesTimeTestRCComponent >> initialize [
	super initialize.
	model := CIMWebTimeTestRCChartModel current
]
