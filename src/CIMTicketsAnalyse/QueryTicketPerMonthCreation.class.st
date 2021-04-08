Class {
	#name : #QueryTicketPerMonthCreation,
	#superclass : #QueryPerMonth,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #'instance creation' }
QueryTicketPerMonthCreation >> month: ticket [
	^ ticket monthCreation
]
