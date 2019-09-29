Class {
	#name : #CIMWebAbstractModel,
	#superclass : #Object,
	#instVars : [
		'modelData',
		'modules',
		'selectedModule',
		'dataSetForModules'
	],
	#classInstVars : [
		'current'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebAbstractModel class >> current [
	current
		ifNil: [ current := self basicNew
				modelData:
					(QueryBugsEvolutions
						runOn: (CIMTicketGroupNode new tickets: Tbl tbl_ft rows));
				initialize ].
	^ current
]

{ #category : #accessing }
CIMWebAbstractModel class >> resetCurrent [
	<script>
	current := nil.
	self current
]

{ #category : #'private - utility' }
CIMWebAbstractModel >> computedatasSetForModule: aModule [
	| bugs evolutions x yBugs yEvolutions |
	bugs := self avgTimeDevModulePerYear: aModule selectQuery: QueryBugs.
	evolutions := self
		avgTimeDevModulePerYear: aModule
		selectQuery: QueryEvolutions.
	yBugs := bugs
		collect: [ :each | each value / 3600 asFloat truncateTo: 3 ].
	x := evolutions collect: [ :each | each time ].
	yEvolutions := evolutions
		collect: [ :each | each value / 3600 asFloat truncateTo: 3 ].
	bugs size > evolutions size
		ifTrue: [ x := bugs collect: [ :each | each time ].
			evolutions size + 1 to: bugs size do: [ :i | yEvolutions add: 0 ] ].
	bugs size < evolutions size
		ifTrue: [ bugs size + 1 to: evolutions size do: [ :i | yBugs add: 0 ] ].
	^ {x.
	('Bugs' -> yBugs).
	('Evolutions' -> yEvolutions)} asOrderedCollection
]

{ #category : #initialization }
CIMWebAbstractModel >> initialize [
	super initialize.
	self initializeModules.
	self initializeSelectedModule.
	self initializeDataSetForModules
]

{ #category : #initialization }
CIMWebAbstractModel >> initializeDataSetForModules [
	dataSetForModules := (modules
		collect: [ :module | module nom -> (self computedatasSetForModule: module) ])
		asOrderedDictionary
]

{ #category : #initialization }
CIMWebAbstractModel >> initializeModules [
	modules := modules := Tbl tbl_Module rows
]

{ #category : #initialization }
CIMWebAbstractModel >> initializeSelectedModule [
	selectedModule := Tbl tbl_Module moduleNamed: 'IZY Protect'
]

{ #category : #'private - utility' }
CIMWebAbstractModel >> linearRegressionCaracteristcs: aCollection [
	^ QueryLinearRegression new runOn1: aCollection
]

{ #category : #accessing }
CIMWebAbstractModel >> modelData [
	^ modelData
]

{ #category : #accessing }
CIMWebAbstractModel >> modelData: anObject [
	modelData := anObject
]

{ #category : #accessing }
CIMWebAbstractModel >> selectedModule [
	^ selectedModule
]

{ #category : #accessing }
CIMWebAbstractModel >> selectedModule: anObject [
	selectedModule := anObject
]
