Class {
	#name : #WebComponentModel,
	#superclass : #Object,
	#instVars : [
		'modelData',
		'listeners',
		'roassalView',
		'treeSingleFocus'
	],
	#category : #CIMTicketsAnalyseWeb
}

{ #category : #'as yet unclassified' }
WebComponentModel >> avgDevInterventionPerMonth: selectQuery [
	^ QueryNumberOfDevInterventionPerMonth new
		devs: Tbl tbl_devizy rows;
		runOn: (self ticketsPerMonth: selectQuery)
]

{ #category : #'as yet unclassified' }
WebComponentModel >> avgNodesToDic: aCollection [
	^ (aCollection collect: [ :node | node time -> node value ])
		asOrderedDictionary
]

{ #category : #'data sets' }
WebComponentModel >> avgTimeDevTicketsPerMonth: selectQuery [
	^ QueryAvgTimeDevGroupedByTime new
		runOn:
			(QueryTicketPerMonthClosing new
				runOn: (selectQuery runOn: self datawithCloseDate))
]

{ #category : #'as yet unclassified' }
WebComponentModel >> avgTimeDevTpsTotalMinusEstimTicketsPerMonth: selectQuery [
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
WebComponentModel >> avgTimeSpentTicketsPerMonth: selecQuery [
	^ QueryAvgTimeOnTicketsGroupedByTime
		runOn: (self ticketsPerMonth: selecQuery)
]

{ #category : #'data sets' }
WebComponentModel >> datawithCloseDate [
	^ QueryClosed runOn: (QueryCleanData runOn: modelData)
]

{ #category : #initialization }
WebComponentModel >> initialize [
	listeners := OrderedCollection new.
	modelData := CIMTicketGroupNode new tickets: Tbl tbl_ft rows
]

{ #category : #accessing }
WebComponentModel >> isEmpty [
	^ modelData isEmptyNode
]

{ #category : #'as yet unclassified' }
WebComponentModel >> linearRegressionCaracteristcs: aCollection [
	^ QueryLinearRegression new runOn1: aCollection
]

{ #category : #'data sets' }
WebComponentModel >> modelData [
	^ modelData
]

{ #category : #accessing }
WebComponentModel >> modelData: anObject [
	modelData := anObject.
	roassalView refresh
]

{ #category : #'as yet unclassified' }
WebComponentModel >> movingAvgTimeSpentTicketsPerMonth: selectQuery [
	^ QueryMovingAverage
		runOn: (self avgTimeDevTicketsPerMonth: selectQuery)
]

{ #category : #'data sets' }
WebComponentModel >> movingAvgTimeToOpenCloseTicketsPerMonthPerDev: selectQuery [
	^ QueryTimePerDev
		runOn:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeToOpenCloseTicketsGroupedByTime
						runOn: (self ticketsPerMonth: selectQuery)))
]

{ #category : #'data sets' }
WebComponentModel >> multiRegressionLineForMovingAvgTicketPerDevDataSet: selectQuery [
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

{ #category : #'data sets' }
WebComponentModel >> ticketPerFile [
	^ QueryTicketsForInterestionFileNames new
		runOn: modelData
		nameLime: 200
]

{ #category : #'as yet unclassified' }
WebComponentModel >> ticketsPerMonth: selectQuery [
	^ QueryTicketPerMonthClosing new
		fillGaps: true;
		ordered: true;
		runOn: (selectQuery runOn: self datawithCloseDate)
]
