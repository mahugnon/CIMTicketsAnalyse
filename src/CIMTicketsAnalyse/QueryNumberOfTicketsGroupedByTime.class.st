Class {
	#name : #QueryNumberOfTicketsGroupedByTime,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-SumQueries'
}

{ #category : #running }
QueryNumberOfTicketsGroupedByTime >> runOn: aCollection [
	^ (aCollection
		collect: [ :aCIMGroupNode | 
			CIMSumNode new
				time: aCIMGroupNode time;
				value: aCIMGroupNode tickets size;
				tickets: aCIMGroupNode tickets;
				yourself ]) asOrderedCollection
]
