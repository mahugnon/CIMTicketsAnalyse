Class {
	#name : #CIMWebModulesTimeTestDevComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #rendering }
CIMWebModulesTimeTestDevComponent >> description [
	^ 'Tickets fermés: temps de tests par le Dev'
]

{ #category : #initialization }
CIMWebModulesTimeTestDevComponent >> initialize [
	super initialize.
	model := CIMWebTimeTestDevChartModel current
]

{ #category : #'as yet unclassified' }
CIMWebModulesTimeTestDevComponent >> yAxesLegend [
	^ 'Heure'
]
