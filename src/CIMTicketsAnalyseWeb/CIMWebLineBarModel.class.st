Class {
	#name : #CIMWebLineBarModel,
	#superclass : #Object,
	#instVars : [
		'selectedModule',
		'modelData',
		'modules',
		'dataSetForModules',
		'percentModuleTime'
	],
	#classInstVars : [
		'current'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebLineBarModel class >> current [
	current
		ifNil: [ current := self basicNew
				modelData:
					(QueryBugsEvolutions
						runOn: (CIMTicketGroupNode new tickets: Tbl tbl_ft rows));
				initialize ].
	^ current
]

{ #category : #initialization }
CIMWebLineBarModel class >> resetCurrent [
	<script>
	current := nil.
	self current
]

{ #category : #'as yet unclassified' }
CIMWebLineBarModel >> avgTimeDevModulePerYear: aModule selectQuery: selectQuery [
	^ self
		avgTimeDevTicketsPerYear: selectQuery
		for: (CIMTicketGroupNode new tickets: aModule tickets)
]

{ #category : #'data sets' }
CIMWebLineBarModel >> avgTimeDevTicketsPerYear: selectQuery for: aCIMTicketGroup [
	^ QueryAvgTimeDevGroupedByTime new
		runOn:
			(QueryTicketPerYearClosing new
				runOn: (selectQuery runOn: (self dataWithCloseDate: aCIMTicketGroup)))
]

{ #category : #'as yet unclassified' }
CIMWebLineBarModel >> computedatasSetForModule: aModule [
	| bugs evolutions x yBugs yEvolutions |
	bugs := self avgTimeDevModulePerYear: aModule selectQuery: QueryBugs.
	evolutions := self
		avgTimeDevModulePerYear: aModule
		selectQuery: QueryEvolutions.
	yBugs := bugs collect: #value.
	x := evolutions collect: [ :each | each time asString ].
	yEvolutions := evolutions collect: #value.
	bugs size > evolutions size
		ifTrue: [ x := bugs collect: [ :each | each time asString ].
			evolutions size + 1 to: bugs size do: [ :i | yEvolutions add: 0 ] ].
	bugs size < evolutions size
		ifTrue: [ bugs size + 1 to: evolutions size do: [ :i | yBugs add: 0 ] ].
	^ {x.
	('Bugs' -> yBugs).
	('Evolutions' -> yEvolutions)} asOrderedCollection
]

{ #category : #'as yet unclassified' }
CIMWebLineBarModel >> dataSetForModule: aModule [
	^ dataSetForModules at: aModule nom
]

{ #category : #'data sets' }
CIMWebLineBarModel >> dataWithCloseDate: aCIMTicketGroup [
	^ QueryClosed runOn: (QueryCleanData runOn: aCIMTicketGroup)
]

{ #category : #initialization }
CIMWebLineBarModel >> initialize [
	super initialize.
	self initializeModules.
	self initializeSelectedModule.
	self initializeDataSetForModules.
	self initializePercentModuleTime
]

{ #category : #initialization }
CIMWebLineBarModel >> initializeDataSetForModules [
	dataSetForModules := (modules
		collect: [ :module | module nom -> (self computedatasSetForModule: module) ])
		asOrderedDictionary
]

{ #category : #initialization }
CIMWebLineBarModel >> initializeModules [
	modules := modules := Tbl tbl_Module rows
]

{ #category : #'as yet unclassified' }
CIMWebLineBarModel >> initializePercentModuleTime [
	| total modulesNamesWithTimeSpent |
	modulesNamesWithTimeSpent := self moduleGroupByTime.
	total := (modulesNamesWithTimeSpent collect: #value) sum.
	percentModuleTime := modulesNamesWithTimeSpent
		collect:
			[ :ass | ass key -> ((ass value * 100 / total) asFloat truncateTo: 2) ]
]

{ #category : #initialization }
CIMWebLineBarModel >> initializeSelectedModule [
	selectedModule := Tbl tbl_Module moduleNamed: 'IZY Protect'
]

{ #category : #accessing }
CIMWebLineBarModel >> modelData: aCIMTicketGroupNode [
	modelData := aCIMTicketGroupNode
]

{ #category : #'as yet unclassified' }
CIMWebLineBarModel >> moduleGroupByTime [
	^ (((modules reject: [ :each | each nom = 'IZY Protect' ])
		collect: [ :module | 
			module nom
				->
					(QueryTicketsTimeDev
						runOn:
							(QueryBugsEvolutions
								runOn: (CIMTicketGroupNode new tickets: module tickets))) ])
		sorted: [ :a :b | a value > b value ]) asOrderedCollection
]

{ #category : #accessing }
CIMWebLineBarModel >> modules [
	^ modules
]

{ #category : #'as yet unclassified' }
CIMWebLineBarModel >> percentModuleTime [
	^ percentModuleTime
]

{ #category : #accessing }
CIMWebLineBarModel >> selectedModule [
	^ selectedModule
]

{ #category : #accessing }
CIMWebLineBarModel >> selectedModule: anObject [
	selectedModule := anObject
]
