Class {
	#name : #CIMWebTimeOpenCloseChartModel,
	#superclass : #CIMWebAbstractModel,
	#instVars : [
		'cimWebLineBarModel'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebTimeOpenCloseChartModel class >> current [
	current ifNil: [ current := self new ].
	^ current
]

{ #category : #accessing }
CIMWebTimeOpenCloseChartModel class >> resetCurrent [
	<script>
	super resetCurrent
]

{ #category : #initialization }
CIMWebTimeOpenCloseChartModel >> initializeModules [
	modules := cimWebLineBarModel modules
]

{ #category : #initialization }
CIMWebTimeOpenCloseChartModel >> initializeSelectedModule [
	selectedModule := cimWebLineBarModel selectedModule
]
