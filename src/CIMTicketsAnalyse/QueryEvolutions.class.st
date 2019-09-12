Class {
	#name : #QueryEvolutions,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryEvolutions >> runOn: aTicketGroupNode [
	^ CIMTicketGroupNode new
		tickets: (aTicketGroupNode tickets select: [ :ticket | ticket isEvolution ]);
		yourself
]
