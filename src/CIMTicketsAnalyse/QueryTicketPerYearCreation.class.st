Class {
	#name : #QueryTicketPerYearCreation,
	#superclass : #QueryPerYear,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryTicketPerYearCreation >> year: aTicket [
	^ aTicket yearCreation
]
