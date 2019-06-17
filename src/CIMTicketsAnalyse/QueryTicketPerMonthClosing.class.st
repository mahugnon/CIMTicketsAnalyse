Class {
	#name : #QueryTicketPerMonthClosing,
	#superclass : #QueryTicketPerMonth,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #'instance creation' }
QueryTicketPerMonthClosing >> month: ticket [
	^ticket monthClosing
]
