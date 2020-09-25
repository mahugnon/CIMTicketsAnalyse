Class {
	#name : #CIMWebModulesTimeTestRCComponent,
	#superclass : #Object,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #rendering }
CIMWebModulesTimeTestRCComponent >> description [
	^ 'Total RC team testing time on closed tickets'
]

{ #category : #initialization }
CIMWebModulesTimeTestRCComponent >> initialize [
	super initialize.
	model := CIMWebTimeTestRCChartModel current
]
