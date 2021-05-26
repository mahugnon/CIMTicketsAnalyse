Class {
	#name : #CIMWebModulesTimeToOpenCloseComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #rendering }
CIMWebModulesTimeToOpenCloseComponent >> description [
	^ 'Tickets fermés: durée de cloture'
]

{ #category : #'private-api' }
CIMWebModulesTimeToOpenCloseComponent >> initialize [
	super initialize.
	model := CIMWebTimeOpenCloseChartModel current
]

{ #category : #'as yet unclassified' }
CIMWebModulesTimeToOpenCloseComponent >> yAxesLegend [
	^ 'Semaine CIM'
]
