Class {
	#name : #QueryAvgTimeDevGroupedByTime,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #running }
QueryAvgTimeDevGroupedByTime >> runOn: aDictionary [
	^ (aDictionary keys
		collect:
			[ :key | key -> (QueryAvgTicketsTimeDev runOn: (aDictionary at: key)) ])
		asOrderedDictionary
]
