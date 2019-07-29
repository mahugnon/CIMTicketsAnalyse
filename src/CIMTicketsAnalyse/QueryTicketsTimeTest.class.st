Class {
	#name : #QueryTicketsTimeTest,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketsTimeTest >> runOn: aCollection [
	^ aCollection
		inject: 0
		into: [ :sum :ticket | sum + (QueryTicketTimeTest runOn: ticket) ]
]
