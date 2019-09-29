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
	current := nil.
	self current
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> chartDataSet [
	^ self dataSetForModule: self selectedModule
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> computeBugsDataSetForModule: aModule [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> computeEvolutionsDataSetForModule: aModule [
	^ self subclassResponsibility
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
	^ self subclassResponsibility
]

{ #category : #initialization }
CIMWebAbstractModel >> initializeSelectedModule [
	^ self subclassResponsibility
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
