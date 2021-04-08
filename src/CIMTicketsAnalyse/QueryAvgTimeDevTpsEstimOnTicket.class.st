Class {
	#name : #QueryAvgTimeDevTpsEstimOnTicket,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #running }
QueryAvgTimeDevTpsEstimOnTicket >> runOn: aTicketGroupNode [
	^ CIMAverageNode new
		value:
			(aTicketGroupNode isEmptyOrNil
				ifTrue: [ ^ 0 asDuration totalSeconds ]
				ifFalse: [ ^ ((aTicketGroupNode tickets
						inject: 0 asDuration
						into: [ :sum :ticket | sum + (ticket devTpsEstim ifNil: [ 0 asDuration ]) ])
						/ aTicketGroupNode size) totalSeconds asFloat ]);
		ticketGroup: aTicketGroupNode;
		yourself
]
