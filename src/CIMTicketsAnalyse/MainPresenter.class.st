Class {
	#name : #MainPresenter,
	#superclass : #Object,
	#category : #'CIMTicketsAnalyse-RoassalPresenters'
}

{ #category : #drawing }
MainPresenter >> drawAvgTimeToOpenCloseBugsTicketsPerMonth [
	^ LineChart new
		draw:
			(QueryAvgTimeToOpenCloseTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn: (QueryBugs new runOn: Tbl allTickets)))
]

{ #category : #drawing }
MainPresenter >> drawAvgTimeToOpenCloseEvolutionTicketsPerMonth [
	^ LineChart new
		draw:
			(QueryAvgTimeToOpenCloseTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn: (QueryEvolutions new runOn: Tbl allTickets)))
]

{ #category : #drawing }
MainPresenter >> drawMovingAvgTimeDevEvolutionTicketsPerMonth [
	^ LineChart new
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
MainPresenter >> drawScaledAvgTimeSpentBugsTicketsPerMonth [
	^ LineChart new
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
MainPresenter >> drawScaledAvgTimeSpentEvolutionTicketsPerMonth [
	^ LineChart new
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
MainPresenter >> drawScaledAvgTimeToOpenCloseBugsTicketsPerMonth [
	^ LineChart new
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
MainPresenter >> drawScaledAvgTimeToOpenCloseEvolutionTicketsPerMonth [
	^ LineChart new
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
