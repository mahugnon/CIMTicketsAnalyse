Class {
	#name : #QueryTicketsTimeRCTest,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketsTimeRCTest >> runOn: aCIMTicketGroNode [
	^ aCIMTicketGroNode tickets
		inject: 0
		into: [ :sum :ticket | sum + (QueryTicketTimeRCTest runOn: ticket) ]
]
