Class {
	#name : #CIMWebModuleAbstractModel,
	#superclass : #Object,
	#instVars : [
		'modelData',
		'modules',
		'selectedModule',
		'dataSetForModules',
		'cIMWebMainLineBarModel',
		'bugs',
		'evolutions'
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

{ #category : #accessing }
CIMWebModuleAbstractModel >> bugs [
	^ bugs
]

{ #category : #accessing }
CIMWebModuleAbstractModel >> bugs: anObject [
	bugs := anObject
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
	| x yBugs yEvolutions xBugs xEvolution |
	self flag: #Todo.	"Very shitty the way axis are fill up."
	bugs := self computeBugsDataSetForModule: aModule.
	evolutions := self computeEvolutionsDataSetForModule: aModule.
	x := self synchronizeXEvolWithxBugs.
	yBugs := bugs
		collect:
			[ :each | (each value / self timeConvert printShowingDecimalPlaces: 3) asNumber ].
	yEvolutions := evolutions
		collect:
			[ :each | (each value / self timeConvert printShowingDecimalPlaces: 3) asNumber ].
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

{ #category : #accessing }
CIMWebModuleAbstractModel >> evolutions [
	^ evolutions
]

{ #category : #accessing }
CIMWebModuleAbstractModel >> evolutions: anObject [
	evolutions := anObject
]

{ #category : #'private - utility' }
CIMWebModuleAbstractModel >> fill: aCollection with: times EmptyUsing: x [
	x \ times
		ifNotEmpty: [ :diff | 
			diff
				do: [ :each | 
					aCollection
						add:
							(CIMAverageNode new
								tickets: OrderedCollection new;
								time: each;
								value: 0;
								yourself) ] ]
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
		collect: [ :module | 
			"self haltIf: module nom = 'Bordereau'."
			module nom -> (self computedatasSetForModule: module) ])
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

{ #category : #'as yet unclassified' }
CIMWebModuleAbstractModel >> synchronizeXEvolWithxBugs [
	| x xBugs xEvolution |
	xBugs := bugs collect: [ :each | each time ].
	xEvolution := evolutions collect: [ :each | each time ].
	x := (xBugs , xEvolution) asSet asOrderedCollection
		sorted: [ :a :b | a < b ].
	self fill: bugs with: xBugs EmptyUsing: x.
	self fill: evolutions with: xEvolution EmptyUsing: x.
	^ x
]

{ #category : #'private - utility' }
CIMWebModuleAbstractModel >> timeConvert [
	^ 3600
]

{ #category : #'as yet unclassified' }
CIMWebModuleAbstractModel >> updateSelectedModule [
	self initializeSelectedModule
]
