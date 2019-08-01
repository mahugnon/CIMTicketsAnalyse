Class {
	#name : #QueryAvgTimeDevTpsEstimOnTicketGroupedByTime,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #running }
QueryAvgTimeDevTpsEstimOnTicketGroupedByTime >> runOn: aDictionary [
	^ (aDictionary keys
		collect:
			[ :key | key -> (QueryAvgTimeDevTpsEstimOnTicket runOn: (aDictionary at: key)) ])
		asOrderedDictionary
]
