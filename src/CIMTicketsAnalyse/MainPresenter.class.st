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
	^ LineChart new title: 'AvgTimeDevEvolutionsTicketsPerMonth';
		draw:
			(QueryAvgTimeDevGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn: (QueryCleanData runOn: (QueryEvolutions new runOn: Tbl allTickets)))))
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeDevTpsTotalMinusEstimBugsTicketsPerMonth [
	^ LineChart new title: 'AvgTimeDevEvolutionsTicketsPerMonth';
		draw:
			(QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn:
							(QueryClosed
								runOn: (QueryRejectNilEstimation runOn: (QueryBugs new runOn: Tbl allTickets)))))
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
MainPresenter >> drawAvgTimeTestBugsTicketsPerMonth [
	^ LineChart new title: 'AvgTimeTestBugsTicketsPerMonth';
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
	^ LineChart new
		title: 'AvgTimeTestEvolutionsTicketsPerMonth';
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
	^ LineChart new title: 'AvgTimeToOpenCloseEvolutionTicketsPerMonth';
		draw:
			(QueryAvgTimeToOpenCloseTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn: (QueryEvolutions new runOn: Tbl allTickets)))
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeDevBugsTicketsPerMonth [
	^ LineChart new title: 'MovingAvgTimeDevBugsTicketsPerMonth';
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
	^ LineChart new title: 'MovingAvgTimeDevEvolutionTicketsPerMonth';
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
										runOn: (QueryEvolutions runOn: (QueryCleanData runOn: Tbl allTickets))))))
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeDevTpsTotalMinusEstimEvolutionsTicketsPerMonth [
	^ LineChart new
		title: 'MovingAvgTimeDevTpsTotalMinusEstimEvolutionsTicketsPerMonth';
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
	^ LineChart new
		title: 'drawMovingAvgTimeSpentBugsTicketsPerMonth';
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
MainPresenter >> drawMovingAvgTimeSpentEvolutionTicketsPerMonth [
	^ LineChart new
		title: 'MovingAvgTimeSpentEvolutionTicketsPerMonth';
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
MainPresenter >> drawMovingAvgTimeTestBugsTicketsPerMonth [
	^ LineChart new
		title: 'MovingAvgTimeTestBugsTicketsPerMonth';
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
MainPresenter >> drawMovingAvgTimeTestEvolutionTicketsPerMonth [
	^ LineChart new
		title: 'MovingAvgTimeTestEvolutionTicketsPerMonth';
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
MainPresenter >> drawMovingAvgTimeToOpenCloseBugsTicketsPerMonth [
	^ LineChart new
		title: 'MovingAvgTimeToOpenCloseBugsTicketsPerMonth';
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
MainPresenter >> drawMovingAvgTimeToOpenCloseEvolutionTicketsPerMonth [
	^ LineChart new
		title: 'MovingAvgTimeToOpenCloseEvolutionTicketsPerMonth';
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
