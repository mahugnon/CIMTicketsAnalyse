Class {
	#name : #MainPresenterModel,
	#superclass : #Object,
	#instVars : [
		'modelData'
	],
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'as yet unclassified' }
MainPresenterModel >> avgTimeDevTicketsPerMonth: selectQuery [
	^ QueryAvgTimeDevGroupedByTime new
		runOn:
			(QueryTicketPerMonthClosing new
				runOn:
					(QueryClosed
						runOn: (QueryCleanData runOn: (selectQuery new runOn: self modelData))))
]

{ #category : #'as yet unclassified' }
MainPresenterModel >> avgTimeSpentTicketsPerMonth: selecQuery [
	^ QueryAvgTimeOnTicketsGroupedByTime
		runOn:
			(QueryTicketPerMonthClosing new
				fillGaps: true;
				ordered: true;
				runOn:
					(QueryClosed
						runOn: (selecQuery runOn: (QueryCleanData runOn: Tbl allTickets))))
]

{ #category : #'as yet unclassified' }
MainPresenterModel >> modelData [
	^ Tbl allTickets
]

{ #category : #'as yet unclassified' }
MainPresenterModel >> movingAvgTimeToOpenCloseTicketsPerMonthPerDev: selectQuery [
	^ QueryTimePerDev
		runOn:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeToOpenCloseTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (selectQuery runOn: (QueryCleanData runOn: Tbl allTickets))))))
]

{ #category : #'as yet unclassified' }
MainPresenterModel >> multiRegressionLineForMovingAvgTicketPerDevDataSet: selectQuery [
	| dataSet |
	dataSet := QueryMovingAverage new
		runOn:
			(QueryNumberOfDevInterventionPerMonth new
				devs: Tbl izyDevs rows;
				runOn:
					(QueryTicketPerMonthClosing new
						fillGaps: true;
						ordered: true;
						runOn:
							(QueryClosed
								runOn: (selectQuery runOn: (QueryCleanData runOn: Tbl allTickets))))).
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
MainPresenterModel >> timeSpentTicketsPerMonth [
	^ QueryTimeOnTicketsGroupedByTime
		runOn:
			(QueryTicketPerMonthClosing new
				fillGaps: true;
				ordered: true;
				runOn:
					(QueryBugsEvolutions
						runOn: (QueryClosed runOn: (QueryCleanData runOn: Tbl allTickets))))
]
