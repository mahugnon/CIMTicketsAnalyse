Class {
	#name : #CIMWebAbstractModel,
	#superclass : #Object,
	#instVars : [
		'modelData',
		'modulesNamesWithTimeSpent',
		'modules'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> avgDevInterventionPerMonth: selectQuery [
	^ QueryNumberOfDevInterventionPerMonth new
		devs: Tbl tbl_devizy rows;
		runOn: (self ticketsPerMonth: selectQuery)
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> avgNodesToDic: aCollection [
	^ (aCollection collect: [ :node | node time -> node value ])
		asOrderedDictionary
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> avgTimeDevModulePerYear: aModule selectQuery: selectQuery [
	^ self
		avgTimeDevTicketsPerYear: selectQuery
		for: (CIMTicketGroupNode new tickets: aModule tickets)
]

{ #category : #'data sets' }
CIMWebAbstractModel >> avgTimeDevTicketsPerMonth: selectQuery [
	^ QueryAvgTimeDevGroupedByTime new
		runOn:
			(QueryTicketPerMonthClosing new
				runOn: (selectQuery runOn: self dataWithCloseDate))
]

{ #category : #'data sets' }
CIMWebAbstractModel >> avgTimeDevTicketsPerYear: selectQuery [
	^ QueryAvgTimeDevGroupedByTime new
		runOn:
			(QueryTicketPerYearClosing new
				runOn: (selectQuery runOn: self dataWithCloseDate))
]

{ #category : #'data sets' }
CIMWebAbstractModel >> avgTimeDevTicketsPerYear: selectQuery for: aCIMTicketGroup [
	^ QueryAvgTimeDevGroupedByTime new
		runOn:
			(QueryTicketPerYearClosing new
				runOn: (selectQuery runOn: (self dataWithCloseDate: aCIMTicketGroup)))
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> avgTimeDevTpsTotalMinusEstimTicketsPerMonth: selectQuery [
	^ (QueryMovingAverage
		runOn:
			(QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(selectQuery
								runOn: (QueryRejectNilEstimation runOn: ( QueryClosed new runOn: modelData))))))
		reject: [ :serie | serie asString = '-125526.52173913' ]
]

{ #category : #'data sets' }
CIMWebAbstractModel >> avgTimeRCTestTicketsPerYear: selectQuery [
	^ QueryAvgTicketsTimeRCTestGroupedByTime new
		runOn:
			(QueryTicketPerYearClosing new
				runOn: (selectQuery runOn: self dataWithCloseDate))
]

{ #category : #'data sets' }
CIMWebAbstractModel >> avgTimeSpentTicketsPerMonth: selecQuery [
	^ QueryAvgTimeOnTicketsGroupedByTime
		runOn: (self ticketsPerMonth: selecQuery)
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> dataSetForModule: aModule [
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

{ #category : #'data sets' }
CIMWebAbstractModel >> dataWithCloseDate [
	^ QueryClosed runOn: (QueryCleanData runOn: modelData)
]

{ #category : #'data sets' }
CIMWebAbstractModel >> dataWithCloseDate: aCIMTicketGroup [
	^ QueryClosed runOn: (QueryCleanData runOn: aCIMTicketGroup)
]

{ #category : #initialization }
CIMWebAbstractModel >> initialize [
	modelData := QueryBugsEvolutions
		runOn: (CIMTicketGroupNode new tickets: Tbl tbl_ft rows).
	modules := Tbl tbl_Module rows
]

{ #category : #accessing }
CIMWebAbstractModel >> isEmpty [
	^ modelData isEmptyNode
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> linearRegressionCaracteristcs: aCollection [
	^ QueryLinearRegression new runOn1: aCollection
]

{ #category : #'data sets' }
CIMWebAbstractModel >> modelData [
	^ modelData
]

{ #category : #accessing }
CIMWebAbstractModel >> modelData: anObject [
	modelData := anObject
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> moduleGroupByBugsTime [
	^ (Tbl tbl_Module rows
		collect: [ :module | 
			module nom
				->
					(QueryTicketsTimeDev
						runOn: (QueryBugs runOn: (CIMTicketGroupNode new tickets: module tickets))) ])
		sorted: [ :a :b | a value > b value ]
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> moduleGroupByTime [
	^ ((Tbl tbl_Module rows
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
CIMWebAbstractModel >> modules [
	^ modules
]

{ #category : #accessing }
CIMWebAbstractModel >> modulesNamesWithTimeSpent [
	modulesNamesWithTimeSpent
		ifNil: [ modulesNamesWithTimeSpent := self moduleGroupByTime ].
	^ modulesNamesWithTimeSpent
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> movingAvgTimeSpentTicketsPerMonth: selectQuery [
	^ QueryMovingAverage
		runOn: (self avgTimeDevTicketsPerMonth: selectQuery)
]

{ #category : #'data sets' }
CIMWebAbstractModel >> movingAvgTimeToOpenCloseTicketsPerMonthPerDev: selectQuery [
	^ QueryTimePerDev
		runOn:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeToOpenCloseTicketsGroupedByTime
						runOn: (self ticketsPerMonth: selectQuery)))
]

{ #category : #'data sets' }
CIMWebAbstractModel >> multiRegressionLineForMovingAvgTicketPerDevDataSet: selectQuery [
	| dataSet |
	dataSet := QueryMovingAverage new
		runOn:
			(QueryNumberOfDevInterventionPerMonth new
				devs: Tbl izyDevs rows;
				runOn: (self ticketsPerMonth: selectQuery)).
	^ {dataSet.
	(QueryCutTimeSerie new
		cut: dataSet
		before: (Date asMonth: 07 inYear: 2007)).
	(QueryCutTimeSerie new
		cut: dataSet
		between: (Date asMonth: 07 inYear: 2007)
		and: (Date asMonth: 05 inYear: 2014)).
	(QueryCutTimeSerie new
		cut: dataSet
		after: (Date asMonth: 05 inYear: 2014))} asOrderedCollection
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> percentModuleBugsTime [
	| total |
	total := (self modulesNamesWithTimeSpent collect: #value) sum.
	^ self modulesNamesWithTimeSpent
		collect:
			[ :ass | ass key -> ((ass value * 100 / total) asFloat truncateTo: 2) ]
]

{ #category : #'data sets' }
CIMWebAbstractModel >> ticketPerFile [
	^ QueryTicketsForInterestionFileNames new
		runOn: modelData
		nameLime: 200
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> ticketsPerMonth: selectQuery [
	^ QueryTicketPerMonthClosing new
		fillGaps: true;
		ordered: true;
		runOn: (selectQuery runOn: self dataWithCloseDate)
]
