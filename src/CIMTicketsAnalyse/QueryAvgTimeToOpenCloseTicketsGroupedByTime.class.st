Class {
	#name : #QueryAvgTimeToOpenCloseTicketsGroupedByTime,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTimeToOpenCloseTicketsGroupedByTime >> runOn: aDictionary [
	^ (aDictionary keys
		collect:
			[ :key | key -> (QueryAvgTimeToOpenCloseTicket runOn: (aDictionary at: key)) ])
		asOrderedDictionary
]
