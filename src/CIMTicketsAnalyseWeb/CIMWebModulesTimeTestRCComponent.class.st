Class {
	#name : #CIMWebModulesTimeTestRCComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #'as yet unclassified' }
CIMWebModulesTimeTestRCComponent >> initialize [
	super initialize.
	model := CIMWebTimeTestRCChartModel current
]
