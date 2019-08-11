Class {
	#name : #MainPresenterModel,
	#superclass : #Object,
	#instVars : [
		'modelData'
	],
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #'data sets' }
MainPresenterModel >> avgTimeDevTicketsPerMonth: selectQuery [
	^ QueryAvgTimeDevGroupedByTime new
		runOn:
			(QueryTicketPerMonthClosing new
				runOn: (selectQuery runOn: self datawithCloseDate))
]

{ #category : #'data sets' }
MainPresenterModel >> avgTimeSpentTicketsPerMonth: selecQuery [
	^ QueryAvgTimeOnTicketsGroupedByTime
		runOn:
			(QueryTicketPerMonthClosing new
				fillGaps: true;
				ordered: true;
				runOn: (selecQuery runOn: self datawithCloseDate))
]

{ #category : #'data sets' }
MainPresenterModel >> datawithCloseDate [
	^ QueryClosed runOn: (QueryCleanData runOn: modelData)
]

{ #category : #'data sets' }
MainPresenterModel >> datawithCloseDate: data [
	^ QueryClosed runOn: (QueryCleanData runOn: data)
]

{ #category : #initialization }
MainPresenterModel >> initialize [
	modelData := Tbl allTickets
]

{ #category : #'data sets' }
MainPresenterModel >> modelData [
	^ modelData
]

{ #category : #'data sets' }
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

{ #category : #'data sets' }
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

{ #category : #'data sets' }
MainPresenterModel >> ticketPerFile [
	^ QueryTicketsForInterestionFileNames new
		runOn: modelData
		nameLime: 200
]

{ #category : #'data sets' }
MainPresenterModel >> timeSpentTicketsPerMonth [
	^ QueryTimeOnTicketsGroupedByTime
		runOn:
			(QueryTicketPerMonthClosing new
				fillGaps: true;
				ordered: true;
				runOn:
					(QueryBugsEvolutions runOn: self datawithCloseDate))
]
