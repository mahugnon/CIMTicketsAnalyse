"
I group tickets by closing date
"
Class {
	#name : #QueryTicketPerMonthClosing,
	#superclass : #QueryTicketPerMonth,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #'instance creation' }
QueryTicketPerMonthClosing >> month: ticket [
	^ticket monthClosing
]
