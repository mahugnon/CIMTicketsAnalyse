Class {
	#name : #QueryAvgTicketsTimeTest,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTicketsTimeTest >> runOn: aTicketGroupNode [
	^ aTicketGroupNode isEmptyOrNil
		ifTrue: [ 0 ]
		ifFalse:
			(CIMAverageNode new
				value:
					(QueryTicketsTimeRCTest
						runOn: aTicketGroupNode tickets / aTicketGroupNode size) asFloat;
				ticketGroup: aTicketGroupNode;
				yourself)
]
