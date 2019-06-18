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
MainPresenter >> drawScaledAvgTimeToOpenCloseBugsTicketsPerMonth [
	^ LineChart new
		draw:
			(QueryScaledAverage new runOn: (QueryAvgTimeToOpenCloseTicketsGroupedByTime new
				runOn:
					(QueryTicketPerMonthClosing new
						runOn: (QueryBugs new runOn: Tbl allTickets))))
]

{ #category : #drawing }
MainPresenter >> drawScaledAvgTimeToOpenCloseEvolutionTicketsPerMonth [
	^ LineChart new
		draw:
			(QueryScaledAverage new
				runOn:
					(QueryAvgTimeToOpenCloseTicketsGroupedByTime new
						runOn:
							(QueryTicketPerMonthClosing new
								runOn: (QueryEvolutions new runOn: Tbl allTickets))))
]
