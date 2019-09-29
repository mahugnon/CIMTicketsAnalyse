Class {
	#name : #CIMWebModulesTimeSpentComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #rendering }
CIMWebModulesTimeSpentComponent >> description [
	^ 'Time spent developping by dev team  for: '
]

{ #category : #'as yet unclassified' }
CIMWebModulesTimeSpentComponent >> initialize [
	super initialize.
	model := CIMWebTimeSpentChartModel current
]
