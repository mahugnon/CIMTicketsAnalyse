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
				value: (QueryAvgTimeOnTickets runOn: groupNode tickets);
				tickets: groupNode tickets ]) asOrderedDictionary
]
