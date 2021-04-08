Class {
	#name : #QueryTimeToOpenCloseTicket,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTimeToOpenCloseTicket >> runOn: aCollection [
	^ aCollection
		inject: 0
		into:
			[ :sum :aTicket | sum + (QueryDurationBetweenOpenAndCloseTicket new runOn: aTicket) ]
]
