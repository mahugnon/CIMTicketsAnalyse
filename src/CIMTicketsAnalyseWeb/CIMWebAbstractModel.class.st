Class {
	#name : #CIMWebAbstractModel,
	#superclass : #Object,
	#instVars : [
		'modelData',
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

{ #category : #'data sets' }
CIMWebAbstractModel >> avgTimeDevTicketsPerMonth: selectQuery [
	^ QueryAvgTimeDevGroupedByTime new
		runOn:
			(QueryTicketPerMonthClosing new
				runOn: (selectQuery runOn: self datawithCloseDate))
]

{ #category : #'as yet unclassified' }
CIMWebAbstractModel >> avgTimeDevTpsTotalMinusEstimTicketsPerMonth: selectQuery [
	^ (QueryMovingAverage
		runOn:
			(QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn: (QueryRejectNilEstimation runOn: (selectQuery new runOn: modelData))))))
		reject: [ :serie | serie asString = '-125526.52173913' ]
]

{ #category : #'data sets' }
CIMWebAbstractModel >> avgTimeSpentTicketsPerMonth: selecQuery [
	^ QueryAvgTimeOnTicketsGroupedByTime
		runOn: (self ticketsPerMonth: selecQuery)
]

{ #category : #'data sets' }
CIMWebAbstractModel >> datawithCloseDate [
	^ QueryClosed runOn: (QueryCleanData runOn: modelData)
]

{ #category : #initialization }
CIMWebAbstractModel >> initialize [
	modelData := QueryBugsEvolutions
		runOn: (CIMTicketGroupNode new tickets: Tbl tbl_ft rows)
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
	modules := ((Tbl tbl_Module rows
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
CIMWebAbstractModel >> modules: anObject [
	modules := anObject
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
	modules ifNil: [ modules := self moduleGroupByTime ].
	total := (modules collect: #value) sum.
	^ modules
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
		runOn: (selectQuery runOn: self datawithCloseDate)
]
