Class {
	#name : #QueryNumberOfReturnsGroupedByTime,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryNumberOfReturnsGroupedByTime >> runOn: aCollection [
	^ (aCollection
		collect: [ :aCIMGroupNode | 
			| tkts |
			tkts := aCIMGroupNode tickets.
			CIMAverageNode new
				time: aCIMGroupNode time;
				value: (QueryNumberOfReturns runOn: aCIMGroupNode);
				tickets: tkts;
				yourself ]) asOrderedCollection
]
