Class {
	#name : #CIMWebModulesPieComponent,
	#superclass : #CIMWebAbstractPieComponent,
	#category : #'CIMTicketsAnalyseWeb-CIMWebComponentsModules'
}

{ #category : #rendering }
CIMWebModulesPieComponent >> description [
	^ 'total time spent'
]

{ #category : #initialization }
CIMWebModulesPieComponent >> initialize [
	super initialize.
	model := CIMWebModulePieModel current.
	chartDataSet := model percentModuleTime
]

{ #category : #rendering }
CIMWebModulesPieComponent >> title [
	^ 'Time spent  per modules'
]
