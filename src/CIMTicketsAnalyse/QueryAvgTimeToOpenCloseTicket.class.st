Class {
	#name : #QueryAvgTimeToOpenCloseTicket,
	#superclass : #CIMAbstractQuery,
	#category : #CIMTicketsAnalyse
}

{ #category : #running }
QueryAvgTimeToOpenCloseTicket >> runOn: aCollection [
	^ (aCollection
		inject: 0 asDuration
		into:
			[ :sum :aTicket | sum + (QueryDurationBetweenOpenAndCloseTicket new runOn: aTicket) ])
		/ aCollection size
]
