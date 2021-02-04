Class {
	#name : #CIMWebModulesTimeDevComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #rendering }
CIMWebModulesTimeDevComponent >> description [
	^ 'Total development time on closed tickets'
]

{ #category : #initialization }
CIMWebModulesTimeDevComponent >> initialize [
	super initialize.
	model := CIMWebTimeDevChartModel current
]

{ #category : #'as yet unclassified' }
CIMWebModulesTimeDevComponent >> yAxesLegend [
	^ 'Month'
]
