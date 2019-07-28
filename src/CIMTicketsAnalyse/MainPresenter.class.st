Class {
	#name : #MainPresenter,
	#superclass : #Object,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #drawing }
MainPresenter >> draw2LineAvgTimeDevTpsTotalMinusEstimBugsTicketsPerMonth [
	^ DevTpsTotalMinusTpsEstimChart new
		draw:
			((QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn:
									(QueryRejectNilEstimation runOn: (QueryBugs new runOn: Tbl allTickets))))) reject:[:serie| serie asString  = '-125526.52173913'] )
]

{ #category : #drawing }
MainPresenter >> draw2LineAvgTimeDevTpsTotalMinusEstimEvolutionsTicketsPerMonth [
	^ DevTpsTotalMinusTpsEstimChart  new 
		draw:
			(QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn:
									(QueryRejectNilEstimation
										runOn: (QueryEvolutions new runOn: Tbl allTickets)))))
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeDevBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMDayFormater new;
		timeSerie:
			(QueryAvgTimeDevGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn: (QueryCleanData runOn: (QueryBugs new runOn: Tbl allTickets)))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeDevEvolutionsTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMDayFormater new;
		timeSerie:
			(QueryAvgTimeDevGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn: (QueryCleanData runOn: (QueryEvolutions new runOn: Tbl allTickets)))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeDevEvolutionsTicketsPerMonthPerDev [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		timeSerie:
			(QueryTimePerDev
				runOn:
					(QueryAvgTimeDevGroupedByTime new
						runOn:
							(QueryTicketPerMonthClosing new
								runOn:
									(QueryClosed
										runOn: (QueryCleanData runOn: (QueryEvolutions new runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeDevTpsTotalMinusEstimBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMHourFormater new;
		timeSerie:
			(QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn:
									(QueryRejectNilEstimation runOn: (QueryBugs new runOn: Tbl allTickets)))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeDevTpsTotalMinusEstimEvolutionsTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		timeSerie:
			(QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn:
									(QueryRejectNilEstimation
										runOn: (QueryEvolutions new runOn: Tbl allTickets)))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeSpentBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMHourFormater new;
		maxY: 162271.2;
		timeSerie:
			(QueryAvgTimeOnTicketsGroupedByTime
				runOn:
					(QueryTicketPerMonthClosing new
						fillGaps: true;
						ordered: true;
						runOn:
							(QueryClosed
								runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets)))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeSpentBugsTicketsPerMonthPerDev [
	^ BugsChart new
		yFormateur: CIMMinuteFormater new;
		timeSerie:
			(QueryTimePerDev
				runOn:
					(QueryAvgTimeOnTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeSpentEvolutionTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		timeSerie:
			(QueryAvgTimeOnTicketsGroupedByTime
				runOn:
					(QueryTicketPerMonthClosing new
						fillGaps: true;
						ordered: true;
						runOn:
							(QueryClosed
								runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets)))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeSpentEvolutionTicketsPerMonthPerDev [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		timeSerie:
			(QueryTimePerDev
				runOn:
					(QueryAvgTimeOnTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeSpentTicketsPerMonthPerDev [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		perDev: true;
		timeSerie:
			(QueryTimePerDev
				runOn:
					(QueryTimeOnTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn: (QueryClosed runOn: (QueryCleanData runOn: Tbl allTickets)))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeTestBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMMinuteFormater new;
		timeSerie:
			(QueryAvgTimeTestGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn: (QueryBugs runOn: (QueryCleanData new runOn: Tbl allTickets)))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeTestEvolutionsTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMMinuteFormater;
		timeSerie:
			(QueryAvgTimeTestGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn: (QueryCleanData runOn: (QueryEvolutions new runOn: Tbl allTickets)))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeToOpenCloseBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMDayFormater new;
		timeSerie:
			(QueryAvgTimeToOpenCloseTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn: (QueryBugs new runOn: Tbl allTickets)));
		draw
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeToOpenCloseEvolutionTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMDayFormater new;
		timeSerie:
			(QueryAvgTimeToOpenCloseTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn: (QueryEvolutions new runOn: Tbl allTickets)));
		draw
]

{ #category : #'as yet unclassified' }
MainPresenter >> drawMovingAvgTicketBugsPerDev [
	^ DevChart new
		timeSerie:
			(QueryMovingAverage new
				runOn:
					(QueryNumberOfDevInterventionPerMonth new
						devs: (Tbl tables at: 12) rows;
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeDevBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMDayFormater new;
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeDevGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeDevEvolutionTicketsPerMonth [
	| data |
	data := QueryTicketPerMonthClosing new
		fillGaps: true;
		ordered: true;
		runOn:
			(QueryClosed
				runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets))).
	^ EvolutionChart new
		yFormateur: CIMDayFormater new;
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeDevGroupedByTime
						runOn:
							(data associations
								reject: [ :ass | ass key = (Date asMonth: 9 inYear: 2015) ])
								asOrderedDictionary));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeDevTpsTotalMinusEstimEvolutionsTicketsPerMonth [
	^ EvolutionChart new
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime new
						runOn:
							(QueryTicketPerMonthClosing new
								runOn:
									(QueryClosed
										runOn:
											(QueryRejectNilEstimation
												runOn: (QueryEvolutions new runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeSpentBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMHourFormater new;
		maxY: 114964.9740659338;
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeOnTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeSpentBugsTicketsPerMonthPerDev [
	^ BugsChart new
		yFormateur: CIMHourFormater new;
		perDev: true;
		timeSerie:
			(QueryTimePerDev
				runOn:
					(QueryMovingAverage
						runOn:
							(QueryAvgTimeOnTicketsGroupedByTime
								runOn:
									(QueryTicketPerMonthClosing new
										fillGaps: true;
										ordered: true;
										runOn:
											(QueryClosed
												runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets)))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeSpentEvolutionTicketsPerMonth [
	^ EvolutionChart new
		yTranslation: 16160.221023768798;
		maxY: 114964.9740659338;
		yFormateur: CIMHourFormater new;
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeOnTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeSpentEvolutionTicketsPerMonthPerDev [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		perDev: true;
		timeSerie:
			(QueryTimePerDev
				runOn:
					(QueryMovingAverage
						runOn:
							(QueryAvgTimeOnTicketsGroupedByTime
								runOn:
									(QueryTicketPerMonthClosing new
										fillGaps: true;
										ordered: true;
										runOn:
											(QueryClosed
												runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets)))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeSpentTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		perDev: true;
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeOnTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn: (QueryClosed runOn: (QueryCleanData runOn: Tbl allTickets)))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeTestBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMMinuteFormater new;
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeTestGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeTestBugsTicketsPerMonthPerDev [
	^ BugsChart new
		yFormateur: CIMMinuteFormater new;
		timeSerie:
			(QueryTimePerDev
				runOn:
					(QueryMovingAverage
						runOn:
							(QueryAvgTimeTestGroupedByTime
								runOn:
									(QueryTicketPerMonthClosing new
										fillGaps: true;
										ordered: true;
										runOn:
											(QueryClosed
												runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets)))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeTestEvolutionTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMMinuteFormater new;
		yTranslation: 2391.1500956546124;
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeTestGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeTestEvolutionTicketsPerMonthPerDev [
	^ EvolutionChart new
		yFormateur: CIMMinuteFormater new;
		timeSerie:
			(QueryTimePerDev
				runOn:
					(QueryMovingAverage
						runOn:
							(QueryAvgTimeTestGroupedByTime
								runOn:
									(QueryTicketPerMonthClosing new
										fillGaps: true;
										ordered: true;
										runOn:
											(QueryClosed
												runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets)))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeToOpenCloseBugsTicketsPerMonth [
	^ BugsChart new
		minY: 6e6;
		maxY: 1.6e7;
		yFormateur: CIMDayFormater new;
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeToOpenCloseTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeToOpenCloseBugsTicketsPerMonthPerDev [
	^ BugsChart new
		yFormateur: CIMDayFormater new;
		timeSerie:
			(QueryTimePerDev
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
												runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets)))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeToOpenCloseEvolutionTicketsPerMonth [
	^ EvolutionChart new
		maxY: 1.6e7;
		yFormateur: CIMDayFormater new;
		timeSerie:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeToOpenCloseTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeToOpenCloseEvolutionTicketsPerMonthPerDev [
	^ EvolutionChart new
		yFormateur: CIMDayFormater new;
		perDev: true;
		timeSerie:
			(QueryTimePerDev
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
												runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets)))))));
		draw
]

{ #category : #drawing }
MainPresenter >> drawMovingTimeSpentTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		timeSerie:
			(QueryTimeOnTicketsGroupedByTime
				runOn:
					(QueryTicketPerMonthClosing new
						fillGaps: true;
						ordered: true;
						runOn: (QueryClosed runOn: (QueryCleanData runOn: Tbl allTickets))));
		draw
]
