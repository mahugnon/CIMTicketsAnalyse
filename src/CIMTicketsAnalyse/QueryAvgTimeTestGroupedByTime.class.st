Class {
	#name : #QueryAvgTimeTestGroupedByTime,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTimeTestGroupedByTime >> runOn: aDictionary [
	^ (aDictionary keys
		collect:
			[ :key | key -> (QueryAvgTicketsTimeTest runOn: (aDictionary at: key)) ])
		asOrderedDictionary
]
