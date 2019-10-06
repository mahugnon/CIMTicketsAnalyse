Class {
	#name : #QueryTicketHasFeedBacks,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketHasFeedBacks >> runOn: aCIMTicketGroupNode [
	^ CIMTicketGroupNode new
		tickets: (aCIMTicketGroupNode tickets select: #hasFeedBacks);
		yourself
]
