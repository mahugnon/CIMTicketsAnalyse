Class {
	#name : #QueryAvgTimeOnTicketsGroupedByTime,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTimeOnTicketsGroupedByTime >> runOn: aDictionary [
	^ (aDictionary keys
		collect:
			[ :key | key -> (QueryAvgTimeOnTickets  runOn: (aDictionary at: key)) ])
		asOrderedDictionary
]
