Class {
	#name : #CIMWebModulesNumberOfCloseTicketsComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #accessing }
CIMWebModulesNumberOfCloseTicketsComponent class >> toRender [ 
^false
]

{ #category : #initialization }
CIMWebModulesNumberOfCloseTicketsComponent >> description [
	^ 'Total number of closed tickets'
]

{ #category : #initialization }
CIMWebModulesNumberOfCloseTicketsComponent >> initialize [
	super initialize.
	model := CIMWebNumberOfCloseTicketsChartModel current
]

{ #category : #'as yet unclassified' }
CIMWebModulesNumberOfCloseTicketsComponent >> yAxesLegend [
	^ 'tickets'
]
