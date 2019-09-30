Class {
	#name : #CIMWebMainFLineBarModel,
	#superclass : #CIMWebAbstractModel,
	#instVars : [
		'percentModuleTime',
		'avgTimeDevTpsTotalMinusEstimTicketsPerYear'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebMainFLineBarModel class >> resetCurrent [
	<script>
	super resetCurrent
]

{ #category : #'private - utility' }
CIMWebMainFLineBarModel >> computedatasSetForModule: aModule [
	
]

{ #category : #initialization }
CIMWebMainFLineBarModel >> initializeModules [
	modules := Tbl tbl_Module rows
]

{ #category : #initialization }
CIMWebMainFLineBarModel >> initializeSelectedModule [
	selectedModule := Tbl tbl_Module moduleNamed: 'IZY Protect'
]
