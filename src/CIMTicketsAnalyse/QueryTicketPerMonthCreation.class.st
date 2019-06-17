Class {
	#name : #QueryTicketPerMonthCreation,
	#superclass : #QueryTicketPerMonth,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #'instance creation' }
QueryTicketPerMonthCreation >> month: ticket [
	^ ticket monthCreation
]
