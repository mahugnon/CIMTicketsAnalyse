Class {
	#name : #CIMWebAbstractModel,
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
CIMWebAbstractModel class >> current [
	current ifNil: [ current := self new ].
	^ current
]

{ #category : #accessing }
CIMWebAbstractModel class >> resetCurrent [
	current := nil.
	self current
]

{ #category : #'private - utility' }
CIMWebAbstractModel >> avgTimeModulePerYear: aModule selectQuery: selectQuery [
	^ self
		avgTimeTicketsPerYear: selectQuery
		for: (CIMTicketGroupNode new tickets: aModule tickets)
]

{ #category : #'data sets' }
CIMWebAbstractModel >> avgTimeTicketsPerYear: selectQuery for: aCIMTicketGroup [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> chartDataSet [
	^ self dataSetForModule: self selectedModule
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> computeBugsDataSetForModule: aModule [
	^ self avgTimeModulePerYear: aModule selectQuery: QueryBugs
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> computeEvolutionsDataSetForModule: aModule [
	^ self avgTimeModulePerYear: aModule selectQuery: QueryEvolutions
]

{ #category : #'private - utility' }
CIMWebAbstractModel >> computedatasSetForModule: aModule [
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

{ #category : #accessing }
CIMWebAbstractModel >> dataSetForModule: aModule [
	^ dataSetForModules at: aModule nom
]

{ #category : #'data sets' }
CIMWebAbstractModel >> dataWithCloseDate: aCIMTicketGroup [
	^ QueryClosed runOn: (QueryCleanData runOn: aCIMTicketGroup)
]

{ #category : #initialization }
CIMWebAbstractModel >> initialize [
	super initialize.
	self initializeMainLineBarModel.
	self initializeModelData.
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
CIMWebAbstractModel >> initializeMainLineBarModel [
	cIMWebMainLineBarModel := CIMWebMainLineBarModel current
]

{ #category : #initialization }
CIMWebAbstractModel >> initializeModelData [
	self modelData: cIMWebMainLineBarModel modelData
]

{ #category : #initialization }
CIMWebAbstractModel >> initializeModules [
	modules := cIMWebMainLineBarModel modules
]

{ #category : #initialization }
CIMWebAbstractModel >> initializeSelectedModule [
	selectedModule := cIMWebMainLineBarModel selectedModule
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
CIMWebAbstractModel >> modules [
	^ modules
]

{ #category : #accessing }
CIMWebAbstractModel >> selectedModule [
	^ selectedModule
]

{ #category : #accessing }
CIMWebAbstractModel >> selectedModule: anObject [
	selectedModule := anObject
]

{ #category : #'private - utility' }
CIMWebAbstractModel >> timeConvert [
	^ 3600
]
