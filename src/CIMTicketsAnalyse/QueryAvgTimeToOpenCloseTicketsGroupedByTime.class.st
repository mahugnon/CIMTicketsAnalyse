Class {
	#name : #QueryAvgTimeToOpenCloseTicketsGroupedByTime,
	#superclass : #CIMAbstractQuery,
	#category : #CIMTicketsAnalyse
}

{ #category : #running }
QueryAvgTimeToOpenCloseTicketsGroupedByTime >> runOn: aDictionary [
	^ aDictionary keys
		collect: [ :key | 
			key
				-> (QueryAvgTimeToOpenCloseTicket new runOn: (aDictionary at: key)) ]
]
