Class {
	#name : #QueryAvgTimeToOpenCloseTicketsGroupedByTime,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTimeToOpenCloseTicketsGroupedByTime >> runOn: aCollection [
	^ (aCollection
		collect: [ :node | 
			CIMAverageNode new
				value: (QueryAvgTimeToOpenCloseTicket new runOn: node) value;
				tickets: node tickets;
				ticketGroup: node;
				time: node time ]) asOrderedCollection
]
