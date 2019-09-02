Class {
	#name : #QueryBugsEvolutions,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryBugsEvolutions >> runOn: aTicketGroupNode [
	^ CIMTicketGroupNode new
		tickets:
			(aTicketGroupNode tickets
				select: [ :ticket | ticket isEvolution or: [ ticket isBug ] ]);
		yourself
]
