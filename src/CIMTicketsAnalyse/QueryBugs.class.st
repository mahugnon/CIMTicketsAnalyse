Class {
	#name : #QueryBugs,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryBugs >> runOn: aTicketGroupNode [
	^ CIMTicketGroupNode new
		tickets: (aTicketGroupNode tickets  select: #isBug);
		yourself
]
