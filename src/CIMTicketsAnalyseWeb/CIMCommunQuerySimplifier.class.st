Class {
	#name : #CIMCommunQuerySimplifier,
	#superclass : #Object,
	#instVars : [
		'modelData',
		'modulesNamesWithTimeSpent',
		'modules',
		'selectedModule',
		'avgTimeDevTpsTotalMinusEstimTicketsPerYear'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #'as yet unclassified' }
CIMCommunQuerySimplifier >> avgDevInterventionPerMonth: selectQuery [
	^ QueryNumberOfDevInterventionPerMonth new
		devs: Tbl tbl_devizy rows;
		runOn: (self ticketsPerMonth: selectQuery)
]

{ #category : #'data sets' }
CIMCommunQuerySimplifier >> avgTimeDevTicketsPerMonth: selectQuery [
	^ QueryAvgTimeDevGroupedByTime new
		runOn:
			(QueryTicketPerMonthClosing new
				runOn: (selectQuery runOn: self dataWithCloseDate))
]

{ #category : #'as yet unclassified' }
CIMCommunQuerySimplifier >> avgTimeDevTpsTotalMinusEstimTicketsPerMonth: selectQuery [
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

{ #category : #'as yet unclassified' }
CIMCommunQuerySimplifier >> avgTimeDevTpsTotalMinusEstimTicketsPerYear [
	^ avgTimeDevTpsTotalMinusEstimTicketsPerYear
]

{ #category : #'data sets' }
CIMCommunQuerySimplifier >> avgTimeSpentTicketsPerMonth: selecQuery [
	^ QueryAvgTimeOnTicketsGroupedByTime
		runOn: (self ticketsPerMonth: selecQuery)
]

{ #category : #initialization }
CIMCommunQuerySimplifier >> initialize [
	modelData := QueryBugsEvolutions
		runOn: (CIMTicketGroupNode new tickets: Tbl tbl_ft rows).
	modules := Tbl tbl_Module rows
]

{ #category : #accessing }
CIMCommunQuerySimplifier >> isEmpty [
	^ modelData isEmptyNode
]

{ #category : #'data sets' }
CIMCommunQuerySimplifier >> modelData [
	^ modelData
]

{ #category : #accessing }
CIMCommunQuerySimplifier >> modelData: anObject [
	modelData := anObject
]

{ #category : #'as yet unclassified' }
CIMCommunQuerySimplifier >> moduleGroupByBugsTime [
	^ (Tbl tbl_Module rows
		collect: [ :module | 
			module nom
				->
					(QueryTicketsTimeDev
						runOn: (QueryBugs runOn: (CIMTicketGroupNode new tickets: module tickets))) ])
		sorted: [ :a :b | a value > b value ]
]

{ #category : #accessing }
CIMCommunQuerySimplifier >> modules [
	^ modules
]

{ #category : #accessing }
CIMCommunQuerySimplifier >> modulesNamesWithTimeSpent [
	modulesNamesWithTimeSpent
		ifNil: [ modulesNamesWithTimeSpent := self moduleGroupByTime ].
	^ modulesNamesWithTimeSpent
]

{ #category : #'as yet unclassified' }
CIMCommunQuerySimplifier >> movingAvgTimeSpentTicketsPerMonth: selectQuery [
	^ QueryMovingAverage
		runOn: (self avgTimeDevTicketsPerMonth: selectQuery)
]

{ #category : #'data sets' }
CIMCommunQuerySimplifier >> movingAvgTimeToOpenCloseTicketsPerMonthPerDev: selectQuery [
	^ QueryTimePerDev
		runOn:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeToOpenCloseTicketsGroupedByTime
						runOn: (self ticketsPerMonth: selectQuery)))
]

{ #category : #'data sets' }
CIMCommunQuerySimplifier >> multiRegressionLineForMovingAvgTicketPerDevDataSet: selectQuery [
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
CIMCommunQuerySimplifier >> percentModuleBugsTime [
	| total |
	total := (self modulesNamesWithTimeSpent collect: #value) sum.
	^ self modulesNamesWithTimeSpent
		collect:
			[ :ass | ass key -> ((ass value * 100 / total) asFloat truncateTo: 2) ]
]

{ #category : #'data sets' }
CIMCommunQuerySimplifier >> ticketPerFile [
	^ QueryTicketsForInterestionFileNames new
		runOn: modelData
		nameLime: 200
]

{ #category : #'as yet unclassified' }
CIMCommunQuerySimplifier >> ticketsPerMonth: selectQuery [
	^ QueryTicketPerMonthClosing new
		fillGaps: true;
		ordered: true;
		runOn: (selectQuery runOn: self dataWithCloseDate)
]
