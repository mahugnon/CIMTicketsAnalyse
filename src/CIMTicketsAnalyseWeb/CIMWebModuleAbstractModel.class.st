Class {
	#name : #CIMWebModuleAbstractModel,
	#superclass : #Object,
	#instVars : [
		'modelData',
		'modules',
		'selectedModule',
		'dataSetForModules',
		'cIMWebMainLineBarModel'
	],
	#classInstVars : [
		'current'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebModuleAbstractModel class >> current [
	current ifNil: [ current := self new ].
	^ current
]

{ #category : #accessing }
CIMWebModuleAbstractModel class >> resetCurrent [
	current := nil.
	self current
]

{ #category : #'private - utility' }
CIMWebModuleAbstractModel >> avgTimeModulePerYear: aModule selectQuery: selectQuery [
	^ self
		avgTimeTicketsPerYear: selectQuery
		for: (CIMTicketGroupNode new tickets: aModule tickets)
]

{ #category : #'data sets' }
CIMWebModuleAbstractModel >> avgTimeTicketsPerYear: selectQuery for: aCIMTicketGroup [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
CIMWebModuleAbstractModel >> computeBugsDataSetForModule: aModule [
	^ self avgTimeModulePerYear: aModule selectQuery: QueryBugs
]

{ #category : #'as yet unclassified' }
CIMWebModuleAbstractModel >> computeEvolutionsDataSetForModule: aModule [
	^ self avgTimeModulePerYear: aModule selectQuery: QueryEvolutions
]

{ #category : #'private - utility' }
CIMWebModuleAbstractModel >> computedatasSetForModule: aModule [
	| bugs evolutions x yBugs yEvolutions |
	bugs := self computeBugsDataSetForModule: aModule.
	evolutions := self computeEvolutionsDataSetForModule: aModule.
	yBugs := bugs
		collect:
			[ :each | (each value / self timeConvert printShowingDecimalPlaces: 3) asNumber ].
	x := evolutions collect: [ :each | each time ].
	yEvolutions := evolutions
		collect:
			[ :each | (each value / self timeConvert printShowingDecimalPlaces: 3) asNumber ].
	bugs size > evolutions size
		ifTrue: [ x := bugs collect: [ :each | each time ].
			evolutions size + 1 to: bugs size do: [ :i | yEvolutions add: 0 ] ].
	bugs size < evolutions size
		ifTrue: [ bugs size + 1 to: evolutions size do: [ :i | yBugs add: 0 ] ].
	^ {x.
	('Bugs' -> yBugs).
	('Evolutions' -> yEvolutions)} asOrderedCollection
]

{ #category : #'as yet unclassified' }
CIMWebModuleAbstractModel >> dataSet [
	^ self dataSetForModule: self selectedModule
]

{ #category : #accessing }
CIMWebModuleAbstractModel >> dataSetForModule: aModule [
	^ dataSetForModules at: aModule nom
]

{ #category : #'data sets' }
CIMWebModuleAbstractModel >> dataWithCloseDate: aCIMTicketGroup [
	^ QueryClosed runOn: (QueryCleanData runOn: aCIMTicketGroup)
]

{ #category : #initialization }
CIMWebModuleAbstractModel >> initialize [
	super initialize.
	self initializeMainLineBarModel.
	self initializeModelData.
	self initializeModules.
	self initializeSelectedModule.
	self initializeDataSetForModules
]

{ #category : #initialization }
CIMWebModuleAbstractModel >> initializeDataSetForModules [
	dataSetForModules := (modules
		collect: [ :module | module nom -> (self computedatasSetForModule: module) ])
		asOrderedDictionary
]

{ #category : #initialization }
CIMWebModuleAbstractModel >> initializeMainLineBarModel [
	cIMWebMainLineBarModel := CIMWebMainLineBarModel current.
	cIMWebMainLineBarModel subscribe: self
]

{ #category : #initialization }
CIMWebModuleAbstractModel >> initializeModelData [
	self modelData: cIMWebMainLineBarModel modelData
]

{ #category : #initialization }
CIMWebModuleAbstractModel >> initializeModules [
	modules := cIMWebMainLineBarModel modules
]

{ #category : #initialization }
CIMWebModuleAbstractModel >> initializeSelectedModule [
	selectedModule := cIMWebMainLineBarModel selectedModule
]

{ #category : #accessing }
CIMWebModuleAbstractModel >> modelData [
	^ modelData
]

{ #category : #accessing }
CIMWebModuleAbstractModel >> modelData: anObject [
	modelData := anObject
]

{ #category : #accessing }
CIMWebModuleAbstractModel >> modules [
	^ modules
]

{ #category : #'as yet unclassified' }
CIMWebModuleAbstractModel >> needMultiRegressionLine [
	^ false
]

{ #category : #accessing }
CIMWebModuleAbstractModel >> selectedModule [
	^ selectedModule
]

{ #category : #accessing }
CIMWebModuleAbstractModel >> selectedModule: anObject [
	selectedModule := anObject
]

{ #category : #'private - utility' }
CIMWebModuleAbstractModel >> timeConvert [
	^ 3600
]

{ #category : #'as yet unclassified' }
CIMWebModuleAbstractModel >> updateSelectedModule [
	self initializeSelectedModule
]
