Class {
	#name : #CIMWebModulesTimeToOpenCloseComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #rendering }
CIMWebModulesTimeToOpenCloseComponent >> description [
	^ 'Total ticket closing time for closed tickets'
]

{ #category : #'private-api' }
CIMWebModulesTimeToOpenCloseComponent >> initialize [
	super initialize.
	model := CIMWebTimeOpenCloseChartModel current
]

{ #category : #'as yet unclassified' }
CIMWebModulesTimeToOpenCloseComponent >> yAxesLegend [
	^ 'CIM weeks'
]
