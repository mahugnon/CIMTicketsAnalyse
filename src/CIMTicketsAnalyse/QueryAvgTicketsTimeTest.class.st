Class {
	#name : #QueryAvgTicketsTimeTest,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTicketsTimeTest >> runOn: aTicketGroupNode [
	aTicketGroupNode isEmptyOrNil
		ifTrue: [ 0 ]
		ifFalse:
			(CIMAverageNode new
				value:
					(QueryTicketsTimeTest
						runOn: aTicketGroupNode tickets / aTicketGroupNode size) asFloat;
				ticketGroup: aTicketGroupNode;
				yourself)
]
