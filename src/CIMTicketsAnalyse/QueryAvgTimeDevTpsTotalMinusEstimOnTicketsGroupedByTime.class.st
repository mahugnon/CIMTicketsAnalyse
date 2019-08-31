Class {
	#name : #QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #running }
QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime >> runOn: aCollection [
	^ (aCollection
		collect: [ :ticketGroupNode | 
			CIMAverageNode new
				time: ticketGroupNode time;
				tickets: ticketGroupNode tickets;
				value:
					(QueryAvgTimeDevTpsTotalMinusEstimOnTicket
						runOn: ticketGroupNode tickets);
				yourself ]) asOrderedCollection
]
