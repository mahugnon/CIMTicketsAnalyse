Class {
	#name : #QueryBugsEvolutions,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryBugsEvolutions >> runOn: aCollection [
	^ CIMTicketGroupNode new
		addTickets:
			(aCollection
				select: [ :ticket | ticket isEvolution or: [ ticket isBug ] ]);
		yourself
]
