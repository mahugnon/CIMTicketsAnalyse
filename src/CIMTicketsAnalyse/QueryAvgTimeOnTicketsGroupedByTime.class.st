Class {
	#name : #QueryAvgTimeOnTicketsGroupedByTime,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTimeOnTicketsGroupedByTime >> runOn: aDictionary [
	^ aDictionary keys
		collect:
			[ :key | key -> (QueryAvgTimeOnTickets new runOn: (aDictionary at: key)) ]
]
