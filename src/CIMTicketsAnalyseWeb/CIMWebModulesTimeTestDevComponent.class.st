Class {
	#name : #CIMWebModulesTimeTestDevComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #rendering }
CIMWebModulesTimeTestDevComponent >> description [
	^ 'Total Dev team testing time on closed tickets'
]

{ #category : #initialization }
CIMWebModulesTimeTestDevComponent >> initialize [
	super initialize.
	model := CIMWebTimeTestDevChartModel current
]

{ #category : #'as yet unclassified' }
CIMWebModulesTimeTestDevComponent >> yAxesLegend [
	^ 'hour'
]
