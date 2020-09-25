Class {
	#name : #QuerySumTimeDevGroupedByTime,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-SumQueries'
}

{ #category : #running }
QuerySumTimeDevGroupedByTime >> runOn: aCollection [
	^ (aCollection
		collect: [ :aCIMGroupNode | 
			CIMSumNode new
				time: aCIMGroupNode time;
				value: (QuerySumTicketsTimeDev runOn: aCIMGroupNode) value;
				tickets: aCIMGroupNode tickets;
				yourself ]) asOrderedCollection
]
