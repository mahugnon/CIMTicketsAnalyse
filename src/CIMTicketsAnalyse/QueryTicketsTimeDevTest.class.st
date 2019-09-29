Class {
	#name : #QueryTicketsTimeDevTest,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketsTimeDevTest >> runOn: aCIMTicketGroNode [
	^ aCIMTicketGroNode tickets
		inject: 0
		into: [ :sum :ticket | sum + (QueryTicketTimeDevTest runOn: ticket) ]
]
