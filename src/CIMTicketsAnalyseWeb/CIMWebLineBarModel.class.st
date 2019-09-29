Class {
	#name : #CIMWebLineBarModel,
	#superclass : #CIMWebAbstractModel,
	#instVars : [
		'percentModuleTime',
		'avgTimeDevTpsTotalMinusEstimTicketsPerYear',
		'avgTimeRCTestTicketsPerYear'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #'private - utility' }
CIMWebLineBarModel >> avgNodesToDic: aCollection [
	^ (aCollection collect: [ :node | node time -> node value ])
		asOrderedDictionary
]

{ #category : #'private - utility' }
CIMWebLineBarModel >> avgTimeDevModulePerYear: aModule selectQuery: selectQuery [
	^ self
		avgTimeDevTicketsPerYear: selectQuery
		for: (CIMTicketGroupNode new tickets: aModule tickets)
]

{ #category : #'data sets' }
CIMWebLineBarModel >> avgTimeDevTicketsPerYear: selectQuery [
	^ QueryAvgTimeDevGroupedByTime new
		runOn:
			(QueryTicketPerYearClosing new
				runOn: (selectQuery runOn: self dataWithCloseDate))
]

{ #category : #'data sets' }
CIMWebLineBarModel >> avgTimeDevTicketsPerYear: selectQuery for: aCIMTicketGroup [
	^ QueryAvgTimeDevGroupedByTime new
		runOn:
			(QueryTicketPerYearClosing new
				runOn: (selectQuery runOn: (self dataWithCloseDate: aCIMTicketGroup)))
]

{ #category : #'private - utility' }
CIMWebLineBarModel >> avgTimeDevTpsTotalMinusEstimTicketsPerYear [
	^ avgTimeDevTpsTotalMinusEstimTicketsPerYear
]

{ #category : #'private - utility' }
CIMWebLineBarModel >> avgTimeDevTpsTotalMinusEstimTicketsPerYear: selectQuery [
	^ (QueryMovingAverage
		runOn:
			(QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime new
				runOn:
					(QueryTicketPerYearClosing
						runOn:
							(selectQuery
								runOn:
									(QueryRejectNilEstimation
										runOn: (QueryClosed new runOn: self modelData))))))
		reject: [ :serie | serie asString = '-125526.52173913' ]
]

{ #category : #'data sets' }
CIMWebLineBarModel >> avgTimeRCTestTicketsPerYear [
	^ avgTimeRCTestTicketsPerYear
]

{ #category : #'data sets' }
CIMWebLineBarModel >> avgTimeRCTestTicketsPerYear: selectQuery [
	^ QueryAvgTicketsTimeRCTestGroupedByTime new
		runOn:
			(QueryTicketPerYearClosing new
				runOn: (selectQuery runOn: self dataWithCloseDate))
]

{ #category : #accessing }
CIMWebLineBarModel >> dataSetForModule: aModule [
	^ dataSetForModules at: aModule nom
]

{ #category : #'data sets' }
CIMWebLineBarModel >> dataWithCloseDate [
	^ QueryClosed runOn: (QueryCleanData runOn: self modelData)
]

{ #category : #'data sets' }
CIMWebLineBarModel >> dataWithCloseDate: aCIMTicketGroup [
	^ QueryClosed runOn: (QueryCleanData runOn: aCIMTicketGroup)
]

{ #category : #initialization }
CIMWebLineBarModel >> initialize [
	super initialize.
	self initializePercentModuleTime.
	self initializeAvgTimeDevTpsTotalMinusEstimTicketsPerYear.
	self initializeAvgTimeRCTestTicketsPerYear
]

{ #category : #'private - utility' }
CIMWebLineBarModel >> initializeAvgTimeDevTpsTotalMinusEstimTicketsPerYear [
	avgTimeDevTpsTotalMinusEstimTicketsPerYear := ((self
		avgTimeDevTpsTotalMinusEstimTicketsPerYear: QueryBugsEvolutions)
		collect: [ :node | node time -> node value ]) asOrderedDictionary
]

{ #category : #initialization }
CIMWebLineBarModel >> initializeAvgTimeRCTestTicketsPerYear [
	avgTimeRCTestTicketsPerYear := ((QueryAvgTicketsTimeRCTestGroupedByTime
		new
		runOn: (QueryTicketPerYearClosing new runOn: self dataWithCloseDate))
		collect: [ :node | node time -> node value ]) asOrderedDictionary
]

{ #category : #'private - utility' }
CIMWebLineBarModel >> initializePercentModuleTime [
	| modulesNamesWithTimeSpent totalInDays |
	modulesNamesWithTimeSpent := self moduleGroupByTime.
	totalInDays := (modulesNamesWithTimeSpent collect: #value) sum.
	percentModuleTime := (modulesNamesWithTimeSpent
		collect:
			[ :ass | ass key -> ((ass value * 100 / totalInDays) asFloat truncateTo: 2) ])
		select: [ :ass | ass value >= 2 ]
]

{ #category : #'private - utility' }
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

{ #category : #'private - utility' }
CIMWebLineBarModel >> percentModuleTime [
	^ percentModuleTime
]
