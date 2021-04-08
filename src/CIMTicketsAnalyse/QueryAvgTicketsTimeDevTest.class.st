Class {
	#name : #QueryAvgTicketsTimeDevTest,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTicketsTimeDevTest >> runOn: aCIMTicketGroNode [
	^ CIMAverageNode new
		tickets: aCIMTicketGroNode tickets;
		value:
			((QueryTicketsTimeDevTest runOn: aCIMTicketGroNode)
				/ aCIMTicketGroNode size) asFloat;
		yourself
]
