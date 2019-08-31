Class {
	#name : #QueryBugs,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryBugs >> runOn: aCollection [
	^ CIMTicketGroupNode new
		tickets: (aCollection select: [ :ticket | ticket isBug ]);
		yourself
]
