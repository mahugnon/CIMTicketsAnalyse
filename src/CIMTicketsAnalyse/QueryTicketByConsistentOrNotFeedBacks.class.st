Class {
	#name : #QueryTicketByConsistentOrNotFeedBacks,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketByConsistentOrNotFeedBacks >> runOn: aTicketGroupNode [
	^ {('Consistent'
		-> (aTicketGroupNode tickets select: #hasConsistentFeedBacks)).
	('Inconsistent'
		-> (aTicketGroupNode tickets select: #hasInconsistentFeedBacks))}
		asOrderedDictionary
]
