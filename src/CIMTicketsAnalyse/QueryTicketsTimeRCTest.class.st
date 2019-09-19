Class {
	#name : #QueryTicketsTimeRCTest,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketsTimeRCTest >> runOn: aCollection [
	^ aCollection
		inject: 0
		into: [ :sum :ticket | sum + (QueryTicketTimeRCTest runOn: ticket) ]
]
