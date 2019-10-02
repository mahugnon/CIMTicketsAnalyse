Class {
	#name : #QueryAvgTicketsTimeRCTest,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTicketsTimeRCTest >> runOn: aCIMTicketGroNode [
	^ CIMAverageNode new
		tickets: aCIMTicketGroNode tickets;
		value:
			((QueryTicketsTimeRCTest runOn: aCIMTicketGroNode)
				/ aCIMTicketGroNode size) asFloat;
		yourself
]
