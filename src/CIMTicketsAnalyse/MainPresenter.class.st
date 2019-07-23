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
	^ LineChart new
		title: 'AvgTimeDevBugsTicketsPerMonth';
		draw:
			(QueryAvgTimeDevGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn: (QueryCleanData runOn: (QueryBugs new runOn: Tbl allTickets)))))
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeDevEvolutionsTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMDayFormater new;
		draw:
			(QueryAvgTimeDevGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn: (QueryCleanData runOn: (QueryEvolutions new runOn: Tbl allTickets)))))
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeDevEvolutionsTicketsPerMonthPerDev [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		draw:
			(QueryTimePerDev
				runOn:
					(QueryAvgTimeDevGroupedByTime new
						runOn:
							(QueryTicketPerMonthClosing new
								runOn:
									(QueryClosed
										runOn: (QueryCleanData runOn: (QueryEvolutions new runOn: Tbl allTickets))))))
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeDevTpsTotalMinusEstimBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMHourFormater new;
		draw:
			(QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn:
									(QueryRejectNilEstimation runOn: (QueryBugs new runOn: Tbl allTickets)))))
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeDevTpsTotalMinusEstimEvolutionsTicketsPerMonth [
	^ LineChart new title: 'AvgTimeDevTpsTotalMinusEstimEvolutionsTicketsPerMonth';
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
MainPresenter >> drawAvgTimeSpentBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMHourFormater new;
		draw:
			(QueryAvgTimeOnTicketsGroupedByTime
				runOn:
					(QueryTicketPerMonthClosing new
						fillGaps: true;
						ordered: true;
						runOn:
							(QueryClosed
								runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets)))))
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeSpentBugsTicketsPerMonthPerDev [
	^ BugsChart new
		yFormateur: CIMMinuteFormater new;
		draw:
			(QueryTimePerDev
				runOn:
					(QueryAvgTimeOnTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets))))))
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeSpentEvolutionTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		draw:
			(QueryAvgTimeOnTicketsGroupedByTime
				runOn:
					(QueryTicketPerMonthClosing new
						fillGaps: true;
						ordered: true;
						runOn:
							(QueryClosed
								runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets)))))
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeSpentEvolutionTicketsPerMonthPerDev [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		draw:
			(QueryTimePerDev
				runOn:
					(QueryAvgTimeOnTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets))))))
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeSpentTicketsPerMonthPerDev [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		perDev: true;
		draw:
			(QueryTimePerDev
				runOn:
					(QueryTimeOnTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed runOn: (QueryCleanData runOn: Tbl allTickets)))))
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeTestBugsTicketsPerMonth [
	^ BugsChart new 
	yFormateur: CIMMinuteFormater new;
		draw:
			(QueryAvgTimeTestGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn: (QueryBugs runOn: (QueryCleanData new runOn: Tbl allTickets))))). 
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeTestEvolutionsTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMMinuteFormater;
		draw:
			(QueryAvgTimeTestGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn: (QueryCleanData runOn: (QueryEvolutions new runOn: Tbl allTickets)))))
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeToOpenCloseBugsTicketsPerMonth [
	^ LineChart new
		title: 'AvgTimeToOpenCloseBugsTicketsPerMonth';
		draw:
			(QueryAvgTimeToOpenCloseTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn: (QueryBugs new runOn: Tbl allTickets)))
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeToOpenCloseEvolutionTicketsPerMonth [
	^ LineChart new
		title: 'Moyenne de temps pour fermer un Tickets Evolution par mois';
		draw:
			(QueryAvgTimeToOpenCloseTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn: (QueryEvolutions new runOn: Tbl allTickets)))
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeDevBugsTicketsPerMonth [
	^ LineChart new
		title: 'Moyenne temps de developpement sur les tickets Bugs par mois';
		draw:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeDevGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets))))))
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
	^ LineChart new
		title: 'Moyenne temps de developpement sur les tickets Evolutions par mois';
		draw:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeDevGroupedByTime
						runOn:
							(data associations
								reject: [ :ass | ass key = (Date asMonth: 9 inYear: 2015) ])
								asOrderedDictionary))
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeDevTpsTotalMinusEstimEvolutionsTicketsPerMonth [
	^ EvolutionChart new
		draw:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime new
						runOn:
							(QueryTicketPerMonthClosing new
								runOn:
									(QueryClosed
										runOn:
											(QueryRejectNilEstimation
												runOn: (QueryEvolutions new runOn: Tbl allTickets))))))
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeSpentBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMHourFormater new;
		draw:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeOnTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets))))))
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeSpentBugsTicketsPerMonthPerDev [
	^ BugsChart new
		yFormateur: CIMHourFormater new;
		perDev: true;
		draw:
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
												runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets)))))))
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeSpentEvolutionTicketsPerMonth [
	^ EvolutionChart new
		yTranslation: 16160.221023768798;
		yFormateur: CIMHourFormater new;
		draw:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeOnTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets))))))
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeSpentEvolutionTicketsPerMonthPerDev [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		perDev: true;
		draw:
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
												runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets)))))))
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeSpentTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		perDev: true;
		draw:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeOnTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn: (QueryClosed runOn: (QueryCleanData runOn: Tbl allTickets)))))
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeTestBugsTicketsPerMonth [
	^ BugsChart new
		yFormateur: CIMMinuteFormater new;
		draw:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeTestGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets))))))
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeTestBugsTicketsPerMonthPerDev [
	^ BugsChart new
		yFormateur: CIMMinuteFormater new;
		draw:
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
												runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets)))))))
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeTestEvolutionTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMMinuteFormater new;
		yTranslation: 2391.1500956546124;
		draw:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeTestGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets))))))
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeTestEvolutionTicketsPerMonthPerDev [
	^ EvolutionChart new
		yFormateur: CIMMinuteFormater new;
		draw:
		(QueryTimePerDev runOn:	(QueryMovingAverage
				runOn:
					(QueryAvgTimeTestGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets)))))))
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeToOpenCloseBugsTicketsPerMonth [
	^ BugsChart new
		minY: 6e6;
		maxY: 1.6e7;
		yFormateur: CIMDayFormater new;
		draw:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeToOpenCloseTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets))))))
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeToOpenCloseBugsTicketsPerMonthPerDev [
	^ BugsChart new
		yFormateur: CIMDayFormater new;
		draw:
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
												runOn: (QueryBugs runOn: (QueryCleanData runOn: Tbl allTickets)))))))
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeToOpenCloseEvolutionTicketsPerMonth [
	^ EvolutionChart new
		maxY: 1.6e7;
		yFormateur: CIMDayFormater new;
		draw:
			(QueryMovingAverage
				runOn:
					(QueryAvgTimeToOpenCloseTicketsGroupedByTime
						runOn:
							(QueryTicketPerMonthClosing new
								fillGaps: true;
								ordered: true;
								runOn:
									(QueryClosed
										runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets))))))
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeToOpenCloseEvolutionTicketsPerMonthPerDev [
	^ EvolutionChart new
		yFormateur: CIMDayFormater new;
		perDev: true;
		draw:
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
												runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets)))))))
]

{ #category : #drawing }
MainPresenter >> drawMovingTimeSpentTicketsPerMonth [
	^ EvolutionChart new
		yFormateur: CIMHourFormater new;
		draw:
			(QueryTimeOnTicketsGroupedByTime
				runOn:
					(QueryTicketPerMonthClosing new
						fillGaps: true;
						ordered: true;
						runOn: (QueryClosed runOn: (QueryCleanData runOn: Tbl allTickets))))
]
