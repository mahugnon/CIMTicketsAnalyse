Class {
	#name : #QueryAvgTimeOnTicketsGroupedByTime,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTimeOnTicketsGroupedByTime >> runOn: aCollection [
	^ (aCollection
		collect: [ :groupNode | 
			CIMAverageNode new
				value: (QueryAvgTimeOnTickets runOn: groupNode) value;
				tickets: groupNode tickets;
				time: groupNode time ]) asOrderedCollection
]
