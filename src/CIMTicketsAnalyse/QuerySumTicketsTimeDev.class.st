Class {
	#name : #QuerySumTicketsTimeDev,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-SumQueries'
}

{ #category : #running }
QuerySumTicketsTimeDev >> runOn: aTicketGroupNode [
	^ CIMAverageNode new
		value:
			(aTicketGroupNode isEmpty
				ifTrue: [ 0 ]
				ifFalse: [ (QueryTicketsTimeDev runOn: aTicketGroupNode) asFloat ]);
		tickets: aTicketGroupNode tickets;
		yourself
]
