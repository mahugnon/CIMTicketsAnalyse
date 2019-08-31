Class {
	#name : #QueryEvolutions,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryEvolutions >> runOn: aTicketGroupNode [
	^ aTicketGroupNode
		tickets: (aTicketGroupNode tickets select: [ :ticket | ticket isEvolution ])
]
