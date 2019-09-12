Class {
	#name : #RoassalPresenterModel,
	#superclass : #Object,
	#instVars : [
		'modelData',
		'listeners',
		'parentModel'
	],
	#category : #'CIMTicketsDataModelGui-Models'
}

{ #category : #'as yet unclassified' }
RoassalPresenterModel >> addListener: aListener [
	listeners add: aListener
]

{ #category : #'as yet unclassified' }
RoassalPresenterModel >> avgDevInterventionPerMonth: selectQuery [
	^ QueryNumberOfDevInterventionPerMonth new
		devs: Tbl izyDevs rows;
		runOn: (self ticketsPerMonth: selectQuery)
]

{ #category : #'data sets' }
RoassalPresenterModel >> avgTimeDevTicketsPerMonth: selectQuery [
	^ QueryAvgTimeDevGroupedByTime new
		runOn:
			(QueryTicketPerMonthClosing new
				runOn: (selectQuery runOn: self datawithCloseDate))
]

{ #category : #'as yet unclassified' }
RoassalPresenterModel >> avgTimeDevTpsTotalMinusEstimTicketsPerMonth: selectQuery [
	^ QueryMovingAverage
		runOn:
			(QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn: (QueryRejectNilEstimation runOn: (selectQuery new runOn: modelData)))))
]

{ #category : #'data sets' }
RoassalPresenterModel >> avgTimeSpentTicketsPerMonth: selecQuery [
	^ QueryAvgTimeOnTicketsGroupedByTime
		runOn: (self ticketsPerMonth: selecQuery)
]

{ #category : #'data sets' }
RoassalPresenterModel >> datawithCloseDate [
	^ QueryClosed runOn: (QueryCleanData runOn: modelData)
]

{ #category : #initialization }
RoassalPresenterModel >> initialize [
	listeners := OrderedCollection new.
	modelData := CIMTicketGroupNode new
		tickets: Tbl allTickets;
		yourself
]

{ #category : #'data sets' }
RoassalPresenterModel >> modelData [
	^ modelData
]

{ #category : #accessing }
RoassalPresenterModel >> modelData: anObject [
	modelData := anObject
]

{ #category : #'as yet unclassified' }
RoassalPresenterModel >> movingAvgTimeSpentTicketsPerMonth: selectQuery [
	^ QueryMovingAverage
		runOn: (self avgTimeDevTicketsPerMonth: selectQuery)
]

{ #category : #'data sets' }
RoassalPresenterModel >> movingAvgTimeToOpenCloseTicketsPerMonthPerDev: selectQuery [
	^ QueryTimePerDev
		runOn:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeToOpenCloseTicketsGroupedByTime
						runOn: (self ticketsPerMonth: selectQuery)))
]

{ #category : #'data sets' }
RoassalPresenterModel >> multiRegressionLineForMovingAvgTicketPerDevDataSet: selectQuery [
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
RoassalPresenterModel >> notifyAll [
	listeners do: [ :listener | listener update ]
]

{ #category : #'as yet unclassified' }
RoassalPresenterModel >> removeListener: aListener [
	listeners remove: aListener
]

{ #category : #'data sets' }
RoassalPresenterModel >> ticketPerFile [
	^ QueryTicketsForInterestionFileNames new
		runOn: modelData
		nameLime: 200
]

{ #category : #'as yet unclassified' }
RoassalPresenterModel >> ticketsPerMonth: selectQuery [
	^ QueryTicketPerMonthClosing new
		fillGaps: true;
		ordered: true;
		runOn: (selectQuery runOn: self datawithCloseDate)
]
