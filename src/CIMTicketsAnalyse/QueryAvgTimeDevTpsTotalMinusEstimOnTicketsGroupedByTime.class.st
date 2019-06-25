Class {
	#name : #QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime,
	#superclass : #TimeSerieQueries,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTimeDevTpsTotalMinusEstimOnTicketsGroupedByTime >> runOn: aDictionary [
	^ (aDictionary keys
		collect: [ :key | 
			key
				->
					(QueryAvgTimeDevTpsTotalMinusEstimOnTicket
						runOn: (aDictionary at: key)) ]) asOrderedDictionary
]
