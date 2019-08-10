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
				runOn: (selectQuery runOn: self datawithCloseDate))
]

{ #category : #'as yet unclassified' }
MainPresenterModel >> avgTimeSpentTicketsPerMonth: selecQuery [
	^ QueryAvgTimeOnTicketsGroupedByTime
		runOn:
			(QueryTicketPerMonthClosing new
				fillGaps: true;
				ordered: true;
				runOn: (selecQuery runOn: self datawithCloseDate))
]

{ #category : #'as yet unclassified' }
MainPresenterModel >> datawithCloseDate [
	^ QueryClosed runOn: (QueryCleanData runOn: modelData)
]

{ #category : #initialization }
MainPresenterModel >> initialize [
	modelData := Tbl allTickets
]

{ #category : #'as yet unclassified' }
MainPresenterModel >> modelData [
	^ modelData
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
								runOn: (selectQuery runOn: self datawithCloseDate))))
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
						runOn: (selectQuery runOn: self datawithCloseDate))).
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
					(QueryBugsEvolutions runOn: self datawithCloseDate))
]
