Class {
	#name : #QueryAvgTimeDevGroupedByTime,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #running }
QueryAvgTimeDevGroupedByTime >> runOn: aCollection [
	^ (aCollection
		collect: [ :aCIMGroupNode | 
			CIMAverageNode new
				time: aCIMGroupNode time;
				value: (QueryAvgTicketsTimeDev runOn: aCIMGroupNode) value;
				tickets: aCIMGroupNode tickets;
				yourself ]) asOrderedCollection
]
