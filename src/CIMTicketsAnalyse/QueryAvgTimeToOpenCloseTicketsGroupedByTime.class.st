Class {
	#name : #QueryAvgTimeToOpenCloseTicketsGroupedByTime,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTimeToOpenCloseTicketsGroupedByTime >> runOn: aDictionary [
	^ (aDictionary keys
		collect: [ :key | 
			key
				-> (QueryAvgTimeToOpenCloseTicket new runOn: (aDictionary at: key)) ])
		asOrderedDictionary
]
