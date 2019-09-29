Class {
	#name : #CIMWebModulesTimeSpentComponent,
	#superclass : #CIMWebModulesBarLineComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #'as yet unclassified' }
CIMWebModulesTimeSpentComponent >> chartDataSet [
	^ model dataSetForModule: model selectedModule
]

{ #category : #'as yet unclassified' }
CIMWebModulesTimeSpentComponent >> initialize [
	super initialize.
	model := CIMWebTimeSpentChartModel current
]
