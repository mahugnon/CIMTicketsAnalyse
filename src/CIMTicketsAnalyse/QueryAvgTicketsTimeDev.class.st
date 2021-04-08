Class {
	#name : #QueryAvgTicketsTimeDev,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #running }
QueryAvgTicketsTimeDev >> runOn: aTicketGroupNode [
	^ CIMAverageNode new
		value:
			(aTicketGroupNode isEmpty
				ifTrue: [ 0 ]
				ifFalse: [ ((QueryTicketsTimeDev runOn: aTicketGroupNode)
						/ aTicketGroupNode size) asFloat ]);
		tickets: aTicketGroupNode tickets;
		yourself
]
