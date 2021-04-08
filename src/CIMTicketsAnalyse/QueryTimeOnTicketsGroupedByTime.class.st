Class {
	#name : #QueryTimeOnTicketsGroupedByTime,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTimeOnTicketsGroupedByTime >> runOn: aCollection [
	^ (aCollection
		collect: [ :aTicketGroupNode | 
			CIMTicketGroupNode new
				value: (QueryTimeOnTickets runOn: aTicketGroupNode tickets);
				addTicket: aTicketGroupNode tickets;
				time: aTicketGroupNode time;
				yourself ]) asOrderedCollection
]
