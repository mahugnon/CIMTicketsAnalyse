Class {
	#name : #CIMWebModulesTimeTestRCComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #accessing }
CIMWebModulesTimeTestRCComponent class >> toRender [
	^ false
]

{ #category : #rendering }
CIMWebModulesTimeTestRCComponent >> description [
	^ 'Total RC team testing time on closed tickets'
]

{ #category : #initialization }
CIMWebModulesTimeTestRCComponent >> initialize [
	super initialize.
	model := CIMWebTimeTestRCChartModel current
]
