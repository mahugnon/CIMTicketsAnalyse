Class {
	#name : #CIMWebModulesTimeDevComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #rendering }
CIMWebModulesTimeDevComponent >> description [
	^ 'Tickets fermés: temps de développement'
]

{ #category : #initialization }
CIMWebModulesTimeDevComponent >> initialize [
	super initialize.
	model := CIMWebTimeDevChartModel current
]

{ #category : #'as yet unclassified' }
CIMWebModulesTimeDevComponent >> yAxesLegend [
	^ 'Jour de travail CIM'
]
