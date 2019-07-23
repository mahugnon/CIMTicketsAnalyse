Class {
	#name : #QueryTimeOnTicketsGroupedByTime,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTimeOnTicketsGroupedByTime >> runOn: aDictionary [
	^ (aDictionary keys
		collect: [ :key | key -> (QueryTimeOnTickets runOn: (aDictionary at: key)) ])
		asOrderedDictionary
]
