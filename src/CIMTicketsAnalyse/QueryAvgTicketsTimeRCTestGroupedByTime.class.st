Class {
	#name : #QueryAvgTicketsTimeRCTestGroupedByTime,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTicketsTimeRCTestGroupedByTime >> runOn: aCIMTicketGroNode [
	^ (QueryAvgTicketsTimeRCTest runOn: aCIMTicketGroNode)
		time: aCIMTicketGroNode time
]
