Class {
	#name : #QueryTicketPerYearClosing,
	#superclass : #QueryPerYear,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #'instance creation' }
QueryTicketPerYearClosing >> year: ticket [
	^ ticket yearClosing
]
