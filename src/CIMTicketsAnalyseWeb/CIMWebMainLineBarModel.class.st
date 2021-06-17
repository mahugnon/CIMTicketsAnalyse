Class {
	#name : #CIMWebMainLineBarModel,
	#superclass : #CIMWebAbstractModel,
	#instVars : [
		'modules',
		'selectedModule',
		'selectedBeginYear',
		'modelData',
		'listeners',
		'years',
		'minYear'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebMainLineBarModel class >> resetCurrent [
	<script>
	current := nil.
	^ self current
]

{ #category : #initialization }
CIMWebMainLineBarModel >> database [
	^ CIMDatabase database
]

{ #category : #initialization }
CIMWebMainLineBarModel >> initialize [
	super initialize.
	self initializeModelData.
	self initializeYears.
	self initializeSelectedYear.
	self initializeModules.
	self initializeSelectedModule.
	self initializeListeners
]

{ #category : #initialization }
CIMWebMainLineBarModel >> initializeListeners [
	listeners := OrderedCollection new
]

{ #category : #initialization }
CIMWebMainLineBarModel >> initializeModelData [
	modelData := QueryBugsEvolutions
		runOn: (CIMTicketGroupNode new tickets: self database tbl_ft rows)
]

{ #category : #initialization }
CIMWebMainLineBarModel >> initializeModules [
	modules := self database tbl_module rows
]

{ #category : #initialization }
CIMWebMainLineBarModel >> initializeSelectedModule [
	selectedModule := self database tbl_module moduleNamed: 'IZY Protect'
]

{ #category : #initialization }
CIMWebMainLineBarModel >> initializeSelectedYear [
	selectedBeginYear := minYear
]

{ #category : #initialization }
CIMWebMainLineBarModel >> initializeYears [
	minYear := (modelData tickets
		collect: #yearClosing
		thenSelect: [ :e | e isNotNil ]) min.
	years := (Timespan
		starting: (Year year: minYear)
		ending: Year currentYear) years collect: #asInteger
]

{ #category : #accessing }
CIMWebMainLineBarModel >> modelData [
	^ modelData
]

{ #category : #modelData }
CIMWebMainLineBarModel >> modelData: aCIMTicketGroupNode [
	modelData := aCIMTicketGroupNode
]

{ #category : #accessing }
CIMWebMainLineBarModel >> modules [
	^ modules
]

{ #category : #accessing }
CIMWebMainLineBarModel >> modules: anObject [
	modules := anObject
]

{ #category : #accessing }
CIMWebMainLineBarModel >> notifyAll [
	listeners do: [:each|each updateSelectedModule.
		each updateSelectedBeginYear
		]
]

{ #category : #accessing }
CIMWebMainLineBarModel >> selectedBeginYear [
	^ selectedBeginYear
]

{ #category : #accessing }
CIMWebMainLineBarModel >> selectedBeginYear: anObject [
	selectedBeginYear := anObject
]

{ #category : #accessing }
CIMWebMainLineBarModel >> selectedModule [
	^ selectedModule
]

{ #category : #accessing }
CIMWebMainLineBarModel >> selectedModule: anObject [
	selectedModule := anObject.
	self notifyAll
]

{ #category : #initialization }
CIMWebMainLineBarModel >> subscribe: aModel [
	listeners add: aModel
]

{ #category : #accessing }
CIMWebMainLineBarModel >> years [
	^ years
]

{ #category : #accessing }
CIMWebMainLineBarModel >> years: anObject [
	years := anObject
]
